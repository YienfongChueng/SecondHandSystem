<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台用户管理</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">用户管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>用户列表
				<span style="float:right;margin-right:15px;">
					<label style="color:#333">搜索：</label><input type="text" placeholder="搜索用户" name="" style="height:20px"/>
				</span>
				</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width:20%">用户名</th>
						<th style="width:20%">班级</th>
						<th style="width:20%">性别</th>
						<th style="width:20%">操作</th>
					</tr>
					<tr>
						<td>小刘</td>
						<td>计科1班</td>
						<td>女</td>
						<td>
							<div class="table-fun">
								<a href="admin_user_details.jsp" target="content">详情</a>
							</div>
						</td>
					</tr>
					
				</table>
				<div class="page">
					<form action="" method="get">
						<a href="">首页</a>
						<a href="">上一页</a>
						<a href="">下一页</a>
						第<span style="color:red;font-weight:600">12</span>页
						共<span style="color:red;font-weight:600">120</span>页
						<input type="text" class="page-input">
						<input type="submit" class="page-btn" value="跳转">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>