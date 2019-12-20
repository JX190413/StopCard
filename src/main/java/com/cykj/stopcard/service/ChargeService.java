package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.Product;
import com.cykj.stopcard.dao.ChargeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ChargeService
{
	@Resource
	private ChargeDao chargeDao;
	public List<Product> selfasttime(){
		return  chargeDao.selfasttime();
	}

}
