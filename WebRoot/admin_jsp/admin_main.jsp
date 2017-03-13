<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.Admin" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	Admin adminLoginInfo=(Admin)request.getSession().getAttribute("Admin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台管理主页</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>网站后台</h3>
			</div>
			<div class="public-content-cont">
				<p style="width: 100%;text-align: center; padding: 50px 0; font-size: 16px; color: #FF0000;"><%=adminLoginInfo.getName() %>管理员！ 欢迎登陆网站后台！</p>
			</div>
		</div>
	</div>
</body>
</html>