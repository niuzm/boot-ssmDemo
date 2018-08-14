<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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

<title>用户列表-BootCRM</title>

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
	<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
	<script src="<%=basePath%>js/jquery.validate.min.js"></script>
	<script src="<%=basePath%>js/customer.js"></script>
	
	
<style type="text/css">
		.error{
		color:Red;
		}
		</style>
</head>

<body>


		<ul class="nav nav-tabs">
  <li ><a href="${pageContext.request.contextPath }/homePage.jsp">首页</a></li>
 <li class="active"><a href="javascript:location.reload();">详细信息</a></li>
</ul>
			
				<!-- /.col-lg-12 -->
			
			<!-- /.row -->
			<div class="panel panel-default" style="margin-bottom: -7px;">
				<div class="panel-body">
					<form class="form-inline" action="${pageContext.request.contextPath }/user/list.action" method="get">
						<div class="form-group">
							<label for="username">登陆名称</label> 
							<input type="text" class="form-control" id="vo_u_username" value="${u_username }" name="vo_u_username">
						</div>
						<div class="form-group">
							<label for="u_name">真实姓名</label> 
							<input type="text" class="form-control" id="vo_u_name" value="${u_name }" name="vo_u_name">
						</div>
						
						<div class="form-group">
							<label for="custIndustry">用户状态</label> 
							<select	class="form-control" id="vo_u_status"  name="vo_u_status">
								<option value="" >--请选择--</option>
								
									<option id="vo_u_status" value="1" <c:if test="${status== '1'}"> selected="selected"</c:if>>可用</option>
									<option id="vo_u_status" value="0" <c:if test="${status== '0'}"> selected="selected"</c:if>>不可用</option>
								
							</select>
						</div>
						<button type="submit" class="btn btn-primary">查询</button>
					</form>
				</div>
			</div>
		
			<div class="row">
			
				<div class="col-lg-12">
					<div class="panel panel-default">
					
			<table class="table " style="height: 10;width: 10px">
			<tr>
			
 				<th><button type="button"  class="btn btn-info btn-sm" name="add"  data-toggle="modal" onclick="addUI()"  data-target="#userAddDialog">新增</button></th>

				
				<th><button type="button" class="btn btn-warning btn-sm" name="delete" onclick="deleteUser()">删除</button></th>
				<th><button type="button" class="btn btn-danger btn-sm" id="updatePwd" name="updatePwd" data-toggle="modal" data-target="#editPwd"  onclick="updatePwd()">修改密码</button></th>
			</tr>
			</table>
						<div class="panel-heading">用户信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th></th>
									<th><input type="checkbox" id="checkAllorNot" /></th>
									<th>登录名</th>
									<th>真实姓名</th>
									<th>民族</th>
									<th>是否结婚</th>
									<th>邮箱</th>
									<th>状态</th>
									<th>添加时间</th>
									<th>联系电话</th>
									<th>现住址</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page.rows}" var="row" varStatus="vs">
									<tr>
										<td align="center">${vs.count}</td>
										<th ><input type="checkbox" id="${row.u_id}"  name="items"/></th>
										
										<td align="center">${row.u_username}</td>
										<td align="center">${row.u_name}</td>
										<td align="center">${row.u_nation}</td>
										<td align="center">${row.u_married}</td>
										<td align="center">${row.u_email}</td>
										<td width="40px;" align="center">
										<c:if test="${row.u_status==1}">
										<span style="color: green" class="glyphicon glyphicon-ok" ></span> 
										</c:if>
										<c:if test="${row.u_status!=1}">
										<span style="color: red" class="glyphicon glyphicon-remove" ></span> 
										</c:if>
									
										</td>
										
										<td align="center"><fmt:formatDate value="${row.u_birthday}" pattern="yyyy-MM-dd" /></td>
										<td align="center">${row.u_phone}</td>
										<td align="center">${row.u_now_addr}</td>
										<td align="center">
											<a href="#" id="xiugai${vs.count}" class="btn btn-primary btn-xs" data-toggle="modal" data-target="#userEditDialog" onclick="editUser('${row.u_id}')">修改</a>
											<a href="#" class="btn btn-danger btn-xs" onclick="deleteCustomer('${row.u_id}')">删除</a>
											<a href="#" id="xiugai${vs.count}" class="btn btn-info btn-xs" data-toggle="modal" data-target="#familyDialog" onclick="showFamily('${row.u_id}')">家庭成员</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					
						<div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/user/list.action" />
						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 用户编辑对话框 -->
	<div class="modal fade" id="userEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
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
								<input type="text" class="form-control" id="u_username" placeholder="用户账号" name="u_username"/>
							</div>
						</div>
						<div class="form-group">
							<label for="u_birthday" style="float:left;padding:7px 15px 0 27px;">出生日期</label> 
							<div class="col-sm-10">
								<input type="date" class="form-control" id="u_birthday" placeholder="出生日期" name="birthday"/>
							</div>
						</div>
						
						
						<div class="form-group">
							<label for="u_status" style="float:left;padding:7px 15px 0 27px;">用户状态</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="u_status"  name="u_status">
									<option value="">--请选择--</option>
									<option value="1"<c:if test="${u_status == 1}"> selected="selected"</c:if>>可用${u_status}</option>
									<option value="0" <c:if test="${u_status == 0}"> selected="selected"</c:if>>不可用</option>
										
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label for="u_nation" style="float:left;padding:7px 15px 0 27px;">民族类别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="u_nation" name="u_nation">
									<option value="">--请选择--</option>
									
										
										<option  value="其它"<c:if test="${u_nation != '汉族'}"> selected="selected"</c:if>>其它</option>
										<option  value="汉族"<c:if test="${u_nation == '汉族'}"> selected="selected"</c:if>>汉族</option>
								</select>
							</div>
							
						</div>
						<div class="form-group">
							<label for="u_married" style="float:left;padding:7px 15px 0 27px;">是否结婚</label>
							<div class="col-sm-10">
								<select	class="form-control" id="u_married" name="u_married">
									<option value="">--请选择--</option>
									
										<option  value="是"<c:if test="${u_married == '是'}"> selected="selected"</c:if>>是</option>
										<option  value="否"<c:if test="${u_married != '是'}"> selected="selected"</c:if>>否</option>
									
								</select>
							</div>
							
						</div>
				
						<div class="form-group">
							<label for="u_now_addr" class="col-sm-2 control-label">当前住址</label>
							<select id="cmbProvince1" name="cmbProvince"  class="form-control" style="width: 120px; float: left;margin-left: 14px"></select>  
							<select id="cmbCity1" name="cmbCity"  class="form-control" style="width: 120px;float: left"></select>  
							<select id="cmbArea1" name="cmbArea"  class="form-control" style="width: 120px;float: left;margin-bottom: 15px;"></select>  
						<!-- <input type="text" value="详细地址" onblur="if(this.value=''){this.value='详细地址'}" onfocus="if(this.value='详细地址'){this.value='';this.style.color='#ff0000'}"> -->
				 			 
				 			 <div class="col-sm-10" >
								<input type="text" class="form-control" style="margin-left: 100px;" id="u_now_addr" placeholder="详细住址" name="u_now_addr">
							</div>
						</div>
						
						<!-- <div class="form-group">
							<label for="u_now_addr" class="col-sm-2 control-label">当前住址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_now_addr" placeholder="当前住址" name="u_now_addr">
							</div>
						</div> -->
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
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 家庭成员展示框 -->
	<div class="modal fade" id="familyDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">家庭成员信息</h4>
				</div>
				<div class="modal-body">
					
						<table class="table table-bordered table-striped" width="100%" id="familyInfo" >
						<tbody>
						<tr>
							<td colspan="4"><span class="col-sm-2 control-label">家庭成员</span>
							
							</td>	
						</tr>
								<tr id="row0" style="display: none;" >
								<td>成员姓名</td> <td><input disabled="disabled"   type="hidden" id="f_name0" name='f_name'   /> </td>
								<td>成员性别</td><td><input disabled="disabled" type="hidden" id="f_sex0"   name="f_sex"  /></td>
									</tr>
								<tr id="row1" style="display: none;" >
								<td>身份证号</td> <td><input disabled="disabled" type="hidden" id="f_card_id0" name="f_card_id"  /> </td>
								<td>电话号码</td><td><input disabled="disabled" type="hidden" id="f_phone0" name="f_phone"   /> </td>
								</tr>
								<tr id="row2" style="display: none;" >
								<td>成员姓名</td> <td><input disabled="disabled"   type="hidden" id="f_name1" name='f_name'   /> </td>
								<td>成员性别</td><td><input disabled="disabled" type="hidden" id="f_sex1"   name="f_sex"  /></td>
									</tr>
								<tr id="row3" style="display: none;" >
								<td>身份证号</td> <td><input disabled="disabled" type="hidden" id="f_card_id1" name="f_card_id"  /> </td>
								<td>电话号码</td><td><input disabled="disabled" type="hidden" id="f_phone1" name="f_phone"   /> </td>
								</tr>
								<tr id="row4" style="display: none;" >
								<td>成员姓名</td> <td><input disabled="disabled"   type="hidden" id="f_name2" name='f_name'   /> </td>
								<td>成员性别</td><td><input disabled="disabled" type="hidden" id="f_sex2"   name="f_sex"  /></td>
									</tr>
								<tr id="row5" style="display: none;" >
								<td>身份证号</td> <td><input disabled="disabled" type="hidden" id="f_card_id2" name="f_card_id"  /> </td>
								<td>电话号码</td><td><input disabled="disabled" type="hidden" id="f_phone2" name="f_phone"   /> </td>
								</tr>
								<tr id="row6" style="display: none;" >
								<td>成员姓名</td> <td><input disabled="disabled"   type="hidden" id="f_name3" name='f_name'   /> </td>
								<td>成员性别</td><td><input disabled="disabled" type="hidden" id="f_sex3"   name="f_sex"  /></td>
									</tr>
								<tr id="row7" style="display: none;" >
								<td>身份证号</td> <td><input disabled="disabled" type="hidden" id="f_card_id3" name="f_card_id"  /> </td>
								<td>电话号码</td><td><input disabled="disabled" type="hidden" id="f_phone3" name="f_phone"   /> </td>
								</tr>
						</tbody>
						</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" onclick="fclose()">关闭</button>
				</div>
			</div>   
		</div>
	</div>
	
	<!-- 添加 -->

	<form  class="form-horizontal" role="form" id="addForm"  name="addForm" method="post" action="${pageContext.request.contextPath }/user/addUser.action" >
	<div class="modal fade" id="userAddDialog" name="userAddDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增用户信息</h4>
				</div>
				<div class="modal-body">
					
						
						<div class="form-group">
							<label for="u_name" class="col-sm-2 control-label">用户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_name" placeholder="用户名称" name="u_name"/>
							</div>
						</div>
						<div class="form-group">
							<label for="u_username" class="col-sm-2 control-label" style="float:left;padding:7px 15px 0 27px">用户账号</label> 
							<div class="col-sm-10">
								<input type="text" class="form-control" id="u_username" placeholder="用户账号" name="u_username"/>
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
									
										<option   value="是">是</option>
										<option   value="否">否</option>
									
								</select>
							</div>
							
						</div>
						<div class="form-group">
							<label for="u_now_addr" class="col-sm-2 control-label">当前住址</label>
							<select id="cmbProvince" name="cmbProvince"  class="form-control" style="width: 120px; float: left;margin-left: 14px"></select>  
							<select id="cmbCity" name="cmbCity"  class="form-control" style="width: 120px;float: left"></select>  
							<select id="cmbArea" name="cmbArea"  class="form-control" style="width: 120px;float: left;margin-bottom: 15px;"></select>  
						<!-- <input type="text" value="详细地址" onblur="if(this.value=''){this.value='详细地址'}" onfocus="if(this.value='详细地址'){this.value='';this.style.color='#ff0000'}"> -->
				 			 
				 			 <div class="col-sm-10" >
								<input type="text" class="form-control" style="margin-left: 100px;" id="u_now_addr" placeholder="详细住址" name="u_now_addr">
							</div>
						</div>
				<script type="text/javascript">  
				addressInit('cmbProvince', 'cmbCity', 'cmbArea');  
				addressInit('cmbProvince1', 'cmbCity1', 'cmbArea1');  

				</script>
				
							
						<div class="form-group">
							<label for="u_phone" class="col-sm-2 control-label">移动电话</label>
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
						
						<table class="table table-bordered table-striped" width="100%" id="ftd" >
						
						<tr>
							<td colspan="4"><span class="col-sm-2 control-label">家庭成员</span></td>
						</tr>
							<tr >
								<td>姓名</td>
								<td><input type="text" id="familyname"  name="familyname" /> </td>
								<td>性别</td>
								<td><input type="text" id="familysex" name="familysex"   /> 
								
								
								</td>
								
							</tr >
							<tr >
							<td>身份证号</td>
								<td><input type="text" id="familycardid" name="familycardid"   /> </td>
								<td>电话号码</td>
								<td><input type="text" id="familyphone"  name="familyphone"  /> 
								<a style="color: green" class="glyphicon glyphicon-plus" onclick="addPeople()"/></td>
								<!-- <button style="color: green" class="glyphicon glyphicon-plus" onclick="addPeople()" ></button> -->
								
							</tr>
						</table>
					
					
				</div>
				
				<div class="modal-footer">
					
					<button type="submit" class="btn btn-primary" name="signup">提交</button>
				</div>
			</div>
		</div>
	</div>
		</form>
		<!-- 修改密码 -->
	<form  class="form-horizontal" role="form" id="editForm"  name="editForm" method="post" action="${pageContext.request.contextPath }/user/editPwd.action" >
	<input type="hidden" id="up_id" name="u_id" />
	<div class="modal fade" id="editPwd" name="editPwd" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">新增用户信息</h4>
				</div>
				<div class="modal-body">
				
						
						<div class="form-group">
							<label for="u_name" class="col-sm-2 control-label">请输入密码</label>
							<div class="col-sm-10">
								<input  type="password" class="form-control" id="u_password" placeholder="请输入密码" name="u_password"/>
							</div>
						</div>
						
					
					
				</div>
				
				<div class="modal-footer">
					
					<button type="submit" class="btn btn-primary" name="signup" >提交</button>
				</div>
			</div>
		</div>
	</div>
		</form>




</body>

</html>
