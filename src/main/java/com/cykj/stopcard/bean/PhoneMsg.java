package com.cykj.stopcard.bean;

public class PhoneMsg
{

	private int phonemsgid;
	private String phonenum;
	private int msg;

	public PhoneMsg()
	{
	}

	public PhoneMsg(int phonemsgid, String phonenum, int msg)
	{
		this.phonemsgid = phonemsgid;
		this.phonenum = phonenum;
		this.msg = msg;
	}

	public int getPhonemsgid()
	{
		return phonemsgid;
	}

	public void setPhonemsgid(int phonemsgid)
	{
		this.phonemsgid = phonemsgid;
	}

	public String getPhonenum()
	{
		return phonenum;
	}

	public void setPhonenum(String phonenum)
	{
		this.phonenum = phonenum;
	}

	public int getMsg()
	{
		return msg;
	}

	public void setMsg(int msg)
	{
		this.msg = msg;
	}
}
