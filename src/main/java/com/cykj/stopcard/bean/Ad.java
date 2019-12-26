package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;


public class Ad
{
	private int adid;
	private String adname;
	private String adurl;
	private String admsg;
	private String adimg;

	public int getAdid()
	{
		return adid;
	}

	public void setAdid(int adid)
	{
		this.adid = adid;
	}

	public String getAdname()
	{
		return adname;
	}

	public void setAdname(String adname)
	{
		this.adname = adname;
	}

	public String getAdurl()
	{
		return adurl;
	}

	public void setAdurl(String adurl)
	{
		this.adurl = adurl;
	}

	public String getAdmsg()
	{
		return admsg;
	}

	public void setAdmsg(String admsg)
	{
		this.admsg = admsg;
	}

	public String getAdimg()
	{
		return adimg;
	}

	public void setAdimg(String adimg)
	{
		this.adimg = adimg;
	}


	@Override
	public String toString()
	{
		return "Ad{" + "adid=" + adid + ", adname='" + adname + '\'' + ", adurl='" + adurl + '\'' + ", admsg='" + admsg + '\'' + ", adimg='" + adimg + '\'' + '}';
	}
}
