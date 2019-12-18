package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.dao.CarDao;
import com.cykj.stopcard.util.GetNowTime;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service
public class CarService
{
	@Resource
	private CarDao carDao;
	@Resource
	private CarInOut carInOut;
	//车辆入场

	public void cardIn(CarInOut carInOut){
		String nowDate=GetNowTime.getDate();
		carInOut.setIntime(nowDate);
		carInOut.setStateid(3);
		int num=carDao.CarIn(carInOut);
		if(num>0){
			System.out.println("车辆入场成功！");
		}
	}

}
