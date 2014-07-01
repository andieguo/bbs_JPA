<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TITLE>新浪论坛--回复帖子--${topic.title }</TITLE>
<link href="style/main-73ed1d2a7f7c84030d267e0e08215bf7.css"
	media="screen" rel="stylesheet" type="text/css" />
<link href="style/sh-2bfcf65754f6d04d58df6ed87a3b6faf.css" media="all"
	rel="stylesheet" type="text/css" />
<Link rel="stylesheet" type="text/css" href="style/style.css" />
<script type="text/javascript">
	function check() {
		if (document.postForm.title.value == "") {
			alert("标题不能为空");
			return false;
		}
		if (document.postForm.content.value == "") {
			alert("内容不能为空");
			return false;
		}
		if (document.postForm.content.value.length > 1000) {
			alert("长度不能大于1000");
			return false;
		}
	}
</script>
</head>
<BODY>
	<div class="wraper">
		<DIV>
			<IMG src="image/logo.gif">
		</DIV>
		<!--      用户信息、登录、注册        -->

		<%@ include file="/share/head.jsp"%>


		<!--      主体        -->
		<DIV>
			<BR />
			<!--      导航        -->
			<DIV>
				&gt;&gt;<B><a
					href="<%=request.getContextPath()%>/board_list.action">论坛首页</a></B>&gt;&gt;
				<B><a
					href="<%=request.getContextPath() %>/topic_list.action?board.id=${topic.board.id}">${topic.board.name}</a></B>&gt;&gt;
				<B><font color="red">${topic.title }</font></B>
			</DIV>
			<BR />
			<DIV>
				<s:form action="replyPost" method="post">
					<s:hidden name="topic.id" />
					<DIV class="t">
						<TABLE cellSpacing="0" cellPadding="0" align="center">
							<TR>
								<TD class="h" colSpan="3"><B>发表帖子</B></TD>
							</TR>
							<c:if test="${sessionScope.user!=null}">
								<TR class="tr3">
									<TH vAlign=top>
										<DIV>
											<B>内容</B>
										</DIV>
									</TH>
									<TH colSpan=2>
										<DIV>
											<span> <s:textarea name="reply.content"
													cssStyle="WIDTH: 500px;" cols="90" rows="20" tabindex="2" />
											</span>
										</DIV> (不能大于:<FONT color="blue">1000</FONT>字)<font color="red"><s:fielderror/></font>
									</TH>
								</TR>
						</TABLE>
					</DIV>

					<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
						<INPUT class="btn" tabIndex="3" type="submit" value="提 交">
						<INPUT class="btn" tabIndex="4" type="reset" value="重 置">
					</DIV>
					</c:if>
				</s:form>
				<c:if test="${sessionScope.user==null}">
					<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
						 <a
							href="http://localhost:8080/bbs_JPA/login.jsp"><font color="red" size="2">请您登录后再来发表帖子，登录请戳这里</font></a>
					</DIV>
				</c:if>
			</DIV>
		</DIV>
		<!--      声明        -->
		<%@ include file="/share/foot.jsp"%>
</BODY>
</HTML>