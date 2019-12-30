package com.cykj.stopcard.bean;

public class UpdateRole
{
	private int rolerid;
	private int workerid;

	public UpdateRole()
	{
	}

	public UpdateRole(int rolerid, int workerid)
	{
		this.rolerid = rolerid;
		this.workerid = workerid;
	}

	public int getRolerid()
	{
		return rolerid;
	}

	public void setRolerid(int rolerid)
	{
		this.rolerid = rolerid;
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
