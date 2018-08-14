<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>请登录</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">
</head>
 <body>
<div class="jumbotron" align="center">
    <h1>Hello, world!</h1>
    <p>请点击下方按钮  查看相关信息</p>
    <p><a class="btn btn-primary btn-lg" role="button" href="${pageContext.request.contextPath}/user/list.action">查看信息</a></p>
</div>
  </body>
</html>