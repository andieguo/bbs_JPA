package com.test;

import static org.junit.Assert.*;


import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Sex;
import com.bean.User;
import com.service.UserService;

public class UserTest {
	static private ApplicationContext atx ;
	static private UserService userService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		atx = new ClassPathXmlApplicationContext("applicationContext.xml");
		userService = (UserService) atx.getBean("userServiceImpl");
	}

	@Test
	public void test() {
		User user = new User("andy","andy","¹ù¶°");
		user.setGender(Sex.WOMEN);
		userService.save(user);
		
	}
	@Test
	public void test1() {
		
		System.out.println(userService.login("asd", "andy"));
	}
}
