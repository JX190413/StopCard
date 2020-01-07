package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.*;
import com.cykj.stopcard.dao.AdminLoginDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

//删除管理员
	public int deleteAdmin(Worker worker){

		return  adminLoginDao.deleteAdmin(worker);





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
//查询工作人员用户信息
	@Transactional
	public List<Worker> queryWorker(Worker worker){
		return  adminLoginDao.queryWorker(worker);


	}
	@Transactional
	public Worker selectworkerid(Worker worker){
		return adminLoginDao.selectWorkerid(worker);

	}


//修改管理员的角色
@Transactional
	public int updateRole(UpdateRole updateRole){

		return adminLoginDao.updateRole(updateRole);

	}
//查询所有管理员角色
@Transactional
public List<Role> selectRole(){
		return  adminLoginDao.selectRole();

}
//添加管理员角色
@Transactional
public int insertRole(UpdateRole updateRole){

		return  adminLoginDao.insertRole(updateRole);
}
	//查询工作人员用户条数
	@Transactional
	public List<Worker> queryPage(Worker worker){
		return  adminLoginDao.queryPage(worker);


	}

	//自助设备表格分页查询与带条件搜索
	@Transactional
	public List<Devic> devictb(Devic devic)
	{
		return adminLoginDao.devictb(devic);
	}


	//自助设备表格总条数查询
	@Transactional
	public List<Devic> devictbzong(Devic devic)
	{

		return adminLoginDao.devictbzong(devic);
	}

	//自助设备添加重复查询
	@Transactional
	public List<Devic> repeatevic(Devic devic)
	{

		return adminLoginDao.repeatevic(devic);
	}

	//自助设备增加
	@Transactional
	public int adddevic(Devic devic)
	{

		return adminLoginDao.adddevic(devic);
	}


	//自助设备删除
	@Transactional
	public int deletedevic(Devic devic)
	{

		return adminLoginDao.deletedevic(devic);
	}

	//自助设备修改
	@Transactional
	public int revisedevic(Devic devic)
	{

		return adminLoginDao.revisedevic(devic);
	}




	//自助设备状态修改
	@Transactional
	public int state(Devic devic)
	{

		return adminLoginDao.state(devic);
	}




	//月缴产品管理表格分页查询与带条件搜索
	@Transactional
	public List<Combo> MonthlyPaymenttb(Combo combo)
	{
		return adminLoginDao.MonthlyPaymenttb(combo);
	}


	//月缴产品管理表格总条数查询
	@Transactional
	public List<Combo> MonthlyPaymentzong(Combo combo)
	{

		return adminLoginDao.MonthlyPaymentzong(combo);
	}


	//月缴产品添加重复查询
	@Transactional
	public List<Combo> repeatMonthlyPayment(Combo combo)
	{

		return adminLoginDao.repeatMonthlyPayment(combo);
	}

	//月缴产品增加
	@Transactional
	public int addMonthlyPayment(Combo combo)
	{

		return adminLoginDao.addMonthlyPayment(combo);
	}


	//月缴产品删除
	@Transactional
	public int deMonthlyPayment(Combo combo)
	{

		return adminLoginDao.deMonthlyPayment(combo);
	}


	//自助设备统计图
	@Transactional
	public List<DevicTong> Device()
	{

		return  adminLoginDao.Device();
	}

	//月缴产品缴费图
	@Transactional
	public List<Cost> EChartsmonth()
	{

		return  adminLoginDao.EChartsmonth();
	}


	//临时停车缴费图
	@Transactional
	public List<Cost> ECharts()
	{

		return  adminLoginDao.ECharts();
	}
	//停车缴费表格总条数查询
	@Transactional
	public void Paygai(Pay pay)
	{

		adminLoginDao.Paygai(pay);
	}



	//计费规则表格分页查询与带条件搜索
	@Transactional
	public List<Rules> BillingRulesRtb(Rules rules)
	{

		return  adminLoginDao.BillingRulesRtb(rules);
	}



	//计费规则表格总条数查询
	@Transactional
	public List<Rules> BillingRulesRzong(Rules rules)
	{

		return  adminLoginDao.BillingRulesRzong(rules);
	}




	//计费规则表格删除
	@Transactional
	public int deBillingRules(Rules rules)
	{

		return adminLoginDao.deBillingRules(rules);
	}

	//计费规则表格修改
	@Transactional
	public int stateBillingRules(Rules rules)
	{

		return adminLoginDao.stateBillingRules(rules);
	}
	//管理员操作日志
	@Transactional
	public int  dayinfo(Tblog tblog){

		return adminLoginDao.dayinfo(tblog);
	}

	//车主操作日志
	@Transactional
	public int  userdayinfo(Tblog tblog){

		return adminLoginDao.userdayinfo(tblog);
	}


	//月缴产品添加重复查询
	@Transactional
	public List<Rules> BillingRulesAddchong(Rules rules)
	{

		return adminLoginDao.BillingRulesAddchong(rules);
	}

	//月缴产品增加
	@Transactional
	public int BillingRulesAdd(Rules rules)
	{

		return adminLoginDao.BillingRulesAdd(rules);
	}



	//日志管理表格分页查询与带条件搜索
	@Transactional
	public List<Tblog> Logmanagementtb(Tblog tblog )
	{

		return  adminLoginDao.Logmanagementtb(tblog);
	}



	//日志管理表格总条数查询
	@Transactional
	public List<Tblog> Logmanagementzong(Tblog tblog)
	{

		return  adminLoginDao.Logmanagementzong(tblog);
	}

	//产品管理修改
	@Transactional
	public int GaiMonthlyPayment(Combo combo)
	{

		return adminLoginDao.GaiMonthlyPayment(combo);
	}

	//临时停车缴费图
	@Transactional
	public List<Inout> VehicleECharts3()
	{

		return  adminLoginDao.VehicleECharts3();
	}

	//排班初始插入
	public boolean ShiftInsertion(List<Arrange> courseList2)
	{

		return  adminLoginDao.ShiftInsertion(courseList2);
	}
	//排班
	@Transactional
	public Map<String, List<Arrange>>  ShiftArrange(Map<String, Object> map2 )
	{
		Map<String, List<Arrange>> map = null;
		List<Arrange> lis=adminLoginDao.ShiftArrange(map2);
		map = new HashMap<>();
		for (int i = 0; i < lis.size(); i++)
		{

			Arrange arrange = lis.get(i);
			if (map.containsKey(arrange.getArrid()))
			{
				List<Arrange> list = map.get(arrange.getArrid());
				list.add(arrange);
			} else
			{
				List<Arrange> list = new ArrayList<>();
				list.add(arrange);
				map.put(arrange.getArrid(), list);
			}
		}
		return map;
//
//		return adminLoginDao.ShiftArrange(map);
	}





	//排班添加界面
	@Transactional
	public List<Arrange> findSubject(){
		return adminLoginDao.findSubject();
	}




	//排班人员添加进去
	@Transactional
	public int ScheduleGai(Arrange arrange)
	{

		return adminLoginDao.ScheduleGai(arrange);
	}



}
