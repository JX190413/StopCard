package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.Area;
import com.cykj.stopcard.bean.CarInOut;
import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.dao.CarDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

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

	//所有车位信息查询
	public List<CardPort> carPortQuery(){
		return carDao.carPortQuery();
	}

	//被点击车位信息查询
	public CardPort carPortClick(int id){
		return carDao.carPortClick(id);
	}

	//获取分区标注信息
	public List<Area> carArea(){
		return carDao.carArea();
	}

	//动态修改车辆分区
	public int changeArea(String portArea,int belong){
		return carDao.changeArea(portArea,belong);
	}

	//绑定车牌车位
	public int updateCarIn(String portname,String carnum){
		return carDao.updateCarIn(portname,carnum);
	}

	//用车查白名单
	public Map searchWhite(String carnum){
		return carDao.searchWhite(carnum);
	}
	//用车查月缴查询
	public Map searchBusiness(String carnum){
		return carDao.searchBusiness(carnum);
	}

	//车辆出场查询车辆停放信息
	public CarInOut searchCarInOut(String carnum){
		return carDao.searchCarInOut(carnum);
	}

	//写入出场时间，停放时长，缴费类型，缴费金额
	public int updateCarOut(CarInOut carInOut){
		return carDao.updateCarOut(carInOut);
	}

	//缴费后修改缴费状态
	public int updateCarOutState(String stateid,String carnum){
		return carDao.updateCarOutState(stateid,carnum);
	}
	//缴费后修改车位状态
	public int updatePortState2(String stateid,String carnum){
		return carDao.updatePortState2(stateid,carnum);
	}



}
