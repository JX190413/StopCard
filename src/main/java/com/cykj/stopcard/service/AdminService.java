package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.Ad;
import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.Menu;
import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.dao.AdminDao;
import com.cykj.stopcard.dao.AdminLoginDao;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//后台操作层
@Service
public class AdminService
{
	@Resource
	private AdminDao adminDao;

	//菜单表查询
	public List<Map<String,Object>> queryMenu(String menuname,String menuid, Integer start, Integer pageSize)
	{
		return adminDao.queryMenu( menuname,menuid,start, pageSize);
	}
	//菜单表查询
	public int addMenu(Menu menu)
	{
		return adminDao.addMenu(menu);
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

	//树形组件菜单
	public List<Object> selectMenuTree(String admin)
	{
		List<Menu> list=adminDao.selectMenuTree( admin);
		List<Object> list1=new ArrayList<Object> ();
		for(int i=0;i<list.size();i++)
		{
			int menuid = list.get(i).getMenuid();
			String menuname = list.get(i).getMenuname();
			Map<String, Object> map1 = new HashMap<String, Object>();
			List<Object> list2=new ArrayList<Object>();
			for (int j = 0; j < list.size(); j++)
			{
				int menuid2 = list.get(j).getFatherid();
				if(menuid==menuid2){
					map1.put("title",menuname);
					map1.put("id", menuid);
					Map<String, Object> map2 = new HashMap<>();
					map2.put("title", list.get(j).getMenuname());
					map2.put("id", menuid2);
					list2.add(map2);
					map1.put("children",list2);
				}
			}
			list1.add(map1);
		}
		return list1;
	}

	//树形组件菜单
	public List<Object> selectMenuTree2(int fatherid,List<Menu> list)
	{
		List<Object> list1=new ArrayList<Object> ();
		Map<String, Object> map1 = new HashMap<String, Object>();
		for(int i=0;i<list.size();i++)
		{
			int menuid = list.get(i).getMenuid();
			String menuname = list.get(i).getMenuname();
			if(menuid==fatherid){
				map1.put("title",menuname);
				map1.put("id", menuid);
				map1.put("children",selectMenuTree2(menuid,list));
				list1.add(map1);
			}
		}
		return list1;
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

	//删除角色
	public  int deleteRole(String roleid){

		//删除角色-权限
		adminDao.deleteRoleMenu(roleid);
			//删除角色-人员
		adminDao.deleteWorkerRole(roleid);
				//删除角色
		return adminDao.deleteRole(roleid);
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

	//修改菜单
	public  int updateMenu(Menu menu){

		return adminDao.updateMenu(menu);
	}

	//删除菜单
	public  int deleteMenu(String menuid){
		adminDao.deleteRoleMenu2(menuid);
		adminDao.updateFatherid(menuid);
		return adminDao.deleteMenu(menuid);
	}

	//查询广告
	public List<Ad> queryAd(String adid, Integer start, Integer pageSize){
		return adminDao.queryAd(adid,start,pageSize);
	}

	//查询广告数量
	public Integer queryAdCount(String adid){
		return adminDao.queryAdCount(adid);
	}

	//更新广告
	public Integer updateAd(Ad ad){
		return adminDao.updateAd(ad);
	}

	//参数查询
	public Map<String, Object> queryParameter(){
		return adminDao.queryParameter();
	}

	//参数修改
	public Integer updateParameter(String webname, String mail, String webhead){
		return adminDao.updateParameter(webname, mail, webhead);
	}


}
