package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.Msg;
import com.cykj.stopcard.bean.UserManagement;
import com.cykj.stopcard.bean.Whitelist;
import com.cykj.stopcard.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

//用户管理控制层
@Controller
public class UserController
{
	@Resource
	private UserService userService;

	//	用户管理界面跳转
	@RequestMapping("/User")
	public String User()
	{
		return "User";
	}

	//	用户数据查询
	@RequestMapping("/userQuery")
	@ResponseBody
	public Msg userQuery(String username, String carnum, String beginTime,String endTime, int page, int limit){

		String begin=beginTime;
		String end=endTime;
		if (begin==null||"".equals(begin)){
			begin="0001-01-01";
		}
		if (end==null||"".equals(end)){
			end="9999-99-99";
		}
		Msg msg=new Msg();
		int beginNumber=(page-1)*limit;
		List<UserManagement> userManagements=userService.userQuery(username,carnum,begin,end,beginNumber,limit);
		int count=userService.userCount(username,carnum,begin,end);
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(userManagements);
		return msg;
	}

	//	白名单管理界面跳转
	@RequestMapping("/Whitelist")
	public String Whitelist()
	{
		return "Whitelist";
	}

	//	白名单数据查询
	@RequestMapping("/WhitelistQuery")
	@ResponseBody
	public Msg WhitelistQuery(String carnum, int page, int limit){

		Msg msg=new Msg();
		int beginNumber=(page-1)*limit;
		List<Whitelist> userManagements=userService.whitelistQuery(carnum,beginNumber,limit);
		int count=userService.WhitelistCount(carnum);
		msg.setCode(0);
		msg.setCount(count);
		msg.setData(userManagements);
		return msg;
	}



}
