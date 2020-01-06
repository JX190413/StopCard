package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//后台用户方法接口
@Mapper
public interface AdminLoginDao
{

	//后台用户登录
	Worker queryAdmin(Worker worker);
   //删除管理员
	int deleteAdmin(Worker worker);

	//后台用户获取菜单
	ArrayList<AdminMenu> queryMenu(Worker worker);

//人脸识别登录
     List<Worker>  selectAllUsers();
	int saveUser(Worker worker);
//查询所有的工作人员信息
	 List<Worker> queryWorker(Worker worker);

//查询所有管理员
    List<Role> selectRole();
//添加管理员的角色
	int insertRole(UpdateRole updateRole);
//修改管理员角色
	int updateRole(UpdateRole updateRole);
  Worker selectWorkerid(Worker worker);
	//查询所有的工作人员条数
	List<Worker> queryPage(Worker worker);


	//自助设备表格分页查询与带条件搜索
	public List<Devic> devictb(Devic devic);


	//自助设备表格查询
	public List<Devic> devictbzong(Devic devic);

	//自助设备添加重复查询
	public List<Devic> repeatevic(Devic devic);

	//自助设备增加
	public int adddevic(Devic devic);

	//自助设备删除
	public int deletedevic(Devic devic);

	//自助设备修改
	public int revisedevic(Devic devic);

	//自助设备状态修改
	public int state(Devic devic);



	//月缴产品管理表格分页查询与带条件搜索
	public List<Combo> MonthlyPaymenttb(Combo combo);


	//月缴产品管理表格总条数查询
	public List<Combo> MonthlyPaymentzong(Combo combo);


	//月缴产品添加重复查询
	public List<Combo> repeatMonthlyPayment(Combo combo);


	//月缴产品增加
	public int addMonthlyPayment(Combo combo);


	//月缴产品删除
	public int deMonthlyPayment(Combo combo);


	//临时停车缴费图
	public List<Cost> ECharts();


	//月缴产品缴费图
	public List<Cost> EChartsmonth();


	//自助设备统计图
	public List<DevicTong> Device();


	//车辆离场缴费状态修改
	public void Paygai(Pay pay);



	//计费规则表格分页查询与带条件搜索
	public List<Rules> BillingRulesRtb(Rules rules);


	//计费规则表格总条数查询
	public List<Rules> BillingRulesRzong(Rules rules);




	//计费规则表格删除
	public int deBillingRules(Rules rules);


	//计费规则表格修改
	public int stateBillingRules(Rules rules);




	//管理员日志操作
	public int  dayinfo(Tblog tblog);

	//车主日志操作
	public int  userdayinfo(Tblog tblog);


	//月缴产品添加重复查询
	public List<Rules> BillingRulesAddchong(Rules rules);

	//月缴产品增加
	public int BillingRulesAdd(Rules rules);


	//日志管理表格分页查询与带条件搜索
	public List<Tblog> Logmanagementtb(Tblog tblog );




	//日志管理表格总条数查询
	public List<Tblog> Logmanagementzong(Tblog tblog);

	//产品管理修改

	public int GaiMonthlyPayment(Combo combo);



	//车辆统计

	public List<Inout> VehicleECharts3();


	//排班
	public List<Arrange>  ShiftArrange(Map<String, Object> map );


	//排班初始插入
	public boolean ShiftInsertion(List<Arrange> courseList2);

	//排班添加界面
	public List<Arrange> findSubject();


	//排班人员添加进去

	public int ScheduleGai(Arrange arrange);
}
