package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.CarInOut;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CarDao
{
	//车辆进场
	public int CarIn(CarInOut carInOut);


}
