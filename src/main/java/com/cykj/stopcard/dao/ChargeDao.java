package com.cykj.stopcard.dao;

import com.cykj.stopcard.bean.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface ChargeDao
{
	public List<Product> selfasttime();

}
