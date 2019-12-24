package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.CardPort;
import com.cykj.stopcard.bean.Business;
import com.cykj.stopcard.bean.Combo;
import com.cykj.stopcard.bean.Product;
import com.cykj.stopcard.dao.ChargeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ChargeService
{
	@Resource
	private ChargeDao chargeDao;
	public List<Product> selfasttime(){
		return  chargeDao.selfasttime();
	}
public  List<CardPort> selall(int limit, int page1){
		int page=0;
if (page1>1){
	 page=(page1-1)*10;
}



		return  chargeDao.selall(limit,page);}
public int  selcormid(String time){
		return  chargeDao.selcormid(time);
}
public  int inserole(Business business){
		return  chargeDao.inserole(business);
}
public List<Combo> selcomtime(String time){return chargeDao.selcomboid(time);}
	public int selodnumber(String carnum){return chargeDao.selodnumber(carnum) ;}
	public List<Business> selhuiyuan(String carnum){return chargeDao.selhuiyuan(carnum) ;}
	public int deleall(String carnum){return chargeDao.delall(carnum) ;}
	public int uptype(String out_trade_no){return chargeDao.uptype(out_trade_no) ;}
	public int selallnumber(){return chargeDao.selallnumber();}
}
