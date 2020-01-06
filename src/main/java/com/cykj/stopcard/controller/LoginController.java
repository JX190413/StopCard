package com.cykj.stopcard.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.cykj.stopcard.bean.*;


import com.cykj.stopcard.log.Log;
import com.cykj.stopcard.service.AdminLoginService;
import com.cykj.stopcard.service.AdminService;
import com.cykj.stopcard.util.GetTon;
import com.cykj.stopcard.util.Tool;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

//后台端控制层
@Controller
public class LoginController
{
	private static String accessToken;
	private final String APP_ID = "2016101600697321";
	private final String APP_PRIVATE_KEY = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCKOCt4RTZ88ldF3MNVpgIgANL3I1NW8JWHTEouQCmmN5MFzgYrgAlzCPwWmHjTgXdDGXdUkDUrtTEg84T+Z0z4BTpLgO9I/hPegiubhfCvY/z5VbPA/rMrfl04sCUofDNoLp5/vCeTuo1JKQmxpn7xlNwaQffVKVZ1mouZWsaMhi2M8gCGt+12Zd87x7Q+3QXy0tQUcLIdQfY0E3FGNtj+35eI95x2TIdH7Aj1jxRWnINmQTV8MCiOmEQWObqG6raAlzzFg+MwpUwGDCD7Gjqiyp8lExqGudFaohu784xrSZt+0ifj7QbmAbZbusN358oNbJ99mPh4UaNUbjjN96nRAgMBAAECggEAfL83VIQ7Kkfaxp352jpLHrE/tne2hvf6LLOJG/ci3/a2hf2tCeO0I5PPWWFhY5sslW3Nio/gvUL6RUAkHywChrLJK04CKQHP0vnu+53GXbXDoxFbe+sksDOLVVd9Ie3+w5+Xw7eAjM9JJueX7TNUzRrKEBTL5iI5+0hxiAYqvrYhDTkqYi1JJUH0QW9BtYH4C0GV6Dhdw/zYmsH2WNi8ZLpyuRIvhK5vWQVJtwWXTzYh3QP7qMlt498ZkRkwh+KJvccC8WrosKu9ed9qDxxSK+rHaDebAqXmQ3gO9LzgZql7GLIJV7c0X0o2laUAswGAFknfd+QJ9ugeniYn681vVQKBgQDU5E1CxinCwFLHjgCFqrtFt08UaO6GEQwQuA10YjzJJqgO08Mwr9XUjKbP2LA0H+motdt+xyxhAm+czq1E1RYGjQWJqo/fde0EuBu550dKebDNOgJQksq3r1BWUShMtZUC/rFXTkVUO8pD2LhW779lLA/nbCSfRZrRitsLb5YIPwKBgQCmNRD2KH/RZSpgDQO/g17lLzYq64GXmA01zUaa8Fmwbj/juF+QlxobpnQ8TRwZWn1fRz948UPkb5ozzCpkWhD2HdD7No7ig21WcPq+HveRzbtGz29rt5IugvNFRwKknJccFwDnZP4OH4jarPVwNNMYrV15IFc+LsDsV9oa5HRJ7wKBgFsoPqTe8TbA3zEvbq3Ng07AxQ26OJgTaJUoGirBfcGr2b4vkp6gS/EtIKhS4nAPUh+5bvkEE86eGmiMXsjgbQP1Em/2JpDKj+i7ZLPfgjkzji7yLdeOY1rvqHitW5ItFlcn84usqib9SwhuHdCr68pIaa7wMWY5iac7y7tD1nxFAoGAUu61qO4qYRRmoYi87wmhByCYma/rePXg2ZC1A0icqCFK9digrqgG2fcjlpcvRyNU3X7SmAlixBA/1EqyeGJMhlH4XfEqOLI1k2VKaCVRiMosATguM4Rkh5rFwjKdif+sktKTm+JTtj5b7ilRSozBLFYNBwxxG9D+aK+pX7PQprcCgYA5Lo8inqoBhxNr4EEcSuSS887j/ivbslrShwA2yRjw9R8RjYl25bEuW9WekXgN3Pe8NZZJyXngVfuJS/Ns0iBkLT1yi7UI/yfc7V3dkvh7Q+eV9XylR+/zKGL0MLztj5BiAoSRcGuxhMfe06mZ/yRN51LDMcaIx2wTEmRDBvPnsQ==";
	private final String CHARSET = "UTF-8";
	private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApKhxMVHzVFsSnlvICg/98bGq12VFzamp0jxIDpi89bLPvXJVTusRDU7jRoRRjPjKCprxwDvT2lHJV8sAPQbXn7NfMPbhdit4Xz4+0+yOxxtUpal+iRwmNeGKT+s+6n5SFuEnCleNJVWrlObwZDhYBwmBB8kf5I2/IYEiTZf/yhHfxAFbksJcHlMslB1BJvkCyrz0dCtpUVrwwKlUnxzWPNFUAC9p4hD7knlsLSGm1G+pgxxNGvrzjQ0DBbwyOF4F08h2uYdbitikrHoBFNoCkA14yD1iHAfI8y1kweVWZEDEhVgvsehVwFtICXjgO3qjdEQNo282H084HXyinBzz8wIDAQAB";
	//这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
	private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
	private final String FORMAT = "JSON";
	//签名方式
	private final String SIGN_TYPE = "RSA2";
	//支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
	private final String NOTIFY_URL = "http://公网地址/notifyUrl";
	//支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
	private final String RETURN_URL = "http://localhost:8080/StopCard/returnUrl";


