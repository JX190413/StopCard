package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.Area;
import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import com.sun.xml.internal.bind.v2.model.core.ID;
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

	//5、所有车位信息查询
	public List<CardPort> carPortQuery();

	//6、被点击车位信息查询
	public CardPort carPortClick(@Param("ID") int id);

	//7、获取分区标注信息
	public List<Area> carArea();

	//8、动态修改车辆分区
	public int changeArea(@Param("portarea") String portArea,@Param("belong") int belong);


}
