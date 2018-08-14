<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
		body
		{
			SCROLLBAR-ARROW-COLOR: #ffffff;  SCROLLBAR-BASE-COLOR: #dee3f7;
		}
    </style>
  </head>
  
<frameset rows="60,*" frameborder=0 border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/user/top.action" name="topFrame" >
  <frameset cols="159,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/user/left.action" name="leftFrame" noresize scrolling="YES">
		<frame src="${pageContext.request.contextPath}/homePage.jsp" name="mainFrame">
  </frameset>
  
</frameset>
</html>
