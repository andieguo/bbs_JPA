package com.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Admin;
import com.service.AdminService;

public class AdminTest {
	static private ApplicationContext atx ;
	static private AdminService adminService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		atx = new ClassPathXmlApplicationContext("applicationContext.xml");
		adminService = (AdminService) atx.getBean("adminServiceImpl");
	}

	@Test
	public void test() {
		System.out.println(adminService.login("admin", "admin").toString());
	}
	
	@Test
	public void add() {
		adminService.save(new Admin("sa","sa"));
	}
	
	@Test
	public void delete() {
		adminService.delete(Admin.class, 3);
	}


}
