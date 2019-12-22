package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.*;
import com.cykj.stopcard.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//用户管理控制层
@Controller
public class UserController
{
	@Resource
	private UserService userService;
	//获取当前系统时间
	Date currentTime = new Date();
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	//返回视图层
	ModelAndView mv = new ModelAndView();
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

	//用户登录
	@RequestMapping("/userLogin")
	public ModelAndView userLogin(String username1, String userpass1){
		  UserManagement userManagement=new UserManagement();
		userManagement.setUsername(username1);
		userManagement.setUserpass(userpass1);
		UserManagement userManagement1=userService.selectUser(userManagement);
		List<Combo> combos=userService.selcomtime();
		if (userManagement1!=null){
			mv.addObject("UserManagement",userManagement1);
			mv.addObject("flage",3);
			mv.addObject("combos",combos);
			mv.setViewName("Business");
			return mv;
		}
		mv.addObject("flage",4);
		mv.setViewName("UserLogin");
		return mv;



	}
    //用户注册
	@RequestMapping("/userRegist")
	public ModelAndView userRegist(UserManagement userManagement){
       //获取当前时间
		String dateString = formatter.format(currentTime);
		userManagement.setUsertime(dateString);

	  int i=userService.insertUser(userManagement);
     if (i>0){


	     mv.addObject("flage",1);
	     mv.setViewName("UserLogin");


     	 return mv;
     }
       mv.addObject("flage",2);
		mv.setViewName("UserLogin");
         return mv;

	}

	//	白名单数据删除
	@RequestMapping("/delete")
	@ResponseBody
	public ResultEntity whitelistDelete(String carnum){

		ResultEntity res = new ResultEntity();
		if (userService.WhitelistDelete(carnum)>0){
			res.setMsg("删除成功");
		}else {
			res.setMsg("删除失败");
		}
		return res;
	}

	//	白名单数据添加
	@RequestMapping("/add")
	@ResponseBody
	public ResultEntity whitelistAdd(String carnum){
		ResultEntity res = new ResultEntity();
		if (userService.WhitelistAdd(carnum)>0){
			res.setMsg("添加成功");
		}else {
			res.setMsg("添加失败");
		}
		return res;
	}


}
