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
	 * ��¼
	 * @return
	 * @throws Exception
	 */
	public String login() throws Exception {
		admin = adminServiceimpl.login(admin.getName(), admin.getPassword());
		if(null!=admin&&admin.getVisible()==true){
			ActionContext.getContext().getSession().put("admin", admin);
			return "success";
		}else{
			addFieldError("error", "�û������ڣ������µ�½");
			return "input";
		}
	}
	/**
	 * �˳���¼
	 * @return
	 */
	public String outlogin(){
		ActionContext.getContext().getSession().remove("user");
		return "input";
	}
	/**
	 * �б���ʾ����Ա
	 * @return
	 */
	public String list(){
		PageView<Admin> pageView = new PageView<Admin>(6,page);
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();//��ȡ��¼�Ŀ�ʼ����
		QueryResult<Admin> qr = adminServiceimpl.getScrollData(Admin.class, firstindex, pageView.getMaxresult());
		pageView.setQueryResult(qr);
		ActionContext.getContext().put("pageView", pageView);
		return "success";
	}
	/**
	 * �༭UI
	 * @return
	 */
	public String editUI(){
		admin = adminServiceimpl.find(Admin.class, adminid);
		return "success";
	}
	/**
	 * ���UI
	 * @return
	 */
	public String addUI(){
		return "success";
	}
	/**
	 * �༭����Ա
	 * @return
	 */
	public String edit(){	
		admin.setId(adminid);//�ܹؼ�
		adminServiceimpl.update(admin);
		return "toList";
	}
	/**
	 * ��ӹ���Ա
	 * @return
	 */
	public String add(){
		adminServiceimpl.save(admin);
		return "toList";
	}
	/**
	 * ɾ������Ա
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
			addFieldError("admin.name", "����Ա������Ϊ��");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "����Ա���ܳ���10���ַ�");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "����Ա���벻��Ϊ��");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "����Ա���벻������2���ַ����ҳ���10���ַ�");
		}
	}
	public void validateAdd() {
		if("".equals(admin.getName())||null==admin.getName()){
			addFieldError("admin.name", "����Ա������Ϊ��");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "����Ա���ܳ���10���ַ�");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "����Ա���벻��Ϊ��");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "����Ա���벻������2���ַ����ҳ���10���ַ�");
		}
	}
	public void validateEdit() {
		if("".equals(admin.getName())||null==admin.getName()){
			addFieldError("admin.name", "����Ա������Ϊ��");
		}else if(admin.getName().length()>20){
			addFieldError("admin.name", "����Ա���ܳ���10���ַ�");
		}
		if("".equals(admin.getPassword())||null==admin.getPassword()){
			addFieldError("admin.pass", "����Ա���벻��Ϊ��");
		}else if(admin.getPassword().length()<2||admin.getPassword().length()>20){
			addFieldError("admin.pass", "����Ա���벻������2���ַ����ҳ���10���ַ�");
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
