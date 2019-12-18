package com.cykj.stopcard.bean;

public class User
{

	private int id;
	private byte[] face;

	public User()
	{
	}

	public User(int id, byte[] face)
	{
		this.id = id;
		this.face = face;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public byte[] getFace()
	{
		return face;
	}

	public void setFace(byte[] face)
	{
		this.face = face;
	}
}
