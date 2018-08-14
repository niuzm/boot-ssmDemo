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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet"/>

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet"/>

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet"/>

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet"/>

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css"/>
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css"/>

<!-- Bootstrap Validator CSS -->
<link href="<%=basePath%>css/bootstrapValidator.css" rel="stylesheet"/>
<script src="<%=basePath%>js/tool.js"></script>
<!-- 表单校验 -->
<script src="<%=basePath%>js/bootstrapValidator.js"></script>
<script src="<%=basePath%>js/jquery.validate.min.js"></script>
	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>
	

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<!-- 添加 -->
	<form  class="form-horizontal" role="form" id="addForm"  name="addForm" >
	<div class="modal fade" id="userAddDialog" name="userAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增用111户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="u_id" name="u_id" />
						<div class="form-group">
							<label for="u_name" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_name" placeholder="用户名称" name="u_name">
							</div>
						</div>
						<div class="form-group">
							<label for="u_username" style="float:left;padding:7px 15px 0 27px;">用户账号</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_username" placeholder="用户账号" name="u_username">
							</div>
						</div>
						<div class="form-group">
							<label for="u_card_id" class="col-sm-2 control-label">身份证号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_card_id" placeholder="身份证号" name="u_card_id">
							</div>
						</div>
						
						<div class="form-group">
							<label for="u_nation" style="float:left;padding:7px 15px 0 27px;">民族类别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="u_nation" name="u_nation">
									<option value="">--请选择--</option>
									<option  value="汉族">汉族</option>
									<option  value="其它">其它</option>
										
								</select>
							</div>
							
						</div>
						<div class="form-group">
							<label for="u_married" style="float:left;padding:7px 15px 0 27px;">是否结婚</label>
							<div class="col-sm-10">
								<select	class="form-control" id="u_married" name="u_married">
									<option value="">--请选择--</option>
									
										<option  value="是">是</option>
										<option  value="否">否</option>
									
								</select>
							</div>
							
						</div>
						<div class="form-group">
							<label for="u_now_addr" class="col-sm-2 control-label">当前住址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_now_addr" placeholder="当前住址" name="u_now_addr">
							</div>
						</div>
						<div class="form-group">
							<label for="u_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_phone" placeholder="固定电话" name="u_phone">
							</div>
						</div>
						
						<div class="form-group">
							<label for="u_email" class="col-sm-2 control-label">邮箱地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_email" placeholder="邮箱地址" name="u_email">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="yanzheng" >验证</button>
					<button type="submit" class="btn btn-primary">提交</button>
				</div>
			</div>
		</div>
	</div>
	
	</form>
</body>
</html>