package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

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
}
