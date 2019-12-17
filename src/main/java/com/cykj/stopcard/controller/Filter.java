package com.cykj.stopcard.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

//过滤控制层
@Controller
public class Filter
{

	//jsp路径过滤
	@RequestMapping(value = "/jsp/Admin/{url}")
	public String test1(@PathVariable(value = "url") String path)
	{
		System.out.println(path);

		return path;

	}

	@RequestMapping("/AdminLogin")
	public String AdminLogin(){
		return "AdminLogin";
	}






}
