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
	public List<Commodity> selbus4(int limit, int page1,String where,String where2){
		int page=0;
		if (page1>1){
			page=(page1-1)*10;
		}
		Page page2=new Page();
		page2.setLimit(limit);
		page2.setPage(page);
		page2.setWhere(where);
	page2.setFast(where2);
		return  chargeDao.selshopping(page2);
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
	public int selallnumber5(String where){return chargeDao.selallnumber5(where);}
	public int selcarid(String statename){return chargeDao.selcarid(statename);}
	public int upcartype(CardPort cardPort){return chargeDao.upcartype(cardPort);}
	public int insetdaile(String dailetime,String money,String dailetime2){return chargeDao.insetdaile(dailetime,money,dailetime2);}
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
	public  int selstateid5(String statename){return  chargeDao.selstateid5(statename);}
	public   String selusermoney(String carnum){return chargeDao.selusermoney(carnum);}
	public  List<Combo> selcombo(String money){return  chargeDao.selcombo(money);}
	public int insetsell(String money,String comboid,String time,String carnum,String selltype){ return chargeDao.insetsell(money,comboid,time,carnum,selltype);}
	public int selpeyid(){return chargeDao.selpeyid();}
	public List<UserManagement> seluser(UserManagement worker){return  chargeDao.seluser(worker);}
	public int insetuser(UserManagement userManagement){return  chargeDao.insetuser(userManagement);}
	public List<UserManagement> selname(String username){return chargeDao.selname(username);}
	public List<UserManagement> selname2(String carnum){return chargeDao.selname2(carnum);}
	public List<Partation> selpartitio(int typeid){return  chargeDao.selpartitio(typeid);}
	public List<Partation> selpartitio2(int typeid){return  chargeDao.selpartitio2(typeid);}
	public List<Commodity> selcommid(String partitionname){return  chargeDao.selcommid(partitionname);}
	public List<Commodity> selcommid2(int selcommid2){return  chargeDao.selcommid2(selcommid2);}
	public List<Commodity> selcommid3(){return  chargeDao.selcommid3();}
	public List<Commodity> selshop(String commodityname){return  chargeDao.selshop(commodityname);}
	public List<Partation> selshoplunbo(String typeid,String partitionname){return  chargeDao.selshoplunbo(typeid,partitionname);}
	public  int insetshopcart(Shoppingcart shoppingcart){return chargeDao.insetshopcart(shoppingcart);}
	public List<Shoppingcart> selshoppingcart(int userid){return  chargeDao.selshoppingcart(userid);}
	public List<Shoppingcart> selshoppingcart2(int shopid){return  chargeDao.selshoppingcart2(shopid);}
	public  List<Commodity> selinshop(){return chargeDao.selinshop();}
	public int upnumber(String number,String name){return chargeDao.upnumber(number,name);}
	public int upfenqu(String name,String parname){return chargeDao.upfenqu(name,parname);}
	public int upfenqu2(String name,String parname){return chargeDao.upfenqu2(name,parname);}
	public int upimage(String image,String id){return chargeDao.upimage(image,id);}



}
