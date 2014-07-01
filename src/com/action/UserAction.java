package com.action;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bean.Admin;
import com.bean.User;
import com.bean.base.PageView;
import com.bean.base.QueryResult;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.UserService;

@SuppressWarnings("serial")
@Controller @Scope("prototype")
public class UserAction extends ActionSupport {
	@Resource private UserService userServiceImpl;

	private User user;
	private Integer userid;
	private Integer page = 1;
	private String password;
	
	
	public String login() throws Exception {
		user = userServiceImpl.login(user.getName(), user.getPass());
		if(null!=user&&user.getVisible()==true){
			ActionContext.getContext().getSession().put("user", user);
			return "toListBoards";
		}else{
			addFieldError("error", "用户不存在，请重新登陆");
			return "input";
		}
	}
	
	public String outLogin(){
		ActionContext.getContext().getSession().remove("user");
		return "toListBoards";
		
	}

	public String reg() throws Exception {
		userServiceImpl.save(user);
		return "login";
	}

	public String list(){
		PageView<User> pageView = new PageView<User>(6,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//获取记录的开始索引
		QueryResult<User> qr = userServiceImpl.getScrollData(User.class, firstindex, pageView.getMaxresult());
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
		return "success";
	}
	
	public String editUI(){
		user = userServiceImpl.find(User.class, userid);
		return "success";
	}
	public String addUI(){
		return "success";
	}
	public String edit(){
		//后台管理员更新用户状态
		User us = userServiceImpl.find(User.class, userid);
		us.setVisible(user.getVisible());//只更新用户状态
		userServiceImpl.update(us);
		return "toList";
	}
	
	public String delete(){//使得用户不可见
		user = userServiceImpl.find(User.class, userid);
		user.setVisible(false);
		userServiceImpl.update(user);
		return "toList";
	}

	
	public void validateLogin() {
		if("".equals(user.getName())||null==user.getName()){
			addFieldError("user.name", "用户名不能为空");
		}else if(user.getName().length()>10){
			addFieldError("user.name", "用户名不能超过10个字符");
		}
		if("".equals(user.getPass())||null==user.getPass()){
			addFieldError("user.pass", "密码不能为空");
		}else if(user.getPass().length()<2||user.getPass().length()>10){
			addFieldError("user.pass", "密码不能少于2个字符并且超过10个字符");
		}
	}
	
	public void validateReg() {
		
		if(user.getPass()!=password){
			addFieldError("password", "两次输入的密码不一样");
		}
		if("".equals(user.getName())||null==user.getName()){
			addFieldError("user.name", "用户名不能为空");
		}else if(user.getName().length()>10){
			addFieldError("user.name", "用户名不能超过10个字符");
		}
		if("".equals(user.getPass())||null==user.getPass()){
			addFieldError("user.pass", "密码不能为空");
		}else if(user.getPass().length()<2||user.getPass().length()>10){
			addFieldError("user.pass", "密码不能少于2个字符并且超过10个字符");
		}
		if("MAN".equals(user.getGender().toString())){
			
		}
	}
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


}
