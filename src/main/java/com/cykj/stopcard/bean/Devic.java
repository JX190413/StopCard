package com.cykj.stopcard.bean;

public class Devic
{
	private int devicid;
	private String devicearea;
	private String devicname;
	private int devicstate;
	private int page;
	private String statename;

	private String devictime;

	private int state;

	public int getState()
	{
		return state;
	}

	public void setState(int state)
	{
		this.state = state;
	}

	public String getDevictime()
	{
		return devictime;
	}

	public void setDevictime(String devictime)
	{
		this.devictime = devictime;
	}

	public int getDevicid()
	{
		return devicid;
	}

	public void setDevicid(int devicid)
	{
		this.devicid = devicid;
	}

	public String getDevicearea()
	{
		return devicearea;
	}

	public void setDevicearea(String devicearea)
	{
		this.devicearea = devicearea;
	}

	public String getDevicname()
	{
		return devicname;
	}

	public void setDevicname(String devicname)
	{
		this.devicname = devicname;
	}

	public int getDevicstate()
	{
		return devicstate;
	}

	public void setDevicstate(int devicstate)
	{
		this.devicstate = devicstate;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}

	public String getStatename()
	{
		return statename;
	}

	public void setStatename(String statename)
	{
		this.statename = statename;
	}
}
