package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ChargeDao
{
	public List<Product> selfasttime();
	public List<CardPort> selall(Page page);
	public  int selcormid(String time);
	public  int inserole(Business business);
	public List<Combo> selcomboid(String selcomboid);
	public int selodnumber(String carnum,String cartype);
	public List<Business> selhuiyuan(String carnum,String cartype);
	public int delall(String carnum,String cartype);
	public  int uptype(String out_trade_no,String cartype);
	public  int selallnumber(String where);
	public int selcarid(String statename);
	public int upcartype(CardPort cardPort);
	public List<Cost> selmoney(String fasttime,String nexttime);
	public int insetdaile(String dailetime,String money);
	public List<Daile> seldaile(String nowday);
	public List<Business> selcar(String carnum);
	public List<Combo> selcarbo();
	public int overmoney(UserManagement userManagement);
	public int delwhile(String carnum);
	public List<Whitelist> selwhile(String carnum);
	public int uptypecar(String carnum,String cartype);
	public List<UserManagement> selbalance(String carnum);
	public int uptime5(String time,String carnum,String cartype);
	public  int selstateid();
	public  int selstateid2();
	public  int selstateid3();
	public  String selusermoney(String carnum);
	public  List<Combo> selcombo(String money);
	public int insetsell(String money,String comboid,String time,String carnum,String selltype);
}
