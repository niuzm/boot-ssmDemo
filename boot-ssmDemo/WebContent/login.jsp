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

    <div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath }/user/login.action" method="get">
        <h2 class="form-signin-heading" >请登录</h2>
        <input type="text" class="form-control" name="u_username" placeholder="Username" autofocus>
        <input type="password" class="form-control" name="u_password" placeholder="Password">
        <!-- <label class="checkbox"> -->
        <!-- <input type="checkbox" value="remember-me"> 记住密码 -->
        <!-- </label> -->
        <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
      </form>

    </div>
</body>
</html>