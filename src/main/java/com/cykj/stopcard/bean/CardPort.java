package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

@Component
public class CardPort
{
	private int id;
	private String name;
	private String area;
	private int status;
	private String x;
	private String y;

	public CardPort()
	{
	}

	public CardPort(String name, String area, int status, String x, String y)
	{
		this.name = name;
		this.area = area;
		this.status = status;
		this.x = x;
		this.y = y;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getArea()
	{
		return area;
	}

	public void setArea(String area)
	{
		this.area = area;
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public String getX()
	{
		return x;
	}

	public void setX(String x)
	{
		this.x = x;
	}

	public String getY()
	{
		return y;
	}

	public void setY(String y)
	{
		this.y = y;
	}
}
