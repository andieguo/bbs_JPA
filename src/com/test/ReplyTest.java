package com.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;


import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Reply;
import com.bean.Topic;
import com.bean.User;
import com.bean.base.QueryResult;
import com.service.ReplyService;
import com.service.TopicService;
import com.service.UserService;

public class ReplyTest {
	static private ReplyService replyService;
	static private UserService userService;
	static private TopicService topicService;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		ApplicationContext atx = new ClassPathXmlApplicationContext("applicationContext.xml");
		replyService = (ReplyService) atx.getBean("replyServiceImpl");
		userService = (UserService) atx.getBean("userServiceImpl");
		topicService = (TopicService) atx.getBean("topicServiceImpl");
		
	}

	@Test
	public void save() {
		
		try {
			replyService.save(new Reply("是这样构建的","先写表头",userService.find(User.class, 1),topicService.find(Topic.class, 1)));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 获取所有的回复，为什么要级联到版块了，因为版块如果删除了的话，相应的话题、回复也要全部删除,即添加了o.visible条件
	 */
	@Test
	public void listAllReply() {
		
        StringBuffer jpql = new StringBuffer("o.visible=?1");
        List<Object> params = new ArrayList<Object>();
        params.add(true);
        jpql.append(" and o.topic.id in ( select p.id from Topic p where p.visible = true and p.board.id in ( select b.id from Board b where b.visible = true )))");
        QueryResult<Reply> result = replyService.getScrollData(Reply.class, jpql.toString(),params.toArray());
        
        for(Reply rep:result.getResultlist()){ 	
        	System.out.println(rep.toString());
        }
	}
	/**
	 * 批量删除
	 */
	@Test
	public void setVisibleStatu(){
		replyService.setVisibleStatu(new Integer []{2,3}, false);
	}
}
