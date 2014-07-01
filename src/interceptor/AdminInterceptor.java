package interceptor;

import com.bean.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class AdminInterceptor extends AbstractInterceptor{
	/**
	 * ��ֱֹ�ӷ��ʰ���б��CRUD����
	 */
	@Override
	public String intercept(ActionInvocation invocation)throws Exception{		
		ActionContext context=invocation.getInvocationContext();
		Admin admin = (Admin) context.getSession().get("admin");
		System.out.println(admin+"�������������admin����");		
		if(admin == null)return "adminlogin";		
		return invocation.invoke();
	}
}
