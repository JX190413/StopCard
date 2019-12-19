package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.dao.AdminDao;
import com.cykj.stopcard.dao.AdminLoginDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//后台操作层
@Service
public class AdminService
{
	@Resource
	private AdminDao adminDao;

	//菜单表查询
	public List<Map<String,Object>> queryMenu(String menuname, Integer start, Integer pageSize)
	{
		return adminDao.queryMenu( menuname, start, pageSize);
	}

	//菜单表数量查询
	public int queryMenuCount(String menuname)
	{
		return adminDao.queryMenuCount( menuname);
	}
	//角色表查询
	public List<Map<String,Object>> queryRole(String role, Integer start, Integer pageSize)
	{
		return adminDao.queryRole( role, start, pageSize);
	}

	//角色表数量查询
	public int queryRoleCount(String role)
	{
		return adminDao.queryRoleCount( role);
	}

	//树形组件一级菜单
	public List<Map<String,Object>> selectTreeParent(String admin)
	{
		return adminDao.selectTreeParent( admin);
	}

	//树形组件子菜单
	public List<Map<String,Object>> selectTreeChild(String admin,String fatherid)
	{
		return adminDao.selectTreeChild(admin,fatherid);
	}

	//添加角色
	public  int addRole(String role,String msg){

		return adminDao.addRole(role,msg);
	}


	//查询角色ID
	public  Map queryRolesID(String role){
		return adminDao.queryRolesID(role);
	}

	//添加角色权限关系
	public  int addRoleMenu(String roleid,List menuid){
		return adminDao.addRoleMenu(roleid,menuid);
	}

	//编辑角色
	public  int editRole(String rolename,String roledetails,String roleid){
		if(adminDao.updateRole( rolename, roledetails, roleid)>0){
			adminDao.deleteRoleMenu(roleid);
			return 1;

		}
		return 0;
	}

	//树形结构数据回显
	public  List queryRoleTree(String role){
		System.out.println("----------------------"+role);
		List<Map<String,String>> list1=adminDao.queryTreeFather(role);
		List list2 = new ArrayList<>();
		if(null!=list1){
			for (Map map : list1)
			{
				List<Map<String,String>> list3=adminDao.queryTreeChild(role,map.get("menuid").toString());
				if(null==list3||list3.size()==0){
					list2.add(map.get("menuid").toString());
				}
			}
		}
		System.out.println("----------------------"+list2.toString());
		return list2;
	}

}
