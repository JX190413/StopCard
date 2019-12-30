package com.cykj.stopcard.bean;

public class Page
{
	private int limit;
	private  int page;
	private String where;
	private String fast;
	private String last;
	private  int payid;

	public int getPayid()
	{
		return payid;
	}

	public void setPayid(int payid)
	{
		this.payid = payid;
	}

	private int stateid;

	public int getStateid()
	{
		return stateid;
	}

	public void setStateid(int stateid)
	{
		this.stateid = stateid;
	}

	public String getFast()
	{
		return fast;
	}

	public void setFast(String fast)
	{
		this.fast = fast;
	}

	public String getLast()
	{
		return last;
	}

	public void setLast(String last)
	{
		this.last = last;
	}

	public int getLimit()
	{
		return limit;
	}

	public void setLimit(int limit)
	{
		this.limit = limit;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}

	public String getWhere()
	{
		return where;
	}

	public void setWhere(String where)
	{
		this.where = where;
	}
}
