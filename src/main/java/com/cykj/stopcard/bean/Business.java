package com.cykj.stopcard.bean;

public class Business
{

public  int businessid;
	public  int comboid;
	public String paytime;
	public String pasttime;
	public String carnum;
public String cartype;

	public String getCartype()
	{
		return cartype;
	}

	public void setCartype(String cartype)
	{
		this.cartype = cartype;
	}

	public int getBusinessid()
	{
		return businessid;
	}

	public void setBusinessid(int businessid)
	{
		this.businessid = businessid;
	}

	public int getComboid()
	{
		return comboid;
	}

	public void setComboid(int comboid)
	{
		this.comboid = comboid;
	}

	public String getPaytime()
	{
		return paytime;
	}

	public void setPaytime(String paytime)
	{
		this.paytime = paytime;
	}

	public String getPasttime()
	{
		return pasttime;
	}

	public void setPasttime(String pasttime)
	{
		this.pasttime = pasttime;
	}

	public String getCarnum()
	{
		return carnum;
	}

	public void setCarnum(String carnum)
	{
		this.carnum = carnum;
	}
}
