<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/login.css" />
	<style type="text/css">
	.title{
	font-size:50px;
	color:white;
	text-align:center;
	margin-top:60px;
	font-family: "微软雅黑";
	}
	</style>
</head>
<body>

<div class="page">
	<div class="title">校园二手物品交易系统后台</div>
	<div class="loginwarrp">
		<div class="logo">管理员登陆</div>
		
        <div class="login_form">
        <span><s:actionerror/></span>
			<s:form  method="post" onsubmit="" action="adminLogin" theme="simple" namespace="admin_jsp/">
				<li class="login-item">
					<span>用户名：</span>
					<input type="text" name="name" class="login_input">
				</li>
				<li class="login-item">
					<span>密　码：</span>
					<input type="password" name="password" class="login_input">
				</li>
				<div class="clearfix"></div>
				<li class="login-sub">
					<input type="submit" name="Submit" value="登录" />
				</li>                      
           </s:form>
		</div>
	</div>
</div>
</body>
</html>