package com.cykj.stopcard.bean;

public class Shoppingcart

{
	private int id;
	private int shopid;
	private int userid;
	private int commodityid;
	private int commoditynumber;
	private int commodityidprice;
	private String commodityname;
	private  String image;

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getImage()
	{
		return image;
	}

	public void setImage(String image)
	{
		this.image = image;
	}

	public int getShopid()
	{
		return shopid;
	}

	public void setShopid(int shopid)
	{
		this.shopid = shopid;
	}

	public int getUserid()
	{
		return userid;
	}

	public void setUserid(int userid)
	{
		this.userid = userid;
	}

	public int getCommodityid()
	{
		return commodityid;
	}

	public void setCommodityid(int commodityid)
	{
		this.commodityid = commodityid;
	}

	public int getCommoditynumber()
	{
		return commoditynumber;
	}

	public void setCommoditynumber(int commoditynumber)
	{
		this.commoditynumber = commoditynumber;
	}

	public int getCommodityidprice()
	{
		return commodityidprice;
	}

	public void setCommodityidprice(int commodityidprice)
	{
		this.commodityidprice = commodityidprice;
	}

	public String getCommodityname()
	{
		return commodityname;
	}

	public void setCommodityname(String commodityname)
	{
		this.commodityname = commodityname;
	}
}
