<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TITLE>������̳--�û�ע��</TITLE>
<link href="style/main-73ed1d2a7f7c84030d267e0e08215bf7.css"
	media="screen" rel="stylesheet" type="text/css" />
<meta content="authenticity_token" name="csrf-param" />
<meta content="Wbe7DKpEZ9VTUApN4H0bq54XHBYo5qipZEq6gTj2O9E="
	name="csrf-token" />
<link href="style/sh-2bfcf65754f6d04d58df6ed87a3b6faf.css" media="all"
	rel="stylesheet" type="text/css" />
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
<!--
	//��ָ���ķ�ҳҳ��
	function topage(page) {
		var form = document.forms[0];
		form.page.value = page;
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
		<!--      �û���Ϣ����¼��ע��        -->

		<%@ include file="/share/head.jsp"%>

		<BR />
		<!--      ����        -->
		<DIV>
			&gt;&gt;<B><a href="index.jsp">��̳��ҳ</a></B>
		</DIV>
		<!--      �û�ע���        -->
		<DIV class="t" style="MARGIN-TOP: 15px" align="center">
			<s:form action="user_reg" method="post">
				<table>
					<tr>
						<td align="right">�û���:</td>
						<td align="left"><s:textfield name="user.name"></s:textfield></td>
					</tr>
					<tr>
						<td align="right">���룺</td>
						<td align="left"><s:password name="user.pass"></s:password></td>
					</tr>
					<tr>
						<td align="right">�ظ����룺</td>
						<td align="left"><s:password name="password"></s:password></td>
					</tr>
					<tr>
						<td align="right">�Ա�</td>
						<td align="left"><s:radio list="#{'MAN':'��','WOMEN':'Ů' }" listKey="key" listValue="value" name="user.gender"/></td>
					</tr>
					<tr>
						<td align="right">��ѡ��ͷ��</td>
						<td align="left">
		<img src="image/head/1.gif"/><input type="radio" name="user.headname" value="1.gif" checked="checked">
		<img src="image/head/2.gif"/><input type="radio" name="user.headname" value="2.gif">
		<img src="image/head/3.gif"/><input type="radio" name="user.headname" value="3.gif">
		<img src="image/head/4.gif"/><input type="radio" name="user.headname" value="4.gif">
		<img src="image/head/5.gif"/><input type="radio" name="user.headname" value="5.gif">
		<BR/>
		<img src="image/head/6.gif"/><input type="radio" name="user.headname" value="6.gif">
		<img src="image/head/7.gif"/><input type="radio" name="user.headname" value="7.gif">
		<img src="image/head/8.gif"/><input type="radio" name="user.headname" value="8.gif">
		<img src="image/head/9.gif"/><input type="radio" name="user.headname" value="9.gif">
		<img src="image/head/10.gif"/><input type="radio" name="user.headname" value="10.gif">
		<BR/>
		<img src="image/head/11.gif"/><input type="radio" name="user.headname" value="11.gif">
		<img src="image/head/12.gif"/><input type="radio" name="user.headname" value="12.gif">
		<img src="image/head/13.gif"/><input type="radio" name="user.headname" value="13.gif">
		<img src="image/head/14.gif"/><input type="radio" name="user.headname" value="14.gif">
		<img src="image/head/15.gif"/><input type="radio" name="user.headname" value="15.gif">						
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="left"><INPUT class="btn" tabIndex="4" type="submit" value="ע ��"></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td align="left"><font color="red"><s:fielderror /></font></td>
					</tr>
				</table>
	</s:form>
</DIV>
<!--      ����        -->
<%@ include file="/share/foot.jsp" %>
</BODY>
</HTML>
