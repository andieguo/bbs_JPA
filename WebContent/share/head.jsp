<%@ page language="java" contentType="text/html; charset=gbk"%>
<DIV class="h">
	<%if(session.getAttribute("user")!=null){ %>
	<font color="red">${sessionScope.user.name}</font>,��ӭ����½
	<%}else{ %>
	����δ��<a href="login.jsp">��¼</a>
	<%} %>
	&nbsp;| &nbsp; <A href="reg.jsp">ע��</A> |&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/user_outLogin.action">�˳�</a>
</DIV>