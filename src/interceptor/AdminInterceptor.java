package interceptor;

import com.bean.Admin;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class AdminInterceptor extends AbstractInterceptor{
	/**
	 * 防止直接访问版块列表的CRUD操作
	 */
	@Override
	public String intercept(ActionInvocation invocation)throws Exception{		
		ActionContext context=invocation.getInvocationContext();
		Admin admin = (Admin) context.getSession().get("admin");
		System.out.println(admin+"我是拦截器里的admin对象");		
		if(admin == null)return "adminlogin";		
		return invocation.invoke();
	}
}
