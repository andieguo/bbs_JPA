<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>用户显示</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/css/vip.css" type="text/css">
<script language="JavaScript">
<!--
	//到指定的分页页面
	function topage(page){
		var form = document.forms[0];
		form.page.value=page;
		form.submit();
	}
//-->
</script>
<SCRIPT language=JavaScript src="<%=basePath%>/js/FoshanRen.js"></SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<s:form action="list" namespace="/control/user" method="post">
<s:hidden name="page"/>
<s:hidden name="userid"/>
<s:hidden name="query"/>
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="9" bgcolor="6f8ac4" align="right">
    	<%@ include file="/WEB-INF/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
 	  <td width="5%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户ID</font></div></td>
      <td width="6%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">修改</font></div></td>
      <td width="6%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">删除</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户名</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户头像</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户性别</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">注册时间</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户密码</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">用户状态</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${pageView.records}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${entry.id}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url action="editUI" namespace="/control/user"/>?userid=${entry.id}">
	  <img src="<%=basePath%>/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url action="delete" namespace="/control/user"/>?userid=${entry.id}">删除</a></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"> <img src="<%=basePath%>/image/head/${entry.headname}" width="50" height="50" border="0"></div></td>
      <td bgcolor="f5f5f5"> <div align="center"> <c:if test="${entry.gender=='WOMEN'}">女</c:if><c:if test="${entry.gender=='MAN'}">男</c:if></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.regTime}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.pass}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible}"><font color="blue">正常</font></c:if><c:if test="${!entry.visible}"><font color="red">已注销</font></c:if></div></td>
      
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="11" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
         
          </tr>
        </table></td>
    </tr>
  </table>
</s:form>
</body>
</html>