package com.action;
import javax.annotation.Resource;


import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.bean.Admin;
import com.bean.base.PageView;
import com.bean.base.QueryResult;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.service.AdminService;
@Controller @Scope("prototype")
public class AdminAction extends ActionSupport {

	private static final long serialVersionUID = 1L;
	@Resource private AdminService adminServiceimpl;
	private Admin admin;
	private Integer page=1;
	private Integer adminid;
	/**
	 * 登录
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		admin = adminServiceimpl.login(admin.getName(), admin.getPassword());
		if(null!=admin&&admin.getVisible()==true){
			ActionContext.getContext().getSession().put("admin", admin);
			return "success";
		}else{
			addFieldError("error", "用户不存在，请重新登陆");
			return "input";
		}
	}
	/**
	 * 退出登录
	 * @return
	 */
	public String outlogin(){
		ActionContext.getContext().getSession().remove("user");
		return "input";
	}
	/**
	 * 列表显示管理员
	 * @return
	 */
	public String list(){
		PageView<Admin> pageView = new PageView<Admin>(6,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//获取记录的开始索引
		QueryResult<Admin> qr = adminServiceimpl.getScrollData(Admin.class, firstindex, pageView.getMaxresult());
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
		return "success";
	}
	/**
	 * 编辑UI
	 * @return
	 */
	public String editUI(){
		admin = adminServiceimpl.find(Admin.class, adminid);
		return "success";
	}
	/**
	 * 添加UI
	 * @return
	 */
	public String addUI(){
		return "success";
	}
	/**
	 * 编辑管理员
	 * @return
	 */
	public String edit(){	
		admin.setId(adminid);//很关键
		adminServiceimpl.update(admin);
		return "toList";
	}
	/**
	 * 添加管理员
	 * @return
	 */
	public String add(){
		adminServiceimpl.save(admin);
		return "toList";
	}
	/**
	 * 删除管理员
	 * @return
	 */
	public String delete(){
		admin = adminServiceimpl.find(Admin.class, adminid);
		admin.setVisible(false);
		adminServiceimpl.update(admin);
		return "toList";
	}

	public void validateLogin() {
		if("".equals(admin.getName())||null==admin.getName()){
			addFieldError("admin.name", "管理员名不能为空");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "管理员不能超过10个字符");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "管理员密码不能为空");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "管理员密码不能少于2个字符并且超过10个字符");
		}
	}
	public void validateAdd() {
		if("".equals(admin.getName())||null==admin.getName()){
			addFieldError("admin.name", "管理员名不能为空");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "管理员不能超过10个字符");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "管理员密码不能为空");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "管理员密码不能少于2个字符并且超过10个字符");
		}
	}
	public void validateEdit() {
		if("".equals(admin.getName())||null==admin.getName()){
			addFieldError("admin.name", "管理员名不能为空");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "管理员不能超过10个字符");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "管理员密码不能为空");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "管理员密码不能少于2个字符并且超过10个字符");
		}
	}
	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}

	public Integer getAdminid() {
		return adminid;
	}

	public void setAdminid(Integer adminid) {
		this.adminid = adminid;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
}
