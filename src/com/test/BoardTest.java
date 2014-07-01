package com.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.bean.Admin;
import com.bean.Board;
import com.bean.User;
import com.bean.base.QueryResult;
import com.service.BoardService;

public class BoardTest {
	static private BoardService bd;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
			ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
			bd = (BoardService) ctx.getBean("boardServiceImpl");
	}
	
	@Test
	public void save() {
		Board board = new Board();
		
		//board.setParent(bd.find(Board.class, 1));//创建子版块
		board.setName("电影世界");
		board.setInfo("电影世界");
		board.setVisible(true);
		board.setAdmin(new Admin(1));
		bd.save(board);
	}

	@Test
	public void list() {
		try {
			QueryResult<Board> qr = bd.getScrollData(Board.class);
			List<Board> boards = qr.getResultlist();
			for(Board board:boards){
				for(Board childboard:board.getChildboards()){
					System.out.println(childboard.getName());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
