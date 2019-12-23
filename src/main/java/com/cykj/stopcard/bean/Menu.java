package com.cykj.stopcard.bean;

public class Menu
{
	private int menuid;
	private String menuname;
	private int fatherid;
	private String menuurl;

	public int getMenuid()
	{
		return menuid;
	}

	public void setMenuid(int menuid)
	{
		this.menuid = menuid;
	}

	public String getMenuname()
	{
		return menuname;
	}

	public void setMenuname(String menuname)
	{
		this.menuname = menuname;
	}

	public int getFatherid()
	{
		return fatherid;
	}

	public void setFatherid(int fatherid)
	{
		this.fatherid = fatherid;
	}

	public String getMenuurl()
	{
		return menuurl;
	}

	public void setMenuurl(String menuurl)
	{
		this.menuurl = menuurl;
	}
}
