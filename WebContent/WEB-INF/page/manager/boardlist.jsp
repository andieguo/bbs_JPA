<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>������</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/css/vip.css" type="text/css">
<script language="JavaScript">
<!--
	//��ָ���ķ�ҳҳ��
	function topage(page){
		var form = document.forms[0];
		form.page.value=page;
		form.submit();
	}
//-->
</script>
<SCRIPT language=JavaScript src="<%=basePath%>/js/FoshanRen.js"></SCRIPT>
</head>
<html:form action="/control/board/list" method="post">
<html:hidden property="page"/>
<html:hidden property="parentid"/>
<html:hidden property="name"/>
<html:hidden property="query"/>
<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">

  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="7"  bgcolor="6f8ac4" align="right">
    	<%@ include file="/WEB-INF/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="8%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">����</font></div></td>
      <td width="5%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�޸�</font></div></td>
      <td width="20%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�������</font></div></td>
	  <td width="10%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�����¼����</font></div></td>
	  <td width="10%" bgcolor="6f8ac4"><div align="center"><font color="#FFFFFF">��������</font></div></td>
	  <td nowrap bgcolor="6f8ac4" width="10%"> <div align="center"><font color="#FFFFFF">��������</font></div></td>
	  <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">�������</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${pageView.records}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center">${entry.id}</div></td>
      <td bgcolor="f5f5f5"> <div align="center">
	  <a href='<s:url action="editUI" namespace="/control/board"/>?boardid=${entry.id }'><img src="<%=basePath%>/images/edit.gif" width="15" height="16" border="0"></a></div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${fn:length(entry.childboards)>0}"><a href='<s:url action="list" namespace="/control/board"/>?board.id=${entry.id }'>${entry.name }</a></c:if>
	  <c:if test="${fn:length(entry.childboards)==0}"><a href='<s:url action="list" namespace="/control/topic"/>?board.id=${entry.id }'>${entry.name }</a></c:if></div></td>
	  <td bgcolor="f5f5f5"> <div align="center"><a href='<s:url action="addUI" namespace="/control/board"/>?parentid=${entry.id }'>���������</a></div></td>
	  <td bgcolor="f5f5f5"><div align="center"><c:if test="${!empty entry.parent}">${entry.parent.name}</c:if></div></td>
	  <td bgcolor="f5f5f5"><div align="center">${entry.createdate }</div></td>
	  <td bgcolor="f5f5f5"><div align="center"><c:if test="${fn:length(entry.childboards)>0}"><font color="red">${fn:length(entry.childboards)}</c:if></font></div></td>

	</tr>
</c:forEach>
  </table>
</html:form>
</body>
</html>