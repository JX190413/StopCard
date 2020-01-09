package com.cykj.stopcard.service;

import com.cykj.stopcard.bean.Worker;
import com.cykj.stopcard.dao.AdminLoginDao;
import com.cykj.stopcard.dao.UserDao;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.concurrent.TimeUnit;

@Service
public class RedisService
{

	@Resource
	private AdminLoginDao adminLoginDao;

	@Autowired
	private RedisTemplate redisTemplate;

	public Worker queryAll(Worker worker) {
		return adminLoginDao.queryAdmin(worker);
	}

	/**
	 * 获取用户策略：先从缓存中获取用户，没有则取数据表中 数据，再将数据写入缓存
	 */
	public Worker queryAdmin(Worker worker) {
		String key = "user:" + worker.getWorkeraccount();

		ValueOperations<String, Object> operations = redisTemplate.opsForValue();

		boolean hasKey = redisTemplate.hasKey(key);
		if (hasKey) {
			Worker worker1 = (Worker)operations.get(key);
			System.out.println("==========从缓存中获得数据=========");
			System.out.println(worker1.getWorkeraccount());
			System.out.println("==============================");
			return worker1;
		} else {
			Worker worker1 = adminLoginDao.queryAdmin(worker);
			System.out.println("==========从数据表中获得数据=========");
//			System.out.println(worker1.getWorkeraccount());
			System.out.println("==============================");

			// 写入缓存
			operations.set(key, worker1);
			return worker1;
		}

	}

	/**
	 * 更新用户策略：先更新数据表，成功之后，删除原来的缓存，再更新缓存
	 */
//	public int updateUser(User user) {
//		ValueOperations<String, User> operations = redisTemplate.opsForValue();
//		int result = userDao.updateUser(user);
//		if (result != 0) {
//			String key = "user:" + user.getUid();
//			boolean haskey = redisTemplate.hasKey(key);
//			if (haskey) {
//				redisTemplate.delete(key);
//				System.out.println("删除缓存中的key=========>" + key);
//			}
//			// 再将更新后的数据加入缓存
//			User userNew = userDao.findUserById(user.getUid());
//			if (userNew != null) {
//				operations.set(key, userNew, 3, TimeUnit.HOURS);
//			}
//		}
//		return result;
//	}
//
//	/**
//	 * 删除用户策略：删除数据表中数据，然后删除缓存
//	 */
//	public int deleteUserById(int id) {
//		int result = userDao.deleteUserById(id);
//		String key = "user:" + id;
//		if (result != 0) {
//			boolean hasKey = redisTemplate.hasKey(key);
//			if (hasKey) {
//				redisTemplate.delete(key);
//				System.out.println("删除了缓存中的key:" + key);
//			}
//		}
//		return result;
//	}

}
