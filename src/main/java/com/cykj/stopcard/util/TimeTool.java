package com.cykj.stopcard.util;

import javax.xml.crypto.Data;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class TimeTool
{
	public static SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");

	//获取当前时间
	public static String getDate()
	{

		Date date = new Date(System.currentTimeMillis());
		String newDate = formatter.format(date);
		return newDate;
	}
	//获取当前时间
	public static String getDate2()
	{

		Date date = new Date(System.currentTimeMillis());
		String newDate = formatter2.format(date);
		return newDate;
	}

	//获取当前时分秒
	//	public static String getTime(){
	//		SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
	//		Date date = new Date(System.currentTimeMillis());
	//		String nowTime = formatter.format(date);
	//		return nowTime;
	//	}

	//计算时间差值（分钟）
	public static long timeDiff(String startDate, String endDate)
	{
		long minutes = 0;
		try
		{
			Date d1 = formatter.parse(endDate);
			Date d2 = formatter.parse(startDate);
			long diff = d1.getTime() - d2.getTime();//这样得到的差值是毫秒级别
			minutes = diff / (1000 * 60);
		} catch (Exception e)
		{
		}
		return minutes;
	}
	//判断日期是否在某个时间区间段
	public static boolean belongCalendar(String nowTime, String beginTime, String endTime)
	{
		Date d1 = null;
		Date d2 = null;
		Date d3 = null;
		try
		{
			d1 = formatter2.parse(nowTime);
			d2 = formatter2.parse(beginTime);
			d3 = formatter2.parse(endTime);
		} catch (ParseException e)
		{
			e.printStackTrace();
		}
		//设置当前时间
		Calendar date = Calendar.getInstance();
		date.setTime(d1);
		//设置开始时间
		Calendar begin = Calendar.getInstance();
		begin.setTime(d2);
		//设置结束时间
		Calendar end = Calendar.getInstance();
		end.setTime(d3);
		//处于开始时间之后，和结束时间之前的判断
		if (date.after(begin) && date.before(end))
		{
			return true;
		} else
		{
			if(date.equals(begin)||date.equals(end)){
				return true;
			}
			else {
				return false;
			}
		}
	}

}