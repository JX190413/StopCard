package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.*;


import com.cykj.stopcard.service.AdminLoginService;
import com.cykj.stopcard.util.GetTon;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

//后台端控制层
@Controller
public class LoginController
{
	private static String accessToken;
	@Resource
	private AdminLoginService adminLoginService;
//后台账号密码的登录
	@RequestMapping("/Login")
	public ModelAndView AdminLogin(Worker worker, HttpSession httpSession)
	{
		System.out.println("进来了吗");
		System.out.println(worker.getWorkeraccount());
		System.out.println(worker.getWorkerpass());
		ModelAndView mv = new ModelAndView();
		Worker worker1 = adminLoginService.queryAdmin(worker);
		if (worker1 != null)
		{

			if("启用".equals(worker1.getStatename())){

				//调用查询菜单方法
				LinkedHashMap<String, ArrayList<AdminMenu>> map=queryMenu(worker1);

				httpSession.setAttribute("workeraccount",worker1.getWorkeraccount());
				mv.addObject("worker1",worker1);
				mv.addObject("map",map);
				mv.addObject("flage","1");
				mv.setViewName("Admin");
				return mv;

			}else {

				mv.addObject("flage","3");

			}

		   }else  if(worker1 == null){
			mv.addObject("flage","2");
		  }
		    mv.setViewName("AdminLogin");
              return mv;
	}
//添加后台管理员
    @RequestMapping("/addface")
    @ResponseBody
    public Msg AddWorker(Worker worker){

	int i= adminLoginService.save(worker);
	    Msg msg=new Msg();
	    if(i>0){

		    msg.setMsg("1");

	    }else {
		    msg.setMsg("2");
	    }
	    return msg;



    }



//后台人脸识别的登录
@RequestMapping("/facelogin.action")
@ResponseBody
public Worker onListStudent(HttpServletRequest request,
                            HttpServletResponse response,HttpSession httpSession, Model model) {
	// 获取前端页面传过来的参数
	String base = request.getParameter("base");
	try {
		Worker u = new Worker();
		u.setFace(base.getBytes());
		//把前端抓取到的图片保存到数据库
//				      adminLoginService.save(u);
		List<Worker> users = adminLoginService.selectAllUsers();
		String base64 = "";
		PrintWriter writer = response.getWriter();
		response.reset();
		for (Worker user : users) {
			base64 = new String(user.getFace());
			boolean result = getResult(base, base64);
			if (result==true) {
				Worker worker=new Worker();
				worker.setWorkeraccount(user.getWorkeraccount());
				worker.setWorkerpass(user.getWorkerpass());
				worker.setFlage(true);
				//					request.getSession().setAttribute("user", user);
				// 把result转换成json格式字符串
				// 发送给客户端
				//					writer.print(result);
				//					writer.close();
				return worker;


			}
			//				else {
			//
			////					System.out.println("00"+result);
			////					writer.print(result);
			////					writer.close();
			//				}

		}

	} catch (Exception e) {
		e.printStackTrace();
		//			return "redirect:/page/404.jsp";
	}

	return null;
}


	//用户查询界面
	@RequestMapping(value = "/WorkerView")
	public String tableView(){
		String index="Personnel";
		return index;
	}





//查询所有的工作人员
	@RequestMapping("/WorkerTable")
	@ResponseBody
   public Msg selectWorker(String workeraccount,String page){
          Worker worker=new Worker();
		int num=Integer.valueOf(page);
		int newpage=(num-1)*5;
		worker.setWorkeraccount(workeraccount);
		worker.setPage(newpage);
		List<Worker>	workerList=adminLoginService.queryWorker(worker);
		List<Worker>	workers=adminLoginService.queryPage(worker);
		Msg msg=new Msg();
		msg.setCode(0);
		msg.setCount(workers.size());
		msg.setData(workerList);
		return  msg;
	}























