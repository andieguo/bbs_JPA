<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>������ϸ��Ϣ</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=basePath%>/css/vip.css" type="text/css">
<SCRIPT language=JavaScript src="<%=basePath%>/js/FoshanRen.js"></SCRIPT>
<script language="JavaScript">
function checkfm(form){
	if (trim(form.name.value)==""){
		alert("������Ʋ���Ϊ�գ�");
		form.name.focus();
		return false;
	}	
	return true;
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">���ӵ���ϸ��Ϣ��</font></td>
    </tr>
     <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�����������⣺</div></td>
      <td width="78%"> <s:textfield name="reply.topic.title" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">���ӱ��⣺</div></td>
      <td width="78%"> <s:textfield name="reply.title" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�����ˣ�</div></td>
      <td width="78%"> <s:textfield name="reply.user.name" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right"></div></td>
      <td width="78%"> <img src="<%=basePath%>/image/head/${reply.user.headname }"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">����ʱ�䣺</div></td>
      <td width="78%"> <s:textfield name="reply.publishTime" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">�����޸�ʱ�䣺</div></td>
      <td width="78%"> <s:textfield name="reply.modifyTime" size="50" maxlength="50"/>
        <font color="#FF0000">*</font></td>
    </tr>
 
    <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">��������</div></td>
      <td width="78%"> <s:textarea rows="10" name="reply.content" cols="50" />
        <font color="#FF0000">*</font></td>
    </tr>
  </table>
<br>
</body>
</html>