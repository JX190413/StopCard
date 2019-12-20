package com.cykj.stopcard.bean;

//白名单实体类
public class Whitelist
{
	private int whiteid;
	private String carnum;

	public Whitelist(int whiteid, String carnum)
	{
		this.whiteid = whiteid;
		this.carnum = carnum;
	}

	public Whitelist()
	{
	}

	public int getWhiteid()
	{
		return whiteid;
	}

	public void setWhiteid(int whiteid)
	{
		this.whiteid = whiteid;
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
