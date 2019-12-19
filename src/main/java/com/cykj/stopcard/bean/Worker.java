package com.cykj.stopcard.bean;
//后台管理员实体类
public class Worker
{
   private int workerid;
   private String workeraccount;
   private String workerpass;
   private String rolename;
   private String worktime;
   private int stateid;
   private String statename;
	private byte[] face;
  private boolean flage;
  private int page;

	public Worker()
	{
	}

	public Worker(int workerid, String workeraccount, String workerpass, String rolename, String worktime, int stateid, String statename, byte[] face, boolean flage, int page)
	{
		this.workerid = workerid;
		this.workeraccount = workeraccount;
		this.workerpass = workerpass;
		this.rolename = rolename;
		this.worktime = worktime;
		this.stateid = stateid;
		this.statename = statename;
		this.face = face;
		this.flage = flage;
		this.page = page;
	}

	public int getWorkerid()
	{
		return workerid;
	}

	public void setWorkerid(int workerid)
	{
		this.workerid = workerid;
	}

	public String getWorkeraccount()
	{
		return workeraccount;
	}

	public void setWorkeraccount(String workeraccount)
	{
		this.workeraccount = workeraccount;
	}

	public String getWorkerpass()
	{
		return workerpass;
	}

	public void setWorkerpass(String workerpass)
	{
		this.workerpass = workerpass;
	}

	public String getRolename()
	{
		return rolename;
	}

	public void setRolename(String rolename)
	{
		this.rolename = rolename;
	}

	public String getWorktime()
	{
		return worktime;
	}

	public void setWorktime(String worktime)
	{
		this.worktime = worktime;
	}

	public int getStateid()
	{
		return stateid;
	}

	public void setStateid(int stateid)
	{
		this.stateid = stateid;
	}

	public String getStatename()
	{
		return statename;
	}

	public void setStatename(String statename)
	{
		this.statename = statename;
	}

	public byte[] getFace()
	{
		return face;
	}

	public void setFace(byte[] face)
	{
		this.face = face;
	}

	public boolean isFlage()
	{
		return flage;
	}

	public void setFlage(boolean flage)
	{
		this.flage = flage;
	}

	public int getPage()
	{
		return page;
	}

	public void setPage(int page)
	{
		this.page = page;
	}
}
