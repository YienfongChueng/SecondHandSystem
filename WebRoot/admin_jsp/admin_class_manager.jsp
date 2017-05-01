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
	<title>后台分类管理</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">分类管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>分类列表
				<span style="float:right;margin-right:15px;">
				<s:form action="cateInfoList" method="post">
					<label style="color:#333">搜索：</label><input type="text" placeholder="搜索分类" name="classifyName" style="height:20px"/>
				</s:form>
				</span>
				</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width:10%">排序</th>
						<th style="width:30%">分类名称</th>					
						<th style="width:20%">操作</th>
					</tr>
					<s:iterator var="cate" value="list">
					<tr>
						<td><s:property value="#cate.ClassifySort"/></td>
						<td><s:property value="#cate.classifyName"/></td>
						<td>
							<div class="table-fun">
								<a href="editCate?cname=<s:property value="#cate.classifyName"/>" target="content">修改</a>
								<a href="delectCate.action?id=<s:property value="#cate.cid"/>">删除</a>
							</div>
						</td>
					</tr>
					</s:iterator>
					
				</table>
				<div class="page">
					<s:if test="currPage != 1">
						<a href="cateInfoList.action?currPage=1" target="content">首页</a>
						<a href="cateInfoList.action?currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
					</s:if>
					<s:if test="currPage != totalPage">
						<a href="cateInfoList.action?currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
						<a href="cateInfoList.action?currPage=<s:property value="totalPage"/>" target="content">尾页</a>
					</s:if>
						第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
						共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
				</div>
			</div>
		</div>
	</div>
</body>
</html>