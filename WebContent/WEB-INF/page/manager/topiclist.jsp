<%@ page contentType="text/html;charset=gbk" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>管理员显示</title>
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
<s:form action="list" namespace="/control/topic" method="post">
<s:hidden name="page"/>
<s:hidden name="adminid"/>
<s:hidden name="query" value="true"/>
<s:hidden name="board.id"/>
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="7" bgcolor="6f8ac4" align="right">
    	<%@ include file="/WEB-INF/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="6%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">主题id</font></div></td>
      <td width="6%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">修改</font></div></td>
      <td width="6%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">删除</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">主题标题</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">主题作者</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">主题状态</font></div></td>
      <td width="5%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">回复个数</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${pageView.records}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${entry.id}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url action="editUI" namespace="/control/topic"/>?topicid=${entry.id}">
	  <img src="<%=basePath%>/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url action="delete" namespace="/control/topic"/>?topicid=${entry.id}">删除</a></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.title}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.user.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible}"><font color="blue">正常</font></c:if><c:if test="${!entry.visible}"><font color="red">已删除</font></c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center">${fn:length(entry.replys) }</div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
    <tr> 
      <td bgcolor="f5f5f5" colspan="11" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="5%"></td>
              <td width="85%">
            <s:submit value="查询" class="frm_btn" />&nbsp;&nbsp;
            <s:textfield name="topic.title" size="50" maxlength="40"/>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</s:form>
</body>
</html>