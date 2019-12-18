package com.cykj.stopcard.util;

import javax.xml.crypto.Data;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class GetNowTime
{

	//获取当前时间
	public static String getDate(){
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date(System.currentTimeMillis());
		String newDate = formatter.format(date);
		return newDate;
	}
	//获取当前时分秒
//	public static String getTime(){
//		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
//		Date date = new Date(System.currentTimeMillis());
//		String nowTime = formatter.format(date);
//		return nowTime;
//	}


	public static void main(String[] args)
	{
		//System.out.println(getDate());
		//System.out.println(getTime());
//		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd mm:HH:ss");
//		try {
//			Date date = dateFormat.parse("2019-12-18 09:45:23");
//			Date date2 = dateFormat.parse("2019-12-18 10:45:23");
//			System.out.println(date);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		Date data=new Date("2019-12-18 09:45:23");
//		Calendar calendar=Calendar.getInstance();
//		calendar.setTime(new Date());
//		System.out.println(calendar.get(Calendar.DAY_OF_MONTH));//今天的日期
//		calendar.set(Calendar.DAY_OF_MONTH,calendar.get(Calendar.DAY_OF_MONTH)+1);//让日期加1
//		System.out.println(calendar.get(Calendar.DATE));//加1之后的日期Top
	}
}
