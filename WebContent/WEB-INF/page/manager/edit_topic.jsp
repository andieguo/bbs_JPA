<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>�޸Ļ���״̬</title>
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
<s:form action="edit" namespace="/control/topic" method="post"  onsubmit="return checkfm(this)">
<s:hidden name="topicid"/>
<br>
  <table width="90%" border="0" cellspacing="2" cellpadding="3" align="center">
    <tr bgcolor="6f8ac4"><td colspan="2"  > <font color="#FFFFFF">�޸Ļ���״̬��</font></td>
    </tr>
 	 <tr bgcolor="f5f5f5"> 
      <td width="22%" > <div align="right">����״̬��</div></td>
      <td width="78%"> <s:radio list="#{'true':'����','false':'��ɾ��' }" listKey="key" listValue="value" name="topic.visible"/>
        <font color="#FF0000">*</font></td>
    </tr>
    <tr bgcolor="f5f5f5"> 
      <td colspan="2"> <div align="center"> 
          <input type="submit" name="SYS_SET" value="ȷ �� " class="frm_btn">
        </div></td>
    </tr>
  </table>
</s:form>
<br>
</body>
</html>