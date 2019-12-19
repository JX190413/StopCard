package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.User;
import com.cykj.stopcard.bean.Worker;
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
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

//后台端控制层
@Controller
public class LoginController
{
	private static String accessToken;
	@Resource
	private AdminLoginService adminLoginService;
//账号密码的登录
	@RequestMapping("/Login")
	public ModelAndView AdminLogin(Worker worker, HttpSession httpSession)
	{
		System.out.println("进来了吗");
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
//人脸识别的登录
@RequestMapping("/facelogin.action")
@ResponseBody
public Worker onListStudent(HttpServletRequest request,
                            HttpServletResponse response, Model model) {
	// 获取前端页面传过来的参数
	String base = request.getParameter("base");
	ModelAndView mv = new ModelAndView();
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

		JSONObject fromObject = JSONObject.fromObject(result);

		JSONObject jsonArray = fromObject.getJSONObject("result");

		double resultList = jsonArray.getDouble("score");
		if (resultList >= 90) {

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






  }


