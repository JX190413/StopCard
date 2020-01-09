package com.cykj.stopcard.bean;

public class Commodity
{
	private int commodityid;
	private String commodityname;
	private String commoditymoney;
	private String commodityphoto;
	private String commoditydetails;
	private String Jumpurl;
	private String address;
	private  int stock;
	public  Commodity(String Jumpurl,int commodityid, String commodityname, String commoditymoney, String commodityphoto, String commoditydetails)
	{
		this.commodityid = commodityid;
		this.commodityname = commodityname;
		this.commoditymoney = commoditymoney;
		this.commodityphoto = commodityphoto;
		this.commoditydetails = commoditydetails;
		this.Jumpurl=Jumpurl;
	}

	public Commodity()
	{
	}

	public int getStock()
	{
		return stock;
	}

	public void setStock(int stock)
	{
		this.stock = stock;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public int getCommodityid()
	{
		return commodityid;
	}

	public String getJumpurl()
	{
		return Jumpurl;
	}

	public void setJumpurl(String jumpurl)
	{
		Jumpurl = jumpurl;
	}

	public void setCommodityid(int commodityid)
	{
		this.commodityid = commodityid;
	}

	public String getCommodityname()
	{
		return commodityname;
	}

	public void setCommodityname(String commodityname)
	{
		this.commodityname = commodityname;
	}

	public String getCommoditymoney()
	{
		return commoditymoney;
	}

	public void setCommoditymoney(String commoditymoney)
	{
		this.commoditymoney = commoditymoney;
	}

	public String getCommodityphoto()
	{
		return commodityphoto;
	}

	public void setCommodityphoto(String commodityphoto)
	{
		this.commodityphoto = commodityphoto;
	}

	public String getCommoditydetails()
	{
		return commoditydetails;
	}

	public void setCommoditydetails(String commoditydetails)
	{
		this.commoditydetails = commoditydetails;
	}
}