	/** 人脸识别 比对 */
	public boolean getResult(String imStr1, String imgStr2) {

		accessToken = GetTon.getToken();
		boolean flag = false;
		BufferedReader br = null;
		String result = "";
		// 定义请求地址
		String mathUrl = "https://aip.baidubce.com/rest/2.0/face/v3/match";
		try {
			//页面抓拍到的人脸
			List<JSONObject> images = new ArrayList<>();
			JSONObject image1 = new JSONObject();
			image1.put("image", imStr1);
			image1.put("image_type", "BASE64");
			image1.put("face_type", "LIVE");
			image1.put("quality_control", "LOW");
			image1.put("liveness_control", "NORMAL");

			//数据库中人脸
			JSONObject image2 = new JSONObject();
			image2.put("image", imgStr2);
			image2.put("image_type", "BASE64");
			image2.put("face_type", "LIVE");
			image2.put("quality_control", "LOW");
			image2.put("liveness_control", "NORMAL");
			images.add(image1);
			images.add(image2);
			// 调用百度云 【人脸对比】接口
			String genrearlURL = mathUrl + "?access_token=" + accessToken;
			// 创建请求对象
			URL url = new URL(genrearlURL);
			// 打开请求链接
			HttpURLConnection connection = (HttpURLConnection) url
					.openConnection();
			// 设置请求方法
			connection.setRequestMethod("POST");
			// 设置通用的请求属性
			connection.setRequestProperty("Content-Type",
					"application/json");
			connection.setRequestProperty("Connection", "Keep-Alive");
			connection.setDoInput(true);
			connection.setDoOutput(true);
			// 获得请求输出流对象
			DataOutputStream out = new DataOutputStream(
					connection.getOutputStream());
			out.writeBytes(images.toString());
			// 刷新流
			out.flush();
			// 关闭流
			out.close();
			// 建立实际链接
			connection.connect();
			// 读取URL的响应
			br = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String line = "";
			while ((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
		} catch (Exception e) {
			e.printStackTrace();
		}


		// result ="{"error_msg":"Unsupported openapi method","error_code":3}"
		System.out.println(result);
		JSONObject fromObject = JSONObject.fromObject(result);

		JSONObject jsonArray = fromObject.getJSONObject("result");

		double resultList = jsonArray.getDouble("score");
		if (resultList >= 90) {
			System.out.println("tttt");
			flag = true;

		}
		return flag;
	}









//菜单的方法
	public LinkedHashMap<String, ArrayList<AdminMenu>> queryMenu(Worker worker)
	{
		LinkedHashMap<String, ArrayList<AdminMenu>> map = new LinkedHashMap<>();

		ArrayList<AdminMenu> menu = adminLoginService.queryMenu(worker);
		for (int i = 0; i < menu.size(); i++)
		{
			String first = menu.get(i).getFathername();
			if (map.containsKey(first))
			{
				ArrayList<AdminMenu> arrayList = map.get(first);
				arrayList.add(menu.get(i));

			} else
			{

				ArrayList<AdminMenu> arrayList = new ArrayList<>();

				arrayList.add(menu.get(i));
				map.put(first, arrayList);
			}
		}


		return map;
	}



	//设备自助管理界面
	@RequestMapping("/Devic")
	//	@Log(operationType="设备自助管理界面",operationName="管理员打开设备自助管理界面")
	public String Devic(){

		return "Devic";
	}

	//月缴产品管理界面
	@RequestMapping("/MonthlyPayment")
//	@Log(operationType="月缴产品管理界面",operationName="管理员打开月缴产品管理界面")
	public String MonthlyPayment(){

		return "MonthlyPayment";
	}



	//自助设备管理表格显示
	@RequestMapping("/Devic.action")
	@ResponseBody
//	@Log(operationType="自助设备管理表格显示",operationName="管理员打开自助设备管理表格显示方法")
	public Msg Devic(Devic devic, String page){

		Msg msg = new Msg();
		devic.setPage((Integer.valueOf(page) -1)*5);

		List<Devic>  list= adminLoginService.devictb(devic);
		List<Devic>  pageList= adminLoginService.devictbzong(devic);
//		System.out.println("list----------"+list.size());
		int mun = pageList.size();
		msg= new Msg(0,"",mun,list);
		return msg;
	}

	//自助设备增加
	@RequestMapping("/adddevic.action")
	@ResponseBody
//	@Log(operationType="增加",operationName="管理员进行增加用户")
	public Msg adddevic(Devic devic)
	{

		//System.out.println("自助设备区域---------"+devic.getDevicearea());
		//System.out.println("自助设备名字---------"+devic.getDevicname());
		Msg msg =new Msg();

		List<Devic> listrepeat=adminLoginService.repeatevic(devic);
		if (listrepeat.size()>0){
			msg.setMsg("3");
		}else {
			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String time =sdf.format(date);
			devic.setDevictime(time);
			int i =adminLoginService.adddevic(devic);

			if (i>0){
				msg.setMsg("1");
			}else {
				msg.setMsg("2");
			}
			return msg;
		}


		return msg;
	}


	//自助设备删除
	@RequestMapping("/deletedevic.action")
	@ResponseBody
//	@Log(operationType="设备删除",operationName="管理员进行设备删除")
	public Msg deletedevic(Devic devic)
	{

		int i =adminLoginService.deletedevic(devic);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}



	//自助设备修改
	@RequestMapping("/revisedevic.action")
	@ResponseBody
//	@Log(operationType="设备修改",operationName="管理员进行设备修改")
	public Msg revisedevic(Devic devic)
	{

		int i =adminLoginService.revisedevic(devic);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//自助设备状态修改
	@RequestMapping("/state.action")
	@ResponseBody
//	@Log(operationType="设备状态修改",operationName="管理员进行设备状态修改")
	public Msg state(Devic devic)
	{
		//System.out.println("进入修改-------------"+devic.getStatename());

		if(devic.getStatename().equals("启用")){
			devic.setState(2);
			//System.out.println("启用进去");
		}else if (devic.getStatename().equals("禁用")){
			devic.setState(1);
		}
		//System.out.println("setState------"+devic.getState());
		int i =adminLoginService.state(devic);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//月缴产品管理表格显示
	@RequestMapping("/MonthlyPayment.action")
	@ResponseBody
//	@Log(operationType="自助设备管理表格显示",operationName="管理员打开自助设备管理表格显示方法")
	public Msg MonthlyPayment(Combo combo, String page){

		Msg msg = new Msg();
		combo.setPage((Integer.valueOf(page) -1)*5);
		List<Combo>  list= adminLoginService.MonthlyPaymenttb(combo);
		List<Combo>  pageList= adminLoginService.MonthlyPaymentzong(combo);

		int mun = pageList.size();
		msg= new Msg(0,"",mun,list);
		return msg;
	}


	//月缴产品增加
	@RequestMapping("/addMonthlyPayment.action")
	@ResponseBody
//	@Log(operationType="增加",operationName="管理员进行增加用户")
	public Msg addMonthlyPayment(Combo combo)
	{
		//		Date date = new Date();
		//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//		String time =sdf.format(date);
		//		devic.setDevictime(time);
		Msg msg =new Msg();
		List<Combo> listrepeat=adminLoginService.repeatMonthlyPayment(combo);
		if (listrepeat.size()>0){
			msg.setMsg("3");
		}else {

			int i =adminLoginService.addMonthlyPayment(combo);

			if (i>0){
				msg.setMsg("1");
			}else {
				msg.setMsg("2");
			}
			return msg;
		}


		return msg;
	}

	//月缴产品删除
	@RequestMapping("/deMonthlyPayment.action")
	@ResponseBody
//	@Log(operationType="设备删除",operationName="管理员进行设备删除")
	public Msg deMonthlyPayment(Combo combo)
	{

		int i =adminLoginService.deMonthlyPayment(combo);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}

	@RequestMapping("ECharsDemo")
	//    @ResponseBody()
//	@Log(operationType="南丁格尔玫瑰图界面",operationName="南丁格尔玫瑰图界面显示方法")
	public ModelAndView ECharsDemo(){
		//		String index="ECharsDemo";
		//		return index;
		ModelAndView mv = new ModelAndView();
		mv.setViewName("ECharsDemo");
		return mv;
	}




	//南丁格尔玫瑰图显示
	@RequestMapping("/ECharts.action")
	@ResponseBody
//	@Log(operationType="南丁格尔玫瑰图数据",operationName="南丁格尔玫瑰图数据显示方法")
	public Cost ECharts(){

		Cost cost = new Cost();
//		List<Cost> list2=new ArrayList<Cost>();
		List<Cost>  list= adminLoginService.ECharts();

		List<Cost>  monthlist= adminLoginService.EChartsmonth();
		//		System.out.println("----------------"+monthlist.size());
		int sum=0;
		for (int i = 0; i < list.size(); i++)
		{
			sum+=list.get(i).getMoney();

		}
		cost.setMoney(sum);
		cost.setPaytype("临时缴费");

		int sum2=0;
		for (int i1 = 0; i1 < monthlist.size(); i1++)
		{
			sum2+=monthlist.get(i1).getSellmoney();

		}
		cost.setSellmoney(sum2);
		cost.setMonthpaytype("月缴产品");

		System.out.println("临时停车总收入"+cost.getMoney());
		System.out.println("收入类型-----"+cost.getPaytype());


		System.out.println("月缴产品总收入"+cost.getSellmoney());
		System.out.println("收入类型-----"+cost.getMonthpaytype());

		//	    for (list2.size()){}

		return cost;
	}

  }


