package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.User;
import com.cykj.stopcard.bean.Worker;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;
//后台用户方法接口
@Mapper
public interface AdminLoginDao
{

	//后台用户登录
	Worker queryAdmin(Worker worker);


	//后台用户获取菜单
	ArrayList<AdminMenu> queryMenu(Worker worker);

//人脸识别登录
     List<Worker>  selectAllUsers();
	int saveUser(Worker worker);






}
