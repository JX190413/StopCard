package com.cykj.stopcard.controller;

import com.cykj.stopcard.bean.AdminMenu;
import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.service.AdminLoginService;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

//后台端控制层
@Controller
public class LoginController
{
	@Resource
	private AdminLoginService adminLoginService;

	@RequestMapping("/Login")
	public ModelAndView AdminLogin(Worker worker, HttpSession httpSession)
	{
		ModelAndView mv = new ModelAndView();
		Worker worker1 = adminLoginService.queryAdmin(worker);
		if (worker1 != null)
		{

			if("启用".equals(worker1.getStatename())){

				//调用查询菜单方法
				LinkedHashMap<String, ArrayList<AdminMenu>> map=queryMenu(worker1);

				httpSession.setAttribute("workeraccount",worker1.getWorkeraccount());
				mv.addObject("worker1",worker1);
				mv.addObject("map",map);
				mv.addObject("flage","1");
				mv.setViewName("Admin");
				return mv;


			}else {

				mv.addObject("flage","3");

			}

		   }else  if(worker1 == null){
			mv.addObject("flage","2");
		  }
		    mv.setViewName("AdminLogin");
              return mv;
	}










//菜单的方法
	public LinkedHashMap<String, ArrayList<AdminMenu>> queryMenu(Worker worker)
	{
		LinkedHashMap<String, ArrayList<AdminMenu>> map = new LinkedHashMap<>();

		ArrayList<AdminMenu> menu = adminLoginService.queryMenu(worker);
		for (int i = 0; i < menu.size(); i++)
		{
			String first = menu.get(i).getFathername();
			if (map.containsKey(first))
			{
				ArrayList<AdminMenu> arrayList = map.get(first);
				arrayList.add(menu.get(i));

			} else
			{

				ArrayList<AdminMenu> arrayList = new ArrayList<>();

				arrayList.add(menu.get(i));
				map.put(first, arrayList);
			}
		}


		return map;
	}






  }


