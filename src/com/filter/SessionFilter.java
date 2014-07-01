package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SessionFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request; 
		HttpServletResponse res = (HttpServletResponse) response;
		System.out.println(req.getServletPath());
	
		if(req.getServletPath().equals("/index.jsp")||req.getServletPath().equals("/index.html")){//������ҳʱ��ֱ�ӷ���board_list.action
			System.out.println("���뵽������");
			RequestDispatcher rd = req.getRequestDispatcher("board_list.action");
	        rd.forward(req, res); 
		}else if(req.getServletPath().equals("/topiclist.jsp")||req.getServletPath().equals("/topiclist.html")){ 
			System.out.println("/topiclist.jsp���뵽������");
			System.out.println();
			RequestDispatcher rd = req.getRequestDispatcher("topic_list.action?"+req.getQueryString());
	        rd.forward(req, res); 
        }else if(req.getServletPath().equals("/boardlist.jsp")||req.getServletPath().equals("/boardlist.html")){   	
			RequestDispatcher rd = req.getRequestDispatcher("board_list.action");
	        rd.forward(req, res);         	
        }else if(req.getServletPath().equals("/replylist.jsp")||req.getServletPath().equals("/replylist.html")){
        	System.out.println("���뵽������");
			System.out.println(req.getQueryString());
			RequestDispatcher rd = req.getRequestDispatcher("reply_list.action?"+req.getQueryString());
	        rd.forward(req, res);         	
        }else if(req.getServletPath().equals("/control/center/main.action")){
        	System.out.println("��������̨");
        }else{
            chain.doFilter(request, response); 
        }
	}
	@Override
	public void destroy() {
		
	}

}
