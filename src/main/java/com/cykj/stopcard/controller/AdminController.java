package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.Menu;
import com.cykj.stopcard.bean.Msg;
import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.dao.AdminDao;
import com.cykj.stopcard.service.AdminLoginService;
import com.cykj.stopcard.service.AdminService;
import com.google.gson.Gson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

//后台端控制层
@Controller
public class AdminController
{
	@Resource
	private AdminService adminService;

	//角色数据展示
	@RequestMapping("/queryRole")
	@ResponseBody
	public Msg queryRole(String rolename, String page, String limit)
	{
		if (rolename == null)
		{
			rolename = "";
		}
		int b = Integer.valueOf(limit);
		int a = (Integer.valueOf(page) - 1) * b;
		List<Map<String, Object>> list = adminService.queryRole(rolename, a, b);
		int count = adminService.queryRoleCount(rolename);
		Msg msg = new Msg(0, null, count, list);
		return msg;
	}

	//角色下拉框
	@RequestMapping("/queryRoleSelect")
	@ResponseBody
	public List<Map<String, Object>> queryRoleSelect()
	{
		List<Map<String, Object>> list = adminService.queryRole(null, null, null);

		return list;
	}

	//树形组件一级菜单
	@RequestMapping("/selectTreeParent")
	@ResponseBody
	public List<Object>  selectTreeParent(HttpSession session)
	{
		Object admin=session.getAttribute("workeraccount");
		List<Map<String,Object>> list;
		if(null!=admin){
			list=adminService.selectTreeParent(admin.toString());
			List<Object> list1 = new ArrayList<>();
			if(null!=list){
				for (Map map : list)
				{   Map<String, Object> map1 = new HashMap<>();
					map1.put("title",map.get("menuname"));
					map1.put("id",map.get("menuid"));
					map1.put("children",selectTreeChild(admin.toString(),map.get("menuid").toString()));
					list1.add(map1);
				}
			}
			return list1;
		}
		return null;
	}

	//树形组件子菜单
	public List<Object>  selectTreeChild(String admin,String fatherid)
	{
		List<Map<String,Object>> list=adminService.selectTreeChild(admin,fatherid);
		List<Object> list1 = new ArrayList<>();
		if(null!=list1){
			for (Map map : list)
			{   Map<String, Object> map1 = new HashMap<>();
				map1.put("title",map.get("menuname"));
				map1.put("id",map.get("menuid"));
				map1.put("children",selectTreeChild(admin,map.get("menuid").toString()));
				list1.add(map1);
			}
		}
		return list1;
	}

	//数据权限树形菜单数据回显
	@RequestMapping("/queryRoleTree")
	@ResponseBody
	public  List queryRoleTree(String role){

		return  adminService.queryRoleTree(role);

	}

	//添加/修改角色
	@RequestMapping("/addRole")
	@ResponseBody
	public String addRole(String field,String roleid)
	{
		Gson gson = new Gson();
		HashMap<String, String> map = gson.fromJson(field, HashMap.class);
		System.out.println(map);
		List list = new ArrayList();
		//解析获取前台传来的角色名、信息、权限列表
		String role = map.get("role");
		String msg = map.get("descr");
		map.remove("role");
		map.remove("descr");
		System.out.println(map);
		for (String key : map.keySet())
		{
			list.add(map.get(key));
		}
		if(null==roleid){//增加角色
			int num = adminService.addRole(role, msg);
			if(num>0){
				Map map1=adminService.queryRolesID(role);
//				System.out.println("roleID=" + map1.get("roleid"));
				adminService.addRoleMenu(map1.get("roleid").toString(),list);
				return "添加成功！";
			}
			return "添加失败！";
		}else{//修改角色
			if(adminService.editRole(role,msg,roleid)>0){
//				System.out.println("-------------------"+roleid);
//				System.out.println("*******************"+list);
				adminService.addRoleMenu(roleid,list);
				return "修改成功！";
			}
			return "修改失败！";
		}


	}

	//新增角色判断角色是否已经存在
	@RequestMapping("/checkRole")
	@ResponseBody
	public String checkRole(String role)
	{
		//已存在
		if(null!=adminService.queryRolesID(role)){
			return "0";
		}
		//不存在（可添加）
		return "1";
	}
	//删除角色判断角色是否绑定了用户，是不能删
	@RequestMapping("/deleteRole")
	@ResponseBody
	public String deleteRole(String roleid)
	{
		System.out.println(roleid);
		//不存在（可添加）
		return adminService.deleteRole(roleid)+"";
	}


	//菜单管理数据展示
	@RequestMapping("/queryMenu")
	@ResponseBody
	public Msg queryMenu(String menuname,String menuid, String page, String limit)
	{
		if (menuname == null)
		{
			menuname = "";
		}
		if (menuid == null)
		{
			menuid = "";
		}
		int a=-1;
		int b=-1;
		if(page!=null&&limit!=null){
			b = Integer.valueOf(limit);
			a = (Integer.valueOf(page) - 1) * b;
		}

		List<Map<String, Object>> list = adminService.queryMenu(menuname,menuid,a, b);
		int count = adminService.queryMenuCount(menuname);
		Msg msg = new Msg(0, null, count, list);
		return msg;
	}

	//添加菜单
	@RequestMapping("/addMenu")
	@ResponseBody
	public String addMenu(Menu menu){

		if(adminService.addMenu(menu)>0){
			ArrayList arrayList=new ArrayList();
			arrayList.add(menu.getMenuid());
			adminService.addRoleMenu("1",arrayList);
			return "200";
		}
		return "0";
	}

	//添加菜单
	@RequestMapping("/updateMenu")
	@ResponseBody
	public String updateMenu(Menu menu){
		if(adminService.updateMenu(menu)>0){
			return "200";
		}
		return "0";
	}

	//删除菜单
	@RequestMapping("/deleteMenu")
	@ResponseBody
	public String deleteMenu(String menuid){
		if(adminService.deleteMenu(menuid)>0){
			return "200";
		}
		return "0";
	}


}


