package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.User;
import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.dao.AdminLoginDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

//后台操作层
@Service
public class AdminLoginService
{
	@Resource
	private AdminLoginDao adminLoginDao;

	//后台管理员登录
	@Transactional
	public Worker queryAdmin(Worker worker){
		return adminLoginDao.queryAdmin(worker);
	}
   //菜单的获取
   @Transactional
   public ArrayList<AdminMenu> queryMenu(Worker worker){


		return   adminLoginDao.queryMenu(worker);
}
//人脸识别
	@Transactional
	public  List<Worker>  selectAllUsers(){
		return adminLoginDao.selectAllUsers();
	}
//插入数据库
	@Transactional
	public int save(Worker worker){
		return adminLoginDao.saveUser(worker);



	}

}
