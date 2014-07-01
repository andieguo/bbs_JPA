<%@ page contentType="text/html;charset=gbk" %>
<%@ include file="/WEB-INF/page/share/taglib.jsp" %>
<html>
<head>
<title>帖子列表管理</title>
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
	
	function actionEvent(methodname){
		var form = document.forms[0];
		if(validateIsSelect(form.all, form.replyids)){
			form.action="<%=basePath%>/control/reply/"+methodname;
			form.method.value=methodname;
			form.submit();
		}else{
			alert("请选择要操作的记录");
		}
	}
	function actionQuery(methodname,queryvalue){
		var form = document.forms[0];
		form.action="<%=basePath%>/control/reply/"+methodname;
		form.list_query.value=queryvalue;
		form.submit();
	}
	
	function allselect(allobj,items){
	    var state = allobj.checked;
	    if(items.length){
	    	for(var i=0;i<items.length;i++){
	    		if(!items[i].disabled) items[i].checked=state;
	    	}
	    }else{
	    	if(!items[i].disabled) items.checked=state;
	    }
	}
	
	/*
	 * 判断是否选择了记录
     */
	function validateIsSelect(allobj,items){
	    var state = allobj.checked;
	    if(items.length){
	    	for(var i=0;i<items.length;i++){
	    		if(items[i].checked) return true;
	    	}
	    }else{
	    	if(items.checked) return true;
	    }
	    return false;
	}
//-->
</script>
<SCRIPT language=JavaScript src="<%=basePath%>/js/FoshanRen.js"></SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" marginwidth="0" marginheight="0">
<s:form action="list" namespace="/control/reply" method="post">
<s:hidden name="page"/>
<s:hidden name="adminid"/>
<s:hidden name="query"/>
  <table width="98%" border="0" cellspacing="1" cellpadding="2" align="center">
    <tr ><td colspan="5" bgcolor="6f8ac4" align="right">
    	<%@ include file="/WEB-INF/page/share/fenye.jsp" %>
   </td></tr>
    <tr>
      <td width="6%" nowrap bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">帖子id</font></div></td>  
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">帖子标题</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">帖子作者</font></div></td>
      <td width="10%" bgcolor="6f8ac4"> <div align="center"><font color="#FFFFFF">帖子状态</font></div></td>
    </tr>
<!---------------------------LOOP START------------------------------>
<c:forEach items="${pageView.records}" var="entry">
    <tr>
      <td bgcolor="f5f5f5"> <div align="center"><input type="checkbox"       
  <c:if test="${!entry.visible||!entry.topic.visible||!entry.topic.board.visible}">disabled="disabled" </c:if>
       name="replyids" value="${entry.id}">${entry.id }</div></td>
     
      <td bgcolor="f5f5f5"> <div align="center"><a href="<s:url action="detailUI" namespace="/control/reply"/>?replyid=${entry.id}">${entry.title}</a></div></td>
      <td bgcolor="f5f5f5"> <div align="center">${entry.user.name}</div></td>
      <td bgcolor="f5f5f5"> <div align="center"><c:if test="${entry.visible&&entry.topic.visible&&entry.topic.board.visible}"><font color="blue">正常</font></c:if><c:if test="${!entry.visible||!entry.topic.visible||!entry.topic.board.visible}"><font color="red">已删除</font></c:if></div></td>
	</tr>
</c:forEach>
    <!----------------------LOOP END------------------------------->
      <tr> 
      <td bgcolor="f5f5f5" colspan="10" align="center"><table width="100%" border="0" cellspacing="1" cellpadding="3">
          <tr> 
            <td width="8%" align="left"><INPUT TYPE="checkbox" NAME="all" <c:if test="${fn:length(pageView.records)<1}">disabled="disabled"</c:if>
             onclick="javascript:allselect(this, this.form.replyids)">全选</td>
             <td>
              <input name="delete" type="button"
              <c:if test="${fn:length(pageView.records)<1}">disabled="disabled"</c:if>
               class="frm_btn" onClick="javascript:actionEvent('delete')" value="批量删除 "> &nbsp;&nbsp;
            
              <input name="query" type="button" class="frm_btn" onClick="javascript:actionQuery('list','visible')" value="筛选"> &nbsp;&nbsp;
             <input name="query" type="button" class="frm_btn" onClick="javascript:actionQuery('list','true')" value="查询"> &nbsp;&nbsp;
               <s:textfield name="reply.content" size="30" maxlength="40"/>
              
            	</td>
          </tr>
     <tr>
       
    </tr>
    <tr> 
  	       
        </table></td>
    </tr>
  </table>
</s:form>
</body>
</html>