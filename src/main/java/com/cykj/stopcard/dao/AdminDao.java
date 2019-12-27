package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//后台用户方法接口
@Mapper
public interface AdminDao
{

	//角色表管理
	public List<Map<String,Object>> queryRole(@Param("role") String role, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

	//查询角色表数量
	public  Integer queryRoleCount(@Param("role") String role);

	// <!--树形组件一级菜单-->
	public  List<Map<String,Object>> selectTreeParent(String admin);

	// <!--树形组件子菜单-->
	public  List<Map<String,Object>> selectTreeChild(@Param("admin") String admin, @Param("fatherid") String fatherid);

	//添加角色
	public  int addRole(String role, String msg);

	//查询角色ID
	public  Map queryRolesID(String role);

	//查询角色权限关系
	public  int addRoleMenu(String roleID,List menuid);


	//<!-- 树的数据回显-->
	//<!-- 根据角色查询其对应菜单 -->
	public  List<TreeNode> queryTreeFather(String role);

	//<!-- 根据角色查询其对应菜单 -->
	public  List<Map<String,String>> queryTreeChild(String role, String fatherid);


	//<!-- 根据roleid删除角色-权限关系表 -->
	public  int deleteRoleMenu(String roleid);
	//<!-- 根据roleid删除角色-人员关系表 -->
	public  int deleteWorkerRole(String roleid);

	//<!-- 根据roleid删除角色表 -->
	public  int deleteRole(String roleid);

	//<!-- 根据roleid删除角色-权限关系表 -->
	public  int updateRole(String rolename, String roledetails, String roleid);


	//查询菜单
	public  List<Map<String,Object>> queryMenu(@Param("menuname") String menuname, @Param("menuid") String menuid,@Param("start") Integer start, @Param("pageSize") Integer pageSize);

	//查询菜单表数量
	public  Integer queryMenuCount(@Param("menuname") String menuname);
	//增加菜单
	public  Integer addMenu(Menu menu);
	//编辑菜单
	public  Integer updateMenu(Menu menu);

	//删除菜单
	//<!--    根据menuid删除角色-权限关系表-->
	public  Integer deleteRoleMenu2(String menuid);
	//删除菜单
	public  Integer deleteMenu(String menuid);
	//删除的菜单有子菜单的话，子菜单的fatherid滞空
	public  Integer updateFatherid(String menuid);


	public  List<TreeNode> selectMenuTree(String admin);


	//查询广告
	public  List<Ad> queryAd(@Param("adid") String adid, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

	//查询广告表数量
	public  Integer queryAdCount(@Param("adid") String adid);
	//修改广告
	public  Integer updateAd(Ad ad);
	public  Map<String,Object> queryParameter();
	public  Integer updateParameter(@Param("webname") String webname, @Param("mail") String mail, @Param("webhead") String webhead);

}
