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
		public List<Business> selbus(int limit, int page1,String fast){
			int page=0;
			if (page1>1){
				page=(page1-1)*10;
			}
			Page page2=new Page();
			page2.setLimit(limit);
			page2.setPage(page);
			page2.setFast(fast);

		return  chargeDao.selbus(page2);
	}
	public List<Business> selbus2(int limit, int page1,String fast,String last){
		int page=0;
		if (page1>1){
			page=(page1-1)*10;
		}
		Page page2=new Page();
		page2.setLimit(limit);
		page2.setPage(page);
		page2.setFast(fast);
		page2.setLast(last);
		return  chargeDao.selbus2(page2);
	}
	public List<CarInOut> selbus3(int limit, int page1,String where,int payid){
		int page=0;
		if (page1>1){
			page=(page1-1)*10;
		}
		Page page2=new Page();
		page2.setLimit(limit);
		page2.setPage(page);
		page2.setWhere(where);
		page2.setPayid(payid);
		return  chargeDao.selbus3(page2);
	}
	public int  selcormid(String time){
		return  chargeDao.selcormid(time);
	}
	public  int inserole(Business business){
		return  chargeDao.inserole(business);
	}
	public List<Combo> selcomtime(String time){return chargeDao.selcomboid(time);}
	public int selodnumber(String carnum,String cartype){return chargeDao.selodnumber(carnum,cartype) ;}
	public List<Business> selhuiyuan(String carnum,String cartype){return chargeDao.selhuiyuan(carnum,cartype) ;}
	public int deleall(String carnum,String cartype){return chargeDao.delall(carnum,cartype) ;}
	public int uptype(String out_trade_no,String cartype){return chargeDao.uptype(out_trade_no,cartype) ;}
	public int selallnumber(String where){return chargeDao.selallnumber(where);}
	public int selallnumber2(String fast,String last){return chargeDao.selallnumber2(fast,last);}
	public int selallnumber3(String fast){return chargeDao.selallnumber3(fast);}
	public int selallnumber4(String where,String payid){return chargeDao.selallnumber4(where,payid);}
	public int selcarid(String statename){return chargeDao.selcarid(statename);}
	public int upcartype(CardPort cardPort){return chargeDao.upcartype(cardPort);}
	public int insetdaile(String dailetime,String money){return chargeDao.insetdaile(dailetime,money);}
	public List<Cost> selmoney(String fasttime, String nexttime){return chargeDao.selmoney(fasttime,nexttime);}
	public List<Daile> seldaile(String nowday){return chargeDao.seldaile(nowday);}
	public List<Combo> selcarbo(){return chargeDao.selcarbo();}
	public int overmoney(UserManagement userManagement){return  chargeDao.overmoney(userManagement);}
	public int delwhile(String carnum){ return chargeDao.delwhile(carnum);}
	public List<Whitelist> selwrile(String carnum){return chargeDao.selwhile(carnum);}
	public int uptypecar(String carnum,String cartype){ return chargeDao.uptypecar(carnum,cartype);}
	public List<UserManagement> selbance(String carnum){ return chargeDao.selbalance(carnum);}
	public  int uptime5(String time,String carnum,String cartype){ return  chargeDao.uptime5(time,carnum,cartype);}
	public  int selstateid(){return  chargeDao.selstateid();}
	public  int selstateid2(){return  chargeDao.selstateid2();}
	public  int selstateid3(){return  chargeDao.selstateid3();}
	public  int selstateid4(){return  chargeDao.selstateid4();}
	public   String selusermoney(String carnum){return chargeDao.selusermoney(carnum);}
	public  List<Combo> selcombo(String money){return  chargeDao.selcombo(money);}
	public int insetsell(String money,String comboid,String time,String carnum,String selltype){ return chargeDao.insetsell(money,comboid,time,carnum,selltype);}
	public int selpeyid(){return chargeDao.selpeyid();}
	public List<UserManagement> seluser(UserManagement worker){return  chargeDao.seluser(worker);}
}
