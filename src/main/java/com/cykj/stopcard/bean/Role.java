package com.cykj.stopcard.bean;

public class Role
{

	private int roleid;
	private String rolename;
	private String roledetails;

	public Role()
	{
	}

	public Role(int roleid, String rolename, String roledetails)
	{
		this.roleid = roleid;
		this.rolename = rolename;
		this.roledetails = roledetails;
	}

	public int getRoleid()
	{
		return roleid;
	}

	public void setRoleid(int roleid)
	{
		this.roleid = roleid;
	}

	public String getRolename()
	{
		return rolename;
	}

	public void setRolename(String rolename)
	{
		this.rolename = rolename;
	}

	public String getRoledetails()
	{
		return roledetails;
	}

	public void setRoledetails(String roledetails)
	{
		this.roledetails = roledetails;
	}
}
