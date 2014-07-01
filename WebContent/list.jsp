<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新浪论坛 --主题列表--${board.name }</title>
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
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="<%=request.getContextPath() %>/board_list.action">论坛首页</a></B>&gt;&gt;
	<B>${board.name}</B>
</DIV>
	<!--      新帖        -->
	<DIV>
		<A href="<%=request.getContextPath() %>/topic_postUI?board.id=${board.id }"><IMG src="image/post.gif"  border="0" id=td_post></A>	</DIV>
	<!--         翻 页         -->
	<DIV>
	<%@ include file="/share/fenye.jsp" %>
	</DIV>

	<DIV class="t">
	<s:form action="topic_list" method="get">
		<s:hidden name="page"/>
		<s:hidden name="board.id"/>
		<TABLE cellSpacing="0" cellPadding="0" width="100%">		
			<TR>
				<TH class="h" style="WIDTH: 100%" colSpan="4"><SPAN>&nbsp;</SPAN></TH>
			</TR>
		<!--       表 头           -->
			<TR class="tr2">		
				<TD style="WIDTH: 20%" align="center">主题标题</TD>
				<TD style="WIDTH: 10%" align="center">主题作者</TD>
				<TD style="WIDTH: 10%" align="center">回复个数</TD>
			</TR>
		<!--         主 题 列 表        -->
		<c:forEach items="${pageView.records}" var="entry">
			<TR class="tr3">
			
				<TD style="FONT-SIZE: 15px">
				<IMG src="image/topic.gif" border=0>
				<a href="<%=request.getContextPath()%>/reply_list.action?topic.id=${ entry.id}">${ entry.title}</a>
				</TD>
				<TD >${ entry.user.name}</TD>
				<TD>${fn:length(entry.replys) }</TD>
			</TR>
		</c:forEach>
			
		</TABLE>
		</s:form>
	</DIV>
		<!--         翻 页         -->
	<div>
		<%@ include file="/share/fenye.jsp" %>
	</div>
</DIV>
<!--            发表话题         -->
<DIV>
 <div class="wraper">
		<s:form action="topicPost" method="post">
			<s:hidden name="board.id"/>
			<DIV class="t">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				    <TR>
					    <TD class="h" colSpan="3"><B>发表话题</B></TD>
				    </TR>
	   			 <c:if test="${sessionScope.user!=null}"> 
				    <TR class="tr3">
					    <TH width="20%"><B>标题</B></TH>
					    <TH><s:textfield cssClass="input"  cssStyle="PADDING-LEFT: 2px; FONT: 14px Tahoma" tabIndex="1" size="60" name="topic.title"/></TH>
				    </TR>
	
				    <TR class="tr3">
					    <TH vAlign=top>
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan=2>
					        <DIV>	
						        <span>
						        <s:textarea name="topic.content" cssStyle="WIDTH: 500px;" cols="90" rows="20" tabindex="2"/>
						        </span>
						    </DIV>
					      (不能大于:<FONT color="blue">1000</FONT>字)
					    </TH>
					</TR>
				</TABLE>
			</DIV>		
	
			<DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<INPUT class="btn" tabIndex="3" type="submit" value="提 交"> 
				<INPUT class="btn" tabIndex="4" type="reset"  value="重 置">
			</DIV>
			
			  </c:if>
			</s:form>
                    <c:if test="${sessionScope.user==null}">
                        <DIV style="MARGIN: 15px 0px; TEXT-ALIGN: center">                
                                <a href="http://localhost:8080/bbs_JPA/login.jsp"><font color="red" size="2">请您登录后再来发表话题，登录请戳这里</font></a>
                        </DIV>
                    </c:if> 
	</DIV>
<!--             声 明          -->
<%@ include file="/share/foot.jsp" %>

</BODY>
</HTML>
