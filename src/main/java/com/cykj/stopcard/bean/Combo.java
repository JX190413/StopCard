package com.cykj.stopcard.bean;

//业务实体类
public class Combo
{
	private  int comboid;
	private  String combotime;
	private  String combomoney;
	private int page;
	private  int timeid;

	public int getTimeid()
	{
		return timeid;
	}

	public void setTimeid(int timeid)
	{
		this.timeid = timeid;
	}

	public int getComboid()
	{
		return comboid;
	}

	public void setComboid(int comboid)
	{
		this.comboid = comboid;
	}

	public String getCombotime()
	{
		return combotime;
	}

	public void setCombotime(String combotime)
	{
		this.combotime = combotime;
	}

	public String getCombomoney()
	{
		return combomoney;
	}

	public void setCombomoney(String combomoney)
	{
		this.combomoney = combomoney;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}
}
