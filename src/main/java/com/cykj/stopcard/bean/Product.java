package com.cykj.stopcard.bean;

public class Product
{
	private int rulesid;
	private String ruletime;
	private int chargemoney;
	private int moremoney;
	private int mealid;

	public Product()
	{
	}

	public Product(int rulesid, String ruletime, int chargemoney, int moremoney, int mealid)
	{
		this.rulesid = rulesid;
		this.ruletime = ruletime;
		this.chargemoney = chargemoney;
		this.moremoney = moremoney;
		this.mealid = mealid;
	}

	public int getRulesid()
	{
		return rulesid;
	}

	public void setRulesid(int rulesid)
	{
		this.rulesid = rulesid;
	}

	public String getRuletime()
	{
		return ruletime;
	}

	public void setRuletime(String rultime)
	{
		this.ruletime = rultime;
	}

	public int getChargemoney()
	{
		return chargemoney;
	}

	public void setChargemoney(int chargemoney)
	{
		this.chargemoney = chargemoney;
	}

	public int getMoremoney()
	{
		return moremoney;
	}

	public void setMoremoney(int moremoney)
	{
		this.moremoney = moremoney;
	}

	public int getMealid()
	{
		return mealid;
	}

	public void setMealid(int mealid)
	{
		this.mealid = mealid;
	}
}
