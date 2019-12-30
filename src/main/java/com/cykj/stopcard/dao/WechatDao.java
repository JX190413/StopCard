package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.Combo;
import com.cykj.stopcard.bean.UserManagement;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface WechatDao
{
//	用户登录
	public UserManagement wechatLogin(@Param("username")String username);

//	所有业务查询
	public List<Combo> comboQuery();

//	用户注册
	public int insertUser(UserManagement userManagement);

}
