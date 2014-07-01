<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新浪论坛 - 首页</title>
    <link href="style/main-73ed1d2a7f7c84030d267e0e08215bf7.css" media="screen" rel="stylesheet" type="text/css" />
    <meta content="authenticity_token" name="csrf-param" />
	<meta content="Wbe7DKpEZ9VTUApN4H0bq54XHBYo5qipZEq6gTj2O9E=" name="csrf-token" />
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

<!--      主体        -->
<div>
<%@ include file="/share/fenye.jsp" %>
</div>

<DIV class="t">

<s:form action="" method="get">

	<html:hidden property="page"/>
	<html:hidden property="parent.id"/>
	<html:hidden property="query"/>

	<TABLE cellSpacing="0" cellPadding="0" width="100%">
		<TR class="tr2" align="center">
			<TD colSpan="2" style="WIDTH: 30%">版块</TD>
			<TD style="WIDTH: 40%">主题</TD>
			<TD style="WIDTH: 20%">最后发表</TD>
		</TR>
	<!--       主版块       -->
		<s:iterator value="#request.pageView.records" var="entry">
		<TR class="tr3">
			<TD colspan="4"><h3><font color="" ><s:property value="name"/></font></h3></TD>
		</TR>
		<!--       子版块       -->
		<s:iterator value="childboards" >
		<TR class="tr3">
			<TD width="8%">&nbsp;</TD>
			<TH align="left" width="20">
				<IMG src="image/board.gif">
				<a href="<%=request.getContextPath()%>/topic_list.action?board.id=<s:property value="id"/>"><s:property value="name"/></a>
			</TH>
			<TD align="left" width="40"><s:property value="info"/></TD>
			<TH >
				<SPAN>
					<A href="detail.jsp"><s:property value="user.name"/> </A>
				</SPAN>
				<BR/>
				
				<SPAN class="gray">	<s:property value="createdate"/></SPAN>
			</TH>
		</TR>	
			</s:iterator>
		</s:iterator>
	</TABLE>
	</s:form>
</DIV>
<!--     尾部 声明        -->
<%@ include file="/share/foot.jsp" %>
</BODY>
</HTML>