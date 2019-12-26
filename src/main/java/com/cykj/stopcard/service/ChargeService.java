package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.*;
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
	public  List<CardPort> selall(int limit, int page1,String where){
		int page=0;
		if (page1>1){
			page=(page1-1)*10;
		}
		Page page2=new Page();
		page2.setLimit(limit);
		page2.setPage(page);
		page2.setWhere(where);
		return  chargeDao.selall(page2);}
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
	public int selallnumber(String where){return chargeDao.selallnumber(where);}
	public int selcarid(String statename){return chargeDao.selcarid(statename);}
	public int upcartype(CardPort cardPort){return chargeDao.upcartype(cardPort);}
	public int insetdaile(String dailetime,String money){return chargeDao.insetdaile(dailetime,money);}
	public List<Cost> selmoney(String fasttime, String nexttime){return chargeDao.selmoney(fasttime,nexttime);}
	public List<Daile> seldaile(String nowday){return chargeDao.seldaile(nowday);}
	public List<Combo> selcarbo(){return chargeDao.selcarbo();}
}
