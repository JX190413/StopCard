package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

@Component
public class CarInOut
{
	private int inoutid;
	private String  carnum;
	private String  intime;
	private String  outtime;
	private String  stoptime;
	private int  payid;
	private String  money;
	private String  portname;
	private int  stateid;

	public int getInoutid()
	{
		return inoutid;
	}

	public void setInoutid(int inoutid)
	{
		this.inoutid = inoutid;
	}

	public String getCarnum()
	{
		return carnum;
	}

	public void setCarnum(String carnum)
	{
		this.carnum = carnum;
	}

	public String getIntime()
	{
		return intime;
	}

	public void setIntime(String intime)
	{
		this.intime = intime;
	}

	public String getOuttime()
	{
		return outtime;
	}

	public void setOuttime(String outtime)
	{
		this.outtime = outtime;
	}

	public String getStoptime()
	{
		return stoptime;
	}

	public void setStoptime(String stoptime)
	{
		this.stoptime = stoptime;
	}

	public int getPayid()
	{
		return payid;
	}

	public void setPayid(int payid)
	{
		this.payid = payid;
	}

	public String getMoney()
	{
		return money;
	}

	public void setMoney(String money)
	{
		this.money = money;
	}


	public String getPortname()
	{
		return portname;
	}

	public void setPortname(String portname)
	{
		this.portname = portname;
	}

	public int getStateid()
	{
		return stateid;
	}

	public void setStateid(int stateid)
	{
		this.stateid = stateid;
	}
}
