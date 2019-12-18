package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.dao.CarDao;
import com.cykj.stopcard.util.GetNowTime;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CarService
{
	@Resource
	private CarDao carDao;
	@Resource
	private CarInOut carInOut;

	//查找空闲车位
	public List<CardPort> searchFreeCardPort(){
		return carDao.searchFreeCardPort();
	}

	//车辆入场
	public void cardIn(CarInOut carInOut){
		String nowDate=GetNowTime.getDate();
		carInOut.setIntime(nowDate);
		carInOut.setStateid(4);
		int num=carDao.CarIn(carInOut);
		if(num>0){
			System.out.println("车辆入场成功！车牌："+carInOut.getCarnum()+","+carInOut.getPortname());
		}
	}

	//修改车位状态
	public void updatePortState(String stateid,String portname){
		carDao.updatePortState(stateid,portname);
	}

	//车辆入场
	public CardPort searchCardPort(String cardnum){
		return carDao.searchCardPort(cardnum);
	}




}
