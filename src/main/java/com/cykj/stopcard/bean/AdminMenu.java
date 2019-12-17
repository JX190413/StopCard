package com.cykj.stopcard.bean;

//后台菜单实体类
public class AdminMenu
{
	private int workerid;
	private String workeraccount;
	private String statename;
	private String fathername;
	private String chilename;
	private String menuurl;

	public AdminMenu()
	{
	}

	public AdminMenu(int workerid, String workeraccount, String statename, String fathername, String chilename, String menuurl)
	{
		this.workerid = workerid;
		this.workeraccount = workeraccount;
		this.statename = statename;
		this.fathername = fathername;
		this.chilename = chilename;
		this.menuurl = menuurl;
	}

	public int getWorkerid()
	{
		return workerid;
	}

	public void setWorkerid(int workerid)
	{
		this.workerid = workerid;
	}

	public String getWorkeraccount()
	{
		return workeraccount;
	}

	public void setWorkeraccount(String workeraccount)
	{
		this.workeraccount = workeraccount;
	}

	public String getStatename()
	{
		return statename;
	}

	public void setStatename(String statename)
	{
		this.statename = statename;
	}

	public String getFathername()
	{
		return fathername;
	}

	public void setFathername(String fathername)
	{
		this.fathername = fathername;
	}

	public String getChilename()
	{
		return chilename;
	}

	public void setChilename(String chilename)
	{
		this.chilename = chilename;
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
