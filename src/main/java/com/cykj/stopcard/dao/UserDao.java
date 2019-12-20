package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.UserManagement;
import com.cykj.stopcard.bean.Whitelist;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserDao
{


	//车主注册
	public  int insertUser(UserManagement userManagement);
   //车主登录
	 public UserManagement selectUser(UserManagement userManagement);
	//	用户数据查询
	public List<UserManagement> userQuery(@Param("username") String username,@Param("carnum") String carnum,@Param("beginTime") String beginTime,@Param("endTime") String endTime,@Param("beginNumber") int beginNumber,@Param("limitNumber") int limitNumber);

	//	用户数据统计条数
	public int userCount(@Param("username") String username,@Param("carnum") String carnum,@Param("beginTime") String beginTime,@Param("endTime") String endTime);

	//	白名单数据查询
	public List<Whitelist> whitelistQuery(@Param("carnum") String carnum, @Param("beginNumber") int beginNumber, @Param("limitNumber") int limitNumber);

	//	白名单数据统计条数
	public int WhitelistCount(@Param("carnum") String carnum);

	//	白名单删除
	public int WhitelistDelete(@Param("carnum") String carnum);

	//	白名单添加
	public int WhitelistAdd(@Param("carnum") String carnum);

}
