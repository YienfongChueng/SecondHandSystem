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
	<title>后台商品管理</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
	<style>
		.label_style{
			color:#333;
		}
	</style>
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">商品管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>商品列表
				<span style="float:right;margin-right:15px;">
					<label class="label_style">类型：</label>
					<select name="select" id="select_type" class="form-select">
						<option value="">选择类型</option>
						<option value="buy">求购</option>
						<option value="sell">求售</option>
					</select>
					<label class="label_style">分类：</label>
					<select name="select" id="select_class" class="form-select">
						<option value="">选择分类</option>
						<option value="01">书籍</option>
						<option value="02">生活用品</option>
						<option value="02">电子产品</option>
					</select>
					<label class="label_style">搜索：</label>
					<input type="text" placeholder="搜索用户" name="" style="height:20px"/>
				</span>
				</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width:20%">商品名称</th>
						<th style="width:20%">商品图片</th>
						<th style="width:10%">发布时间</th>
						<th style="width:10%">发布者</th>
						<th style="width:5%">剩余量</th>
						<th style="width:5%">点击量</th>
						<th style="width:9%">所属分类</th>
						<th style="width:7%">类型</th>
						<th style="width:20%">操作</th>
					</tr>
					<tr>
						
						<td>java书</td>
						<td><img class="thumb" src="../../images/thumb.jpg" /></td>
						<td>2016-6-3</td>
						<td>小张</td>
						<td>2</td>
						<td>33</td>
						<td>书籍</td>
						<td>求购</td>
						
						<td>
							<div class="table-fun">
								<a href="admin_product_details.jsp" target="content">详情</a>
								<a href="">删除</a>
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