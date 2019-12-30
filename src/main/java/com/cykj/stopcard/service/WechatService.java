package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.Combo;
import com.cykj.stopcard.bean.UserManagement;
import com.cykj.stopcard.dao.WechatDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class WechatService
{
	@Resource
	private WechatDao wechatDao;

//	用户登录
	public UserManagement wechatLogin(String username){
		return wechatDao.wechatLogin(username);
	}

//	查询所有业务
	public List<Combo> comboQuery(){
		return wechatDao.comboQuery();
	}

//	用户注册
	public int insertUser(UserManagement userManagement){
		return wechatDao.insertUser(userManagement);
	}
}

