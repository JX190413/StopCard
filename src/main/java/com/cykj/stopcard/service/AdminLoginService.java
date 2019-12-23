package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.*;
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
//查询工作人员用户信息
	@Transactional
	public List<Worker> queryWorker(Worker worker){
		return  adminLoginDao.queryWorker(worker);


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


	//临时停车缴费图
	@Transactional
	public List<Cost> ECharts()
	{

		return  adminLoginDao.ECharts();
	}

	//月缴产品缴费图
	@Transactional
	public List<Cost> EChartsmonth()
	{

		return  adminLoginDao.EChartsmonth();
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


}
