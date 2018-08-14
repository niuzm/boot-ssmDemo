<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>DEMO演示系统</title>

<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">
	
<script src="<%=basePath%>js/jquery-1.8.0.min.js"></script>
<script src="<%=basePath%>js/bootstrapValidator.js"></script>
<script src="<%=basePath%>js/bootstrap.min.js"></script>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">

		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top"  role="navigation"
			style="margin-bottom: 0;background-color:#00a6ac">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="javascript:void(0)" style="color:white">Demo演示系统</a>
		</div>
		<!-- /.navbar-header -->

		<ul class="nav navbar-top-links navbar-right">
			<li style="z-index: 999" class="dropdown">
			
				<c:if test="${not empty existUser }">
				<li style="color:white;padding-right: 5px;" class="dropdown">您好：${existUser}</li>
				<li style="color:white;margin-top:15px;padding-right: 120px" class="dropdown">
				<button type="button" id="loginOut" onclick="loginOut()" class="btn" style="background-color: #00a6ac;margin-right: 200px;margin-bottom:1px;color: white">
				  <span class="glyphicon glyphicon-remove"></span> 退出登录
				</button></li>
				</c:if>
		</ul>
		<!-- /.navbar-top-links -->
<script type="text/javascript">
 $("#loginOut").click(function() {
	if(confirm('确实要退出吗?')){
		$.post("<%=basePath%>user/loginOut.action",function(data){
			alert("用户退出成功！");
			window.location.reload();
		});
		
	}
});
	
</script>
		
</body>

</html>
