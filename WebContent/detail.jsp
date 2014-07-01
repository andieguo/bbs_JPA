<%@ page language="java" contentType="text/html; charset=gbk"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新浪论坛 --帖子列表--${topic.title }</title>
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
<body>
 <div class="wraper">
<DIV>
	<IMG src="image/logo.gif">
</DIV>
<!--      用户信息、登录、注册        -->
<%@ include file="/share/head.jsp" %>
<!--      导航        -->
<DIV>
	&gt;&gt;<B><a href="<%=request.getContextPath() %>/board_list.action">论坛首页</a></B>&gt;&gt;
	<B><a href="<%=request.getContextPath() %>/topic_list.action?board.id=${topic.board.id}">${topic.board.name}</a></B>&gt;&gt;
	<B><font color="red">${topic.title }</font></B>
</DIV>
<div class="wraper">
</div>
   <div>
					<A href="<%=request.getContextPath() %>/reply_postUI?topic.id=${topic.id }"><IMG src="image/reply.gif"  border="0" id=td_post></A> 
					<A href="<%=request.getContextPath() %>/topic_postUI?board.id=${topic.board.id }"><IMG src="image/post.gif"  border="0" id=td_post></A>					
					</div>
	<!--         翻 页         -->
	<DIV>
	<%@ include file="/share/fenye.jsp" %>
	</DIV>
<div class="h">
 
  <h3>
  当前帖子：${topic.title}
  </h3>
</div>
<div class="detailed">
    <table border="0" cellspacing="0" cellpadding="0" id="post-90376963" class="post topic " data-post-id="90376963" data-is-topic-locked="false">
  <colgroup><col width="180" /><col /></colgroup>
  <tr>
      <td rowspan="2" valign="top" class="wirter">
                <dl class="user_info ">
          <dt class="user_head" data-username="liuyan1">
            <a href="http://my.csdn.net/liuyan1" target="_blank"><img alt="liuyan1" class="avatar" src="image/head/${topic.user.headname }" /></a>
          </dt>
          <dd class="username">
            <a href="http://my.csdn.net/liuyan1" target="_blank">${topic.user.name }</a>
          </dd>
          
        </dl>
      </td>
      <td valign="top" class="post_info topic pointed" data-username="liuyan1" data-floor="">
                <div class="data">
            <strong class="fr">
     		         楼主
            </strong>
          <span class="time">
             	 发表于： ${topic.publishTime }
          </span>
        </div>
        <div class="post_body"> 
			<h3>${topic.title}</h3>
              <div class="tag ">
            ${topic.content }
              </div>
        </div>
          <!-- 主帖下Banner (D4) -->
          <!-- 主帖下文字 (D5) -->
      </td>
    </tr>
    <tr>
  
  </tr>
</table>
 <s:form action="reply_list" method="get">
	<s:hidden name="topic.id"/>
	<s:hidden name="page"/>
	<c:forEach items="${pageView.records }" var="entry" varStatus="i">
		  <table border="0" cellspacing="0" cellpadding="0" id="post-64681983" class="post  " data-post-id="64681983" data-is-topic-locked="false">
		  <colgroup><col width="180" /><col /></colgroup>
		  <tr>
		      <td rowspan="2" valign="top" class="wirter">
		                <dl class="user_info ">
		          <dt class="user_head" data-username="abuhome"><a href="http://my.csdn.net/abuhome" target="_blank"><img alt="abuhome" class="avatar" src="image/head/${entry.user.headname }" /></a>
		          </dt>
		          <dd class="username"><a href="http://my.csdn.net/abuhome" target="_blank">${entry.user.name }</a>
		          </dd>
		          <dd class="nickname"><span class="name2nick">${entry.user.regTime }</span></dd>      
		        </dl>	 
		      </td>
		      <td valign="top" class="post_info " data-username="abuhome" data-floor="1">
		                <div class="data">
		            <span class="fr">
		              <a href="#post-64681983">#<font color="red">${i.count+pageView.maxresult*(page-1)}</font></a>	       
		            </span>
		          <span class="time">
		            	  回复于：${entry.publishTime } 修改于：${entry.modifyTime  } 
		          </span>
		        </div>
		        <div class="post_body">
		           ${entry.content }
		        </div>		 
		      </td>
		    </tr>
		</table>
		</c:forEach>
		</s:form>
 	<!--         翻 页         -->
	<DIV>
	<%@ include file="/share/fenye.jsp" %>
	</DIV>
 		<!-- 回复帖子 -->
	<DIV>
	
		<s:form action="replyPost" method="post">
			<s:hidden name="topic.id"/>
			<DIV class="t" style="MARGIN: 15px 0px; TEXT-ALIGN: center">
				<TABLE cellSpacing="0" cellPadding="0" align="center">
				    <TR>
					    <TD class="h" colSpan="3"><B>发表帖子</B></TD>
				    </TR>
	   <c:if test="${sessionScope.user!=null}"> 
				    <TR class="tr3">
					    <TH vAlign=top>
					      <DIV><B>内容</B></DIV>
					    </TH>
					    <TH colSpan=2>
					        <DIV>	
						        <span>
						        <s:textarea name="reply.content" cssStyle="WIDTH: 500px;" cols="150" rows="20" tabindex="2"/>
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
</DIV>
<!--      声明        -->
<%@ include file="/share/foot.jsp" %>
  </body>
</html>



