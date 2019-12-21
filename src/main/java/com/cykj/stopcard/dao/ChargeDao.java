package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.Business;
import com.cykj.stopcard.bean.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ChargeDao
{
	public List<Product> selfasttime();
	public List<CardPort> selall();
	public  int selcormid(String time);
	public  int inserole(Business business);
}
