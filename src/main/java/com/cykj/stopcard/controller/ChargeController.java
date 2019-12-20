package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.Product;
import com.cykj.stopcard.service.ChargeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class ChargeController
{
	@Resource
	private ChargeService chargeService;

	//计算
	public String selmoney(String minute){
		int minte1=Integer.parseInt(minute);
		String money="";
		List<Product> list1=chargeService.selfasttime();
		int fasttime=Integer.parseInt(list1.get(0).getRuletime());
		int twotime=Integer.parseInt(list1.get(1).getRuletime());
		int threetime=Integer.parseInt(list1.get(2).getRuletime());
		int lasttime=Integer.parseInt(list1.get(3).getRuletime());
		int fastmoney=list1.get(1).getMoremoney();
		int nextmoney=list1.get(2).getMoremoney();
		int money3=list1.get(2).getChargemoney();
		int money4=list1.get(1).getChargemoney();
		int money5=list1.get(0).getChargemoney();
		int money6=list1.get(3).getChargemoney();
		if (fasttime>=minte1){
			String money2=String.valueOf(money5);
			return money2;
		}
		else if (fasttime<minte1&&minte1<=twotime){
			String money2=String.valueOf(money4);
			return money2;
		}
		else if (twotime<minte1&&minte1<=threetime){
			int chaoguo=minte1-twotime;
			double allmoney= ((double) fastmoney/60.00)*chaoguo+money4;
			String result = String.format("%.2f", allmoney);
			return result;
		}
		else if (threetime<minte1&&minte1<=lasttime){
			int chaoguo=minte1-threetime;
			double allmoney1= ((double) nextmoney/60.00)*chaoguo+money3;
			String result = String.format("%.2f", allmoney1);
			return result;
		}
		else {
			String result1=String.valueOf(money6);
			return result1;
		}

	}
}
