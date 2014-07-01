package com.test;

import static org.junit.Assert.*;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Board;
import com.bean.Topic;
import com.bean.User;
import com.service.TopicService;

public class TopicTest {
	static private ApplicationContext atc;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		 atc = 	new ClassPathXmlApplicationContext("applicationContext.xml");
		
	}

	@Test
	public void save() {
		TopicService topicService = (TopicService) atc.getBean("topicServiceImpl");
		topicService.save(new Topic("J2EE开发技术","JavaWeb开发技术",new Board(1),new User(1)));
	}

}
