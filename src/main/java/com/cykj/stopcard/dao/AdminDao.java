package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.Worker;
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
	public  int addRoleMenu(String roleID, List menuid);


	//<!-- 树的数据回显-->
	//<!-- 根据角色查询其对应菜单 -->
	public  List<Map<String,String>> queryTreeFather(String role);

	//<!-- 根据角色查询其对应菜单 -->
	public  List<Map<String,String>> queryTreeChild(String role, String fatherid);


	//<!-- 根据roleid删除角色-权限关系表 -->
	public  int deleteRoleMenu(String roleid);

	//<!-- 根据roleid删除角色-权限关系表 -->
	public  int updateRole(String rolename, String roledetails, String roleid);


	//查询菜单
	public  List<Map<String,Object>> queryMenu(@Param("menuname") String menuname, @Param("start") Integer start, @Param("pageSize") Integer pageSize);

	//查询菜单表数量
	public  Integer queryMenuCount(@Param("menuname") String menuname);

}
