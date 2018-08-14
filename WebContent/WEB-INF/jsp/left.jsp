<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>菜单</title>
<link href="${pageContext.request.contextPath}/css/left.css" rel="stylesheet" type="text/css"/>
<link rel="StyleSheet" href="${pageContext.request.contextPath}/css/dtree.css" type="text/css" />
</head>
<body>
<table width="100" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="12"></td>
  </tr>
</table>
<table width="100%" border="0">
  <tr>
    <td>
<div class="dtree">

	<a href="javascript: d.openAll();">展开所有</a> | <a href="javascript: d.closeAll();">关闭所有</a>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/dtree.js"></script>
	<script type="text/javascript">
	
	d = new dTree('d');
	d.add('01',-1,'菜单导航栏');
	d.add('0102','01','组织管理','','','mainFrame','../images/tree/zuzhi.png','../images/tree/zuzhi.png');
	d.add('010201','0102','部门管理','javascript:void(0);','','mainFrame','../images/tree/manage.png');
	d.add('010202','0102','岗位管理','javascript:void(0);','','mainFrame','../images/tree/people.png');
	d.add('010203','0102','人员管理','${pageContext.request.contextPath}/user/list.action','','mainFrame','../images/tree/person.png');
	
	d.add('0104','01','权限管理管理','','','mainFrame','../images/tree/quanxian.png','../images/tree/quanxian.png');
	d.add('010401','0104','应用系统','javascript:void(0);','','mainFrame','../images/tree/yingyongxitong.png');
	d.add('010402','0104','导航权限','javascript:void(0);','','mainFrame','../images/tree/daohangquanxian.png');
	d.add('010403','0104','导航定义','javascript:void(0);','','mainFrame','../images/tree/daohang.png');
	                                                                                    
	d.add('0105','01','日志管理','','','mainFrame','../images/tree/rizhi.png','../images/tree/rizhi.png');
	d.add('010501','0105','登录日志','javascript:void(0);','','mainFrame','../images/tree/loginrizhi.png');
	d.add('010502','0105','系统日志','javascript:void(0);','','mainFrame','../images/tree/xitongrizhi.png');
	d.add('010503','0105','操作日志','javascript:void(0);','','mainFrame','../images/tree/caozuorizhi.png');

	d.add('0106','01','资源配置','','','mainFrame','../images/tree/ziyuan.png','../images/tree/ziyuan.png');
	d.add('010601','0106','表对象管理','javascript:void(0);','','mainFrame','../images/tree/table.png');
	d.add('010602','0106','数据字典','javascript:void(0);','','mainFrame','../images/tree/dictionary.png');
	
	d.add('0107','01','系统配置','','','mainFrame','../images/tree/system.png','../images/tree/system.png');
	d.add('010701','0107','平台参数','javascript:void(0);','','mainFrame','../images/tree/pingtaicanshu.png');
	d.add('010702','0107','系统信息','javascript:void(0);','','mainFrame','../images/tree/sconfig.png');
	
	document.write(d);
		
	</script>
</div>	</td>
  </tr>
</table>
</body>
</html>
