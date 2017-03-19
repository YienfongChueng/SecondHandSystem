<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.Classify" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台分类新增</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">分类管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>新增分类</h3>
			</div>
			<div class="public-content-cont">
			<form action="addCate" method="post" style="margin:0 auto;width:50%">
				<div><s:actionerror style="color:red;"/></div>
				<div class="form-group">
					<label for="">分类名称:</label>
					<input class="form-input-txt" type="text" name="classifyName" value="" />
				</div>
				<div class="form-group">
					<label for="">排序:</label>
					<input class="form-input-txt" type="text" name="ClassifySort" value="" />
				</div>
				<div class="form-group" style="margin-left:100px;">
					<input type="submit" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>