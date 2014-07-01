<%@ page language="java" contentType="text/html; charset=gbk"%>
<DIV class="h">
	<%if(session.getAttribute("user")!=null){ %>
	<font color="red">${sessionScope.user.name}</font>,»¶Ó­ÄúµÇÂ½
	<%}else{ %>
	ÄúÉĞÎ´¡¡<a href="login.jsp">µÇÂ¼</a>
	<%} %>
	&nbsp;| &nbsp; <A href="reg.jsp">×¢²á</A> |&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/user_outLogin.action">ÍË³ö</a>
</DIV>