package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.UserManagement;
import com.cykj.stopcard.bean.Whitelist;
import com.cykj.stopcard.dao.UserDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService
{
	@Resource
	private UserDao userDao;


	//用户注册
	public int insertUser(UserManagement userManagement){
		return  userDao.insertUser(userManagement );
	}
	//用户登录
	public UserManagement selectUser(UserManagement userManagement){
		return userDao.selectUser(userManagement);
	}


	//	用户数据查询
	public List<UserManagement> userQuery(String username,String carnum,String beginTime,String endTime,int beginNumber,int limitNumber){
		return userDao.userQuery(username,carnum,beginTime,endTime,beginNumber,limitNumber);
	}
	//	用户数据统计条数
	public int userCount(String username,String carnum,String beginTime,String endTime){
		return userDao.userCount(username,carnum,beginTime,endTime);
	}

	//	白名单数据查询
	public List<Whitelist> whitelistQuery(String carnum, int beginNumber, int limitNumber){
		return userDao.whitelistQuery(carnum,beginNumber,limitNumber);
	}
	//	白名单数据统计条数
	public int WhitelistCount(String carnum){
		return userDao.WhitelistCount(carnum);
	}
	//	白名单删除
	public int WhitelistDelete(String carnum){
		return userDao.WhitelistDelete(carnum);
	}

	//	白名单添加
	public int WhitelistAdd(String carnum){
		return userDao.WhitelistAdd(carnum);
	}


}