	@Resource
	private AdminLoginService adminLoginService;
	@Resource
	private AdminService adminService;
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
				//调用查询参数方法
				Map<String,Object> map2=adminService.queryParameter();
//				httpSession.setAttribute("username",worker1.getWorkeraccount());
				httpSession.setAttribute("workeraccount",worker1.getWorkeraccount());
				mv.addObject("worker1",worker1);
				mv.addObject("map",map);
				mv.addObject("map2",map2);
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
    @Log(operationType="添加后台管理员",operationName="超级管理员进行添加后台管理员")

    public Msg AopAddWorker(Worker worker){
	    //获取当前系统时间
	    Date currentTime = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String dateString = formatter.format(currentTime);
	    worker.setWorktime(dateString);
    UpdateRole updateRole=new UpdateRole();
	int i= adminLoginService.save(worker);
	    Msg msg=new Msg();
	    if(i>0){
		Worker worker1=    adminLoginService.selectworkerid(worker);
		    updateRole.setWorkerid(worker1.getWorkerid());
		    adminLoginService.insertRole(updateRole);
		    msg.setMsg("1");

	    }else {
		    msg.setMsg("2");
	    }
	    return msg;



    }

//查询角色
	@RequestMapping("/selectRole")
	@ResponseBody
	public List<Role> selectRole(){

	List<Role> role=adminLoginService.selectRole();

       return role;

	}
//角色赋值
	@RequestMapping("/UpdateRole")
	@ResponseBody
	public Msg UpdateRole(UpdateRole updateRole){

	int i=	adminLoginService.updateRole(updateRole);


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
//		Worker u = new Worker();
//		u.setFace(base.getBytes());
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
				return worker;


			}

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

//删除管理员
	@RequestMapping("/deleteAdmin")
	@ResponseBody
	@Log(operationType="删除后台管理员",operationName="超级管理员进行删除后台管理员")
	public Msg deleteAdmin(Worker worker){

            int i=adminLoginService.deleteAdmin(worker);
	  	Msg msg=new Msg();
		if(i>0){

			msg.setMsg("1");

		}else {
			msg.setMsg("2");
		}
		  return msg;




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
	@Log(operationType="增加",operationName="管理员进行自助设备增加")
	public Msg Aopadddevic(Devic devic)
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
	@Log(operationType="设备删除",operationName="管理员进行设备删除")
	public Msg Aopdeletedevic(Devic devic)
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
	@Log(operationType="设备修改",operationName="管理员进行设备修改")
	public Msg Aoprevisedevic(Devic devic)
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
	@Log(operationType="设备状态修改",operationName="管理员进行设备状态修改")
	public Msg Aopstate(Devic devic)
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
	@Log(operationType="自助设备管理表格显示",operationName="管理员打开自助设备管理表格显示方法")
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
	@Log(operationType="增加",operationName="管理员进行增加用户")
	public Msg AopaddMonthlyPayment(Combo combo)
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
	@Log(operationType="设备删除",operationName="管理员进行设备删除")
	public Msg AopdeMonthlyPayment(Combo combo)
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


//	缴费南丁格尔玫瑰图显示
	@RequestMapping("ECharsDemo")
//	@Log(operationType="南丁格尔玫瑰图界面",operationName="南丁格尔玫瑰图界面显示方法")
	public ModelAndView ECharsDemo(){

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Postcount");
		return mv;
	}




	//缴费南丁格尔玫瑰图显示
	@RequestMapping("/ECharts.action")
	@ResponseBody
//	@Log(operationType="南丁格尔玫瑰图数据",operationName="管理员打开南丁格尔玫瑰图")
	public Cost ECharts(){

		Cost cost = new Cost();
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

//	自助设备南丁格尔玫瑰图界面
	@RequestMapping("EChars")
	//	@Log(operationType="南丁格尔玫瑰图界面",operationName="南丁格尔玫瑰图界面显示方法")
	public ModelAndView EChars(){

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Postcount2");
		return mv;
	}



	//自助设备南丁格尔玫瑰图显示
	@RequestMapping("/ECharts2.action")
	@ResponseBody
	//	@Log(operationType="南丁格尔玫瑰图数据",operationName="管理员打开南丁格尔玫瑰图")
	public List<DevicTong>  ECharts2(){



		List<DevicTong> list= adminLoginService.Device();



		return list;
	}


    //生成订单界面
	@RequestMapping(value = "/alipay.action" )
//	@Log(operationType="支付",operationName="支付宝")
	public void alipay(Integer orderId, HttpSession session,HttpServletResponse httpResponse,CarInOut carInOut) throws IOException
	{
		System.out.println("支付宝进入");
		//实例化客户端,填入所需参数
		AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL, APP_ID, APP_PRIVATE_KEY, FORMAT, CHARSET, ALIPAY_PUBLIC_KEY, SIGN_TYPE);
		AlipayTradePagePayRequest request = new AlipayTradePagePayRequest();
		//在公共参数中设置回跳和通知地址
		request.setReturnUrl(RETURN_URL);
		request.setNotifyUrl(NOTIFY_URL);
		session.setAttribute("carNum",carInOut.getCarnum());
//		System.out.println("订单号1---------"+carInOut.getInoutid());
//		System.out.println("金额1---------"+carInOut.getMoney());

		//		//根据订单编号,查询订单相关信息
		//		Order order = payService.selectById(orderId);
		//商户订单号，商户网站订单系统中唯一订单号，必填
		int out_trade_no =carInOut.getInoutid();
		//付款金额，必填
		String total_amount = carInOut.getMoney();
		//订单名称，必填
//				String subject = order.getOrderName();
		//		商品描述，可空
		System.out.println("订单号2---------"+out_trade_no);
		System.out.println("金额2---------"+total_amount);
		String body = "";
		request.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
				+ "\"total_amount\":\""+ total_amount +"\","
				+ "\"subject\":\""+"伟斌娱乐" +"\","
				//				+ "\"body\":\""+ body +"\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		String form = "";
		try {
			form = alipayClient.pageExecute(request).getBody(); // 调用SDK生成表单
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}

		httpResponse.setContentType("text/html;charset=" + CHARSET);
		httpResponse.getWriter().write(form);// 直接将完整的表单html输出到页面
		httpResponse.getWriter().flush();
		httpResponse.getWriter().close();


	}

	//订单成功界面
	@RequestMapping(value = "/returnUrl", method = RequestMethod.GET)
//	@Log(operationType="订单返回",operationName="订单成功返回")
	public ModelAndView returnUrl(HttpServletRequest request, HttpSession session,HttpServletResponse response)
			throws IOException, AlipayApiException
	{
		System.out.println("=================================同步回调=====================================");
		// 获取支付宝GET过来反馈信息
		System.out.println("支付成功, 进入同步通知接口...");
		//获取支付宝GET过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		System.out.println(params);//查看参数都有哪些
		boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
		//验证签名通过
		if (signVerified)
		{
			Pay pay=new Pay();
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

			System.out.println("商户订单号=" + out_trade_no);
			System.out.println("支付宝交易号=" + trade_no);
			System.out.println("付款金额=" + total_amount);
			pay.setOut_trade_no(out_trade_no);
			pay.setTotal_amount(total_amount);
			pay.setTrade_no(trade_no);

			adminLoginService.Paygai(pay);
			//			ModelAndView modelAndView=new Mp
			//支付成功，修复支付状态
			//			payService.updateById(Integer.valueOf(out_trade_no));
			ModelAndView mv = new ModelAndView();
			//			String index="alipaySuccess";
			mv.addObject("out_trade_no", out_trade_no);
			mv.addObject("trade_no", trade_no);
			mv.addObject("total_amount", total_amount);
			mv.addObject("carNum", session.getAttribute("carNum"));
			mv.addObject("flag", "success");
			mv.setViewName("CarOut1");
			return mv;

			//			return "alipaySuccess";//跳转付款成功页面
		} else
		{
			ModelAndView mv = new ModelAndView("demo5/0000");
			return mv;//跳转付款失败页面
		}
	}




	//计费规则表格界面
	@RequestMapping("/BillingRules")
	@Log(operationType="计费规则表格界面",operationName="管理员计费规则表格界面打开")
	public String AopBillingRules(){
		String index="BillingRules";
		return index;
	}



	//计费规则表格显示
	@RequestMapping("BillingRulesR.action")
	@ResponseBody
	@Log(operationType="计费规则表格显示",operationName="管理员打开计费规则表格显示方法")
	public Msg BillingRulesR(Rules rules, String page){

		Msg msg = new Msg();
		rules.setPage((Integer.valueOf(page) -1)*5);

		List<Rules>  list= adminLoginService.BillingRulesRtb(rules);
		List<Rules>  pageList= adminLoginService.BillingRulesRzong(rules);

		int mun = pageList.size();
		msg= new Msg(0,"",mun,list);
		return msg;

	}


	//计费规则表格删除
	@RequestMapping("/deBillingRules.action")
	@ResponseBody
	@Log(operationType="计费规则表格删除",operationName="管理员进行计费规则表格删除")
	public Msg AopdeBillingRules(Rules rules)
	{

		int i =adminLoginService.deBillingRules(rules);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}



	//计费规则表格修改
	@RequestMapping("/stateBillingRules.action")
	@ResponseBody
	@Log(operationType="计费规则表格修改",operationName="管理员进行计费规则表格修改")
	public Msg AopstateBillingRules(Rules rules)
	{

		int i =adminLoginService.stateBillingRules(rules);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}


	//计费规则增加
	@RequestMapping("/BillingRulesAdd.action")
	@ResponseBody
	@Log(operationType="计费规则增加",operationName="管理员进行计费规则增加")
	public Msg BillingRulesAdd(Rules rules)
	{
		//		Date date = new Date();
		//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		//		String time =sdf.format(date);
		//		devic.setDevictime(time);
		Msg msg =new Msg();
		List<Rules> listrepeat=adminLoginService.BillingRulesAddchong(rules);
		if (listrepeat.size()>0){
			msg.setMsg("3");
		}else {

			int i =adminLoginService.BillingRulesAdd(rules);

			if (i>0){
				msg.setMsg("1");
			}else {
				msg.setMsg("2");
			}
			return msg;
		}


		return msg;
	}




	//日志管理界面显示
	@RequestMapping("/Logmanagement")
	@Log(operationType="日志管理界面界面",operationName="管理员日志管理界面显示")
	public String LogmanagementInterface(){
		String index="Log";
		return index;
	}

	//日志管理表格显示
	@RequestMapping("/Logmanagement.action")
	@ResponseBody
	@Log(operationType="日志管理表格显示",operationName="管理员打开日志管理表格显示方法")
	public Msg Logmanagement(Tblog tblog, String page){

		Msg msg = new Msg();
		tblog.setPage((Integer.valueOf(page) -1)*5);

		List<Tblog>  list= adminLoginService.Logmanagementtb(tblog);
		List<Tblog>  pageList= adminLoginService.Logmanagementzong(tblog);

		int mun = pageList.size();
		msg= new Msg(0,"",mun,list);
		return msg;
	}

	//产品管理修改
	@RequestMapping("/GaiMonthlyPayment.action")
	@ResponseBody
	@Log(operationType="产品管理修改",operationName="管理员进行产品管理修改")
	public Msg GaiMonthlyPayment(Combo combo)
	{

		int i =adminLoginService.GaiMonthlyPayment(combo);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}



	//	自助设备南丁格尔玫瑰图界面
	@RequestMapping("EChars3")
	//	@Log(operationType="南丁格尔玫瑰图界面",operationName="南丁格尔玫瑰图界面显示方法")
	public ModelAndView EChars3(){

		ModelAndView mv = new ModelAndView();
		mv.setViewName("Postcount3");
		return mv;
	}



	//车辆南丁格尔玫瑰图显示
	@RequestMapping("/VehicleECharts3.action")
	@ResponseBody
	//	@Log(operationType="南丁格尔玫瑰图数据",operationName="管理员打开南丁格尔玫瑰图")
	public List<Inout>  VehicleECharts3(){



		List<Inout> list= adminLoginService.VehicleECharts3();



		return list;
	}


	//	排班界面
	@RequestMapping("Schedule")
	public ModelAndView Schedule(HttpServletRequest request){

		Date date = new Date(System.currentTimeMillis());

		ModelAndView mv = new ModelAndView();
		List<Date> dateList = Tool.dateToWeek(date);
		List<String> days = Tool.getDateType(dateList);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("startDate", days.get(0));
		map2.put("endDate", days.get(days.size() - 1));

		System.out.println("日期时间"+days);
		Map<String, List<Arrange>> map = adminLoginService.ShiftArrange(map2);

		if (!(map.size() > 0))
		{

			List<Arrange> courseList2 = new ArrayList<Arrange>();
			for (int i = 0; i < 7; i++)
			{
				for (int j = 0; j < 3; j++)
				{
					Arrange arrange = new Arrange();
					arrange.setArrangetime(days.get(i));
					System.out.println("日期--------"+arrange.getArrangetime());
					arrange.setArrid(String.valueOf(j + 1));
					System.out.println("序号--------"+arrange.getArrid());
					arrange.setWorkerid(26);
					courseList2.add(arrange);

				}
			}
			adminLoginService.ShiftInsertion(courseList2);
			for (int i = 0; i <courseList2.size() ; i++)
			{
				System.out.println("日期+++++++++++++++-----------------"+courseList2.get(i).getArrangetime());
				System.out.println("序号+++++++++++++++-----------------"+courseList2.get(i).getArrid());

			}
			map = adminLoginService.ShiftArrange(map2);

		}
		if(null!=map){
			request.setAttribute("tableBody", map);
			request.setAttribute("tableHead", days);

			mv.setViewName("coursetable");
			return mv;
		}
		return null;
	}


//	查看上下周课程表

	@RequestMapping("/weekcourseTable.action")

	public ModelAndView weekcourseTable(HttpServletRequest request, HttpServletResponse response, String cid)
	{
		ModelAndView mv = new ModelAndView();

		String nowDate = request.getParameter("now-Date");
		String doWhich = request.getParameter("doWhich");
		Date date = Tool.getDateType(nowDate);

		Map<String, List<Arrange>> map;
		List<String> days;
		if ("上一周".equals(doWhich))
		{
			List<Date> dateList = Tool.dateToWeek(Tool.getLastWeekMonday(date));
			List<String> daySting = Tool.getDateType(dateList);
			Date toDay = new Date(System.currentTimeMillis());
			List<Date> toDays = Tool.dateToWeek(toDay);
			List<String> toDaysSting = Tool.getDateType(toDays);
			Date date1 = Tool.getDateType((toDaysSting.get(6)));
			Date date2 = Tool.getDateType((daySting.get(6)));
			if (dateList.get(6).getTime() > toDays.get(6).getTime())
			{
				days = Tool.getDateType(dateList);
			} else
			{
				days = Tool.getDateType(toDays);
			}
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("startDate", days.get(0));
			map2.put("endDate", days.get(days.size() - 1));

			map = adminLoginService.ShiftArrange(map2);
		} else
		{
			List<Date> dateList = Tool.dateToWeek(Tool.getNextWeekMonday(date));
			days = Tool.getDateType(dateList);
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("startDate", days.get(0));
			map2.put("endDate", days.get(days.size() - 1));
			map2.put("cid", cid);
			map = adminLoginService.ShiftArrange(map2);
			if (!(map.size() > 0))
			{
				List<Arrange> courseList2 = new ArrayList<Arrange>();
				for (int i = 0; i < 7; i++)
				{
					for (int j = 0; j < 3; j++)
					{
						Arrange arrange = new Arrange();
						arrange.setArrangetime(days.get(i));
						arrange.setArrid(String.valueOf(j + 1));
						arrange.setWorkerid(26);
						courseList2.add(arrange);
					}
				}
				adminLoginService.ShiftInsertion(courseList2);
				map = adminLoginService.ShiftArrange(map2);
			}
		}

		if(null!=map){
			request.setAttribute("tableBody", map);
			request.setAttribute("tableHead", days);

			mv.setViewName("coursetable");
			return mv;
		}
		return null;
	}



//	 排班下拉框

	@RequestMapping("/findSubject.action")
	public ModelAndView findSubject()
	{
		List<Arrange> subjects = adminLoginService.findSubject();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("courseadd");
		modelAndView.addObject("subjects", subjects);
		return modelAndView;
	}


	//排班

	//计费规则表格修改
	@RequestMapping("/ScheduleGai.action")
	@ResponseBody
	public Msg ScheduleGai(HttpServletRequest req ,Arrange arrange)
	{
		String subjects = req.getParameter("subjects");
		String couId = req.getParameter("couId");
		arrange.setWorkerid(Integer.valueOf(subjects));
		arrange.setArrangeid(Integer.valueOf(couId));
		System.out.println("排班号--------------"+arrange.getWorkerid());
		System.out.println("序号--------------"+arrange.getArrangeid());
		int i =adminLoginService.ScheduleGai(arrange);
		Msg msg =new Msg();
		if (i>0){
			msg.setMsg("1");
		}else {
			msg.setMsg("2");
		}
		return msg;
	}










}


