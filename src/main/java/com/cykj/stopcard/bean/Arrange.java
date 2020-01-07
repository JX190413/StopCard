package com.cykj.stopcard.bean;

public class Arrange
{

	private int arrangeid;
	private String arrangetime;
	private String arrangedate;
	private int workerid;
    private int stateid;
    private String arrid;
	private String workeraccount;


	public String getWorkeraccount()
	{
		return workeraccount;
	}

	public void setWorkeraccount(String workeraccount)
	{
		this.workeraccount = workeraccount;
	}

	public String getArrid()
	{
		return arrid;
	}

	public void setArrid(String arrid)
	{
		this.arrid = arrid;
	}

	public int getStateid()
	{
		return stateid;
	}

	public void setStateid(int stateid)
	{
		this.stateid = stateid;
	}

	public int getArrangeid()
	{
		return arrangeid;
	}

	public void setArrangeid(int arrangeid)
	{
		this.arrangeid = arrangeid;
	}

	public String getArrangetime()
	{
		return arrangetime;
	}

	public void setArrangetime(String arrangetime)
	{
		this.arrangetime = arrangetime;
	}

	public String getArrangedate()
	{
		return arrangedate;
	}

	public void setArrangedate(String arrangedate)
	{
		this.arrangedate = arrangedate;
	}

	public int getWorkerid()
	{
		return workerid;
	}

	public void setWorkerid(int workerid)
	{
		this.workerid = workerid;
	}
}
