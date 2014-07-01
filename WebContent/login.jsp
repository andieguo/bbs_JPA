<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <TITLE>新浪论坛--用户登录</TITLE>
    <link href="style/main-73ed1d2a7f7c84030d267e0e08215bf7.css" media="screen" rel="stylesheet" type="text/css" />
    <link href="style/sh-2bfcf65754f6d04d58df6ed87a3b6faf.css" media="all" rel="stylesheet" type="text/css" />
 	<Link rel="stylesheet" type="text/css" href="style/style.css" />
	<script type="text/javascript">
	<!--
		//到指定的分页页面
		function topage(page){
			var form = document.forms[0];
			form.page.value=page;
			form.submit();
		}
	//-->
	</script>
  </head>
<BODY>
<div class="wraper">
<DIV>
	<IMG src="image/logo.gif">
</DIV>
<!--      用户信息、登录、注册        -->

<%@ include file="/share/head.jsp" %>

<BR/>
<!--      导航        -->
<DIV>
	&gt;&gt;<a href="<%=request.getContextPath() %>/board_list.action">论坛首页</a></B></B>
</DIV>
<!--      用户登录表单        -->
<DIV class="t" style="MARGIN-TOP: 15px" align="center">
	<s:form action="user_login" method="post">
	<table align="center">
		<tr><td align="right">用户名：</td><td align="left"><s:textfield cssStyle="input" name="user.name" size="25"></s:textfield></td></tr>
		<tr><td align="right">密 码：</td><td align="left"><s:password cssStyle="input" name="user.pass" size="25"></s:password></td></tr>
		<tr><td></td><td align="left"><s:submit value="登陆" cssClass="btn"/></td></tr>
		<tr><td align="left"><font color="red"><s:fielderror/></font></td><td></td></tr>
	</table>
	</s:form>
</DIV>
<!--      声明        -->
<%@ include file="/share/foot.jsp" %>
</BODY>
</HTML>
