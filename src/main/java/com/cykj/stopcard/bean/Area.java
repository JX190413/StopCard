package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

//分区标注和模型所属分区实体类
@Component
public class Area
{
	private String portarea;
	private String belong;

	public Area(String portarea, String belong)
	{
		this.portarea = portarea;
		this.belong = belong;
	}

	public Area()
	{
	}

	public String getPortarea()
	{
		return portarea;
	}

	public void setPortarea(String portarea)
	{
		this.portarea = portarea;
	}

	public String getBelong()
	{
		return belong;
	}

	public void setBelong(String belong)
	{
		this.belong = belong;
	}
}
