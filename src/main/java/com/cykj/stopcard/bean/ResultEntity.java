package com.cykj.stopcard.bean;

import org.springframework.stereotype.Component;

//结果实体类
@Component
public class ResultEntity
{
	private int status;
	private String msg;

	public ResultEntity(int status, String msg)
	{
		this.status = status;
		this.msg = msg;
	}

	public ResultEntity()
	{
	}

	public int getStatus()
	{
		return status;
	}

	public void setStatus(int status)
	{
		this.status = status;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}
}
