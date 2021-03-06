package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

//停车位实体类
@Component
public class CardPort
{
	private int portid;
	private int portcardid;
	private String portarea;
	private String portname;
	private int stateid;
	private String portx;
	private String porty;
	private String carnum;
	private  String statename;

	public String getStatename()
	{
		return statename;
	}

	public void setStatename(String statename)
	{
		this.statename = statename;
	}

	public int getPortid()
	{
		return portid;
	}

	public void setPortid(int portid)
	{
		this.portid = portid;
	}

	public int getPortcardid()
	{
		return portcardid;
	}

	public void setPortcardid(int portcardid)
	{
		this.portcardid = portcardid;
	}

	public String getPortarea()
	{
		return portarea;
	}

	public void setPortarea(String portarea)
	{
		this.portarea = portarea;
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

	public String getPortx()
	{
		return portx;
	}

	public void setPortx(String portx)
	{
		this.portx = portx;
	}

	public String getPorty()
	{
		return porty;
	}

	public void setPorty(String porty)
	{
		this.porty = porty;
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
