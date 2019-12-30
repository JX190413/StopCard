package com.cykj.stopcard.controller;
import com.cykj.stopcard.bean.Combo;
import com.cykj.stopcard.bean.Msg;
import com.cykj.stopcard.bean.ResultEntity;
import com.cykj.stopcard.bean.UserManagement;
import com.cykj.stopcard.service.WechatService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//微信控制层
@Controller
public class WechatControl
{

	@Resource
	private WechatService wechatService;
	Date currentTime = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

//	用户登录
	@RequestMapping("/wechatLogin")
	@ResponseBody
	public ResultEntity wechatLogin(String username,String userpass){
		UserManagement userManagement=wechatService.wechatLogin(username);
		ResultEntity res = new ResultEntity();
		if (userpass.equals(userManagement.getUserpass())){
			res.setStatus(0);
			res.setMsg("登录成功");
		}else {
			res.setStatus(1);
			res.setMsg("登录失败");
		}
		return res;
	}

//	业务信息获取
	@RequestMapping("/comboQuery")
	@ResponseBody
	public List<Combo> comboQuery(){
		return wechatService.comboQuery();
	}

//	用户注册
	@RequestMapping("/insertUser")
	@ResponseBody
	public ResultEntity insertUser(UserManagement userManagement){
//		System.out.println(userManagement.getUsername());
		//获取当前时间
		String dateString = formatter.format(currentTime);
		userManagement.setUsertime(dateString);

		ResultEntity res = new ResultEntity();
		if (wechatService.insertUser(userManagement)>0){
			res.setStatus(0);
			res.setMsg("注册成功");
		}else {
			res.setStatus(1);
			res.setMsg("注册失败");
		}
		return res;
	}

	//	用户信息
	@RequestMapping("/wechatUser")
	@ResponseBody
	public UserManagement wechatUser(String username){
		UserManagement userManagement=wechatService.wechatLogin(username);
		return userManagement;
	}


}
