package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CarDao
{
	//1、寻找空闲车位
	public List<CardPort> searchFreeCardPort();

	//2、车辆进场
	public int CarIn(CarInOut carInOut);

	//3、修改车位状态
	public int updatePortState(@Param("stateid") String stateid, @Param("portname")String portname);

	//4、反向寻车
	public CardPort searchCardPort(@Param("carnum") String carnum);


}
