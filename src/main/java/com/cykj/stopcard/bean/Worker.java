package com.cykj.stopcard.bean;
//后台管理员实体类
public class Worker
{
   private int workerid;
   private String workeraccount;
   private String workerpass;
   private int stateid;
   private String statename;
	private byte[] face;
  private boolean flage;

	public Worker()
	{
	}

	public Worker(int workerid, String workeraccount, String workerpass, int stateid, String statename, byte[] face, boolean flage)
	{
		this.workerid = workerid;
		this.workeraccount = workeraccount;
		this.workerpass = workerpass;
		this.stateid = stateid;
		this.statename = statename;
		this.face = face;
		this.flage = flage;
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
}
