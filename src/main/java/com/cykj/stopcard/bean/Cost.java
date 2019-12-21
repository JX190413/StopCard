package com.cykj.stopcard.bean;

public class Cost
{

     private int payid;
     private int money;
     private int sellmoney;
	 private String paytype;
	 private String monthpaytype;
	 private int sellid;
     private  int sum;
	 private  int monthsum;


	public String getMonthpaytype()
	{
		return monthpaytype;
	}

	public void setMonthpaytype(String monthpaytype)
	{
		this.monthpaytype = monthpaytype;
	}

	public int getPayid()
	{
		return payid;
	}

	public void setPayid(int payid)
	{
		this.payid = payid;
	}

	public int getMoney()
	{
		return money;
	}

	public void setMoney(int money)
	{
		this.money = money;
	}


	public int getSellmoney()
	{
		return sellmoney;
	}

	public void setSellmoney(int sellmoney)
	{
		this.sellmoney = sellmoney;
	}

	public String getPaytype()
	{
		return paytype;
	}

	public void setPaytype(String paytype)
	{
		this.paytype = paytype;
	}

	public int getSellid()
	{
		return sellid;
	}

	public void setSellid(int sellid)
	{
		this.sellid = sellid;
	}

	public int getSum()
	{
		return sum;
	}

	public void setSum(int sum)
	{
		this.sum = sum;
	}

	public int getMonthsum()
	{
		return monthsum;
	}

	public void setMonthsum(int monthsum)
	{
		this.monthsum = monthsum;
	}
}
