package com.cykj.stopcard.bean;

public class Partation
{
	////
	private  int partitionid;
	private  String partitionname;
	private  String image;
	private String jumpurl;
	public Partation(int partitionid, String partitionname, String image,String jumpurl)
	{
		this.partitionid = partitionid;
		this.partitionname = partitionname;
		this.image = image;
		this.jumpurl=jumpurl;
	}

	public Partation()
	{
	}

	public String getJumpurl()
	{
		return jumpurl;
	}

	public void setJumpurl(String jumpurl)
	{
		this.jumpurl = jumpurl;
	}

	public int getPartitionid()
	{
		return partitionid;
	}

	public void setPartitionid(int partitionid)
	{
		this.partitionid = partitionid;
	}

	public String getPartitionname()
	{
		return partitionname;
	}

	public void setPartitionname(String partitionname)
	{
		this.partitionname = partitionname;
	}

	public String getImage()
	{
		return image;
	}

	public void setImage(String image)
	{
		this.image = image;
	}
}
