package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.Business;
import com.cykj.stopcard.bean.Combo;
import com.cykj.stopcard.bean.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface ChargeDao
{
	public List<Product> selfasttime();
	public List<CardPort> selall(@Param("limit")int limit, @Param("page")int page);
	public  int selcormid(String time);
	public  int inserole(Business business);
	public List<Combo> selcomboid(String selcomboid);
	public int selodnumber(String carnum);
	public List<Business> selhuiyuan(String carnum);
	public int delall(String carnum);
	public  int uptype(String out_trade_no);
}
