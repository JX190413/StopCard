package com.cykj.stopcard.bean;

//用户实体类
public class UserManagement
{
	private String userid;
	private String username;
	private String userpass;
	private String userphone;
	private String useraddress;
	private String carnum;
	private String usertime;

	public UserManagement()
	{
	}

	public UserManagement(String userid, String username, String userpass, String userphone, String useraddress, String carnum, String usertime)
	{
		this.userid = userid;
		this.username = username;
		this.userpass = userpass;
		this.userphone = userphone;
		this.useraddress = useraddress;
		this.carnum = carnum;
		this.usertime = usertime;
	}

	public String getUserid()
	{
		return userid;
	}

	public void setUserid(String userid)
	{
		this.userid = userid;
	}

	public String getUsername()
	{
		return username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getUserpass()
	{
		return userpass;
	}

	public void setUserpass(String userpass)
	{
		this.userpass = userpass;
	}

	public String getUserphone()
	{
		return userphone;
	}

	public void setUserphone(String userphone)
	{
		this.userphone = userphone;
	}

	public String getUseraddress()
	{
		return useraddress;
	}

	public void setUseraddress(String useraddress)
	{
		this.useraddress = useraddress;
	}

	public String getCarnum()
	{
		return carnum;
	}

	public void setCarnum(String carnum)
	{
		this.carnum = carnum;
	}

	public String getUsertime()
	{
		return usertime;
	}

	public void setUsertime(String usertime)
	{
		this.usertime = usertime;
	}
}