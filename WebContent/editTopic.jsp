<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>������̳ --�༭����--${topic.title }</title>
    <link href="style/main-73ed1d2a7f7c84030d267e0e08215bf7.css" media="screen" rel="stylesheet" type="text/css" />
    <meta content="authenticity_token" name="csrf-param" />
	<meta content="Wbe7DKpEZ9VTUApN4H0bq54XHBYo5qipZEq6gTj2O9E=" name="csrf-token" />
    <link href="style/sh-2bfcf65754f6d04d58df6ed87a3b6faf.css" media="all" rel="stylesheet" type="text/css" />
 	<Link rel="stylesheet" type="text/css" href="style/style.css" />
	<script type="text/javascript">
	<!--
		//��ָ���ķ�ҳҳ��
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
<!--      �û���Ϣ����¼��ע��        -->

<%@ include file="/share/head.jsp" %>


<!--      ����        -->
<DIV><BR/>
	<!--      ����        -->
	<DIV>
		&gt;&gt;<B><a href="<%=request.getContextPath() %>/board_list.action">��̳��ҳ</a></B>&gt;&gt;
		<B><a href="<%=request.getContextPath() %>/topic_list.action?board.id=${topic.board.id}">${topic.board.name}</a></B>&gt;&gt;
		<B><a href="<%=request.getContextPath() %>/reply_list.action?topic.id=${topic.id}">${topic.title }</a></B>
	</DIV><BR/>
	<DIV>
		<s:form action="topicEdit" method="post">
			<s:hidden name="topic.id"/>
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				    <TR>
					    <TD class="h" colSpan="3"><B>�༭����</B></TD>
				    </TR>
	
				    <TR class="tr3">
					    <TH width="20%"><B>����</B></TH>
					    <TH><s:textfield cssClass="input"  cssStyle="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="topic.title"/></TH>
				    </TR>
	
				    <TR class="tr3">
					    <TH vAlign=top>
					      <DIV><B>����</B></DIV>
					    </TH>
					    <TH colSpan=2>
					        <DIV>	
						        <span>
						        <s:textarea name="topic.content" cssStyle="WIDTH: 500px;" cols="90" rows="20" tabindex="2"/>
						        </span>
						    </DIV>
					      (���ܴ���:<FONT color="blue">1000</FONT>��)
					    </TH>
					</TR>
				</TABLE>
			</DIV>		
	
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="�� ��"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="�� ��">
			</DIV>
		</s:form>
	</DIV>
</DIV>
<!--      ����        -->
<%@ include file="/share/foot.jsp" %>
</BODY>
</HTML>
