package interceptor;

import com.bean.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@SuppressWarnings("serial")
public class PrivilegeInterceptor extends AbstractInterceptor{
	
	@Override
	public String intercept(ActionInvocation invocation)throws Exception{	
		ActionContext context=invocation.getInvocationContext();
		User user=(User)context.getSession().get("user");
		System.out.println(user+"我是拦截器里的user对象");
		if(user==null)return "login";	
		return invocation.invoke();
	}
}
