		

	var rowCount=3;
	//添加家庭成员
	function addPeople(){
		
		var tbhtml="<tr id=row"+rowCount+" >";
		tbhtml+="<td>姓名</td> <td><input type='text' id='familyname'  name='familyname'   /> </td>";
		tbhtml+="<td>性别</td><td><input type='text' id='familysex'   name='familysex'  /><a style='color: green' class='glyphicon glyphicon-minus' onclick='minusPeople("+rowCount+")'/> </td>";
		tbhtml+="</tr>";
		rowCount++;
		tbhtml+="<tr id=row"+rowCount+" >";
		tbhtml+="<td>身份证号</td> <td><input type='text' id='familycardid' name='familycardid'  /> </td>";
		tbhtml+="<td>电话号码</td><td><input type='text' id='familyphone' name='familyphone'   /> <a style='color: green' class='glyphicon glyphicon-plus' onclick='addPeople()'/></td>";
		tbhtml+="</tr>";
		$("#ftd").append(tbhtml);
		rowCount++;
	}
	//删除家庭成员
	function minusPeople(rowIndex){
		$("#row"+rowIndex).remove();
		rowIndex=rowIndex+1;
		$("#row"+rowIndex).remove();
		rowCount--;
		rowCount--;
	}



	//用户编辑框的数据回显
		function editUser(id) {
			$.ajax({
				type:"get",
				url:"edit.action",
				data:{"id":id},
				success:function(data) {
					$("#u_id").val(data.u_id);
					$("#u_name").val(data.u_name);
					$("#u_username").val(data.u_username);
					$("#u_birthday").val(data.u_birthday);
					$("#u_status").val(data.u_status);
					$("#u_nation").val(data.u_nation);
					$("#u_married").val(data.u_married);
					$("#u_phone").val(data.u_phone);
					$("#u_mobile").val(data.u_phone);
					var address=data.u_now_addr.split("-");

					$("#cmbProvince1").val(address[0]);
					$("#cmbCity1").val(address[1]);

					$("#cmbArea1").val(address[2]);
					addressInit('cmbProvince1', 'cmbCity1', 'cmbArea1',address[0],address[1],address[2]);  
					$("#u_now_addr").val(address[3]);
					$("#u_email").val(data.u_email);
					
					
				}
			});
		}
		function fclose(){
			$("#row").remove();
			$("#row").remove();
		}
		
	//家庭成员信息
		function showFamily(id) {
			$.ajax({
				type:"get",
				url:"showFamily.action",
				data:{"id":id},
				success:function(data) {
					if(data.length<1){
						alert("暂无家庭成员信息， 快去添加吧！");
						$("#familyInfo tbody").html("");
					}
					var j=0;
					for (var i =0; i < data.length; i++) {
						//addFamilyPeople(i);
						var f=0;
						var g=0;
						f=i+j;
						g=f+1;
						$("#row"+f).css("display","block");
						$("#row"+g).css("display","block");
						j++;
						$("#f_name"+i).val(data[i].f_name);
						$("#f_name"+i).attr("type","text");
						$("#f_sex"+i).val(data[i].f_sex);
						$("#f_sex"+i).attr("type","text");
						$("#f_card_id"+i).val(data[i].f_card_id);
						$("#f_card_id"+i).attr("type","text");
						$("#f_phone"+i).val(data[i].f_phone);
						$("#f_phone"+i).attr("type","text");
					}
					
				
					
					
				}
			});
		}
	
	
		function addFamilyPeople(i){
			if(i==null){
				var tbhtml="<tr id=row >";
				tbhtml+="<td>姓名</td> <td><input  type='text' id='f_name"+i+"'  name='f_name'   /> </td>";
				tbhtml+="<td>性别</td><td><input  type='text' id='f_sex"+i+"'   name='f_sex'  /><a style='color: green' class='glyphicon glyphicon-minus' onclick='minusPeople("+rowCount+")'/> </td>";
				tbhtml+="</tr>";
				rowCount++;
				tbhtml+="<tr id=row >";
				tbhtml+="<td>身份证号</td> <td><input  type='text' id='f_card_id"+i+"' name='f_card_id'  /> </td>";
				tbhtml+="<td>电话号码</td><td><input  type='text' id='f_phone"+i+"' name='f_phone'   /> <a style='color: green' class='glyphicon glyphicon-plus' onclick='addFamilyPeople()'/></td>";
				tbhtml+="</tr>";
				$("#familyInfo").append(tbhtml);
				rowCount++;
			}else{
			var tbhtml="<tr id=row"+rowCount+" >";
			tbhtml+="<td>姓名</td> <td><input disabled='disabled'  type='text' id='f_name"+i+"'  name='f_name'   /> </td>";
			tbhtml+="<td>性别</td><td><input disabled='disabled' type='text' id='f_sex"+i+"'   name='f_sex'  /></td>";
			tbhtml+="</tr>";
			rowCount++;
			tbhtml+="<tr id=row"+rowCount+" >";
			tbhtml+="<td>身份证号</td> <td><input disabled='disabled' type='text' id='f_card_id"+i+"' name='f_card_id'  /> </td>";
			tbhtml+="<td>电话号码</td><td><input disabled='disabled' type='text' id='f_phone"+i+"' name='f_phone'   /> <a style='color: green' class='glyphicon glyphicon-plus' onclick='addFamilyPeople()'/></td>";
			tbhtml+="</tr>";
			$("#familyInfo").append(tbhtml);
			rowCount++;
			}
		}
	
	
	
	
	//更新用户信息
		function updateCustomer() {
			$.post("update.action",$("#edit_customer_form").serialize(),function(data){
				alert("用户信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteCustomer(id) {
			if(confirm('确实要删除该用户吗?')) {
				$.post("delete.action",{"id":id},function(data){
					alert("用户删除更新成功！");
					window.location.reload();
				});
			}
		}



	
//全选和反选
	$(function(){
		$("#checkAllorNot").change(function(){
			var isChecked=$(this).prop("checked");
			if(this.isChecked){
				$("input[name='items']:checkbox").each(function(){
					$(this).prop("checked",isChecked);
				});
			}else{
				$("input[name='items']:checkbox").each(function(){
					$(this).prop("checked",isChecked);
				});
			}
			
		});
	});	
	//修改密码
	function updatePwd(){
		var ids=[];
		$("input[name='items']:checked").each(function(){
			ids.push($(this).attr("id"));
			
			$("#up_id").val($(this).attr("id"));
		});
		if(ids.length>1){
			alert("不能同时修改多个用户！");
			$("#updatePwd").attr("data-target"," ");
		}
		if(ids.length<1){
			alert("请先选择一个用户");
			$("#updatePwd").attr("data-target"," ");
		}
		
		
	}
	
	
	//删除用户
	function deleteUser(){
		
	
		var ids=[];
		$("input[name='items']:checked").each(function(){
			ids.push($(this).attr("id"));
		});
		if(ids.length<1){
			alert("请先选择一个用户再进行操作");

		
		}else if(confirm('确实要删除该用户吗?')) {
			
			for(i=0;ids[i]!=null;i++){
				$.post("delete.action",{"id":ids[i]},function(data){
					
				});
			}
			
			alert("用户删除更新成功！");
			window.location.reload();
			}
	}
			
	

	
	
	$.validator.addMethod(
		"checkCardId",
		function(value,emement,params){
			flag=true;
			$.ajax({
				"async" : false,
				"data" : {
					"u_card_id" : value
				},
				"dataType" : "json",
				"success" : function(data) {
					flag = data;
				},
				"type" : "POST",
				"url" : "checkCardId.action"
			});
	//返回false代表该校验器不通过
	return !flag;
});
	
	function addUI(){
		
$(function() {

		$("#addForm").validate({
			rules : {
				"u_name" : {
					"required" : true
					
				},
				"familyname" : {
					"required" : true
					
				},
				"familysex" : {
					"required" : true
				},
				"u_username" : {
					"required" : true,
					"rangelength" : [ 6, 12 ]
					
				},
				"u_card_id" : {
					"required" : true,
					"rangelength" : [ 18,18 ],
					"checkCardId":"12345678"
				},
				"u_nation" : {
					"required" : true
				},
				"u_married" : {
					"required" : true
				},
				
				"u_now_addr" : {
					"required" : true
				},
				"u_phone" :{
					"required": true,
					"rangelength" : [ 11,11 ]
				},
				"familyphone" :{
					"required": true,
					"rangelength" : [ 11,11 ]
				},
				"u_email" :{
					"required": true,
					"email": true
				},
				"familycardid" :{
					"required" : true,
					"rangelength" : [ 18,18 ],
					"checkCardId":"12345678"
				}
			},
			messages : {
				"u_name" : {
					"required" : "用户姓名不能为空！",
					
				},
				"familyname" : {
					"required" : "姓名不能为空！",
					
				},
				"familysex" : {
					"required" : "性别不能为空！",
					
				},
				"u_username" : {
					"required" : "用户账号不能为空！",
					"rangelength" : "用户账号必须是6到12位！"
				},
				"u_card_id" : {
					"required" : "身份证号不能为空！",
					"rangelength" : "身份证号必须是18位！",
					"checkCardId":"身份证号已经存在！"
				},
				"familycardid" : {
					"required" : "身份证号不能为空！",
					"rangelength" : "身份证号必须是18位！",
					"checkCardId":"身份证号已经存在！"
				},
				"u_nation" : {
					"required" : "请选择民族！"
				},
				"u_married" : {
					"required" : "请选择是否结婚！"
				},
				"u_now_addr" : {
					"required" : "请填写您的住址！"
				},
				"u_phone" : {
					"required" : "请填写您的电话！",
					"rangelength" : "移动电话必须是11位！"
				},
				"familyphone" : {
					"required" : "请填写您的电话！",
					"rangelength" : "移动电话必须是11位！"
				},
				"u_email" : {
					"required" : "请填写您的邮箱！",
					"email" : "邮箱格式不正确！"
				}
			}
		});

	});}
	
	