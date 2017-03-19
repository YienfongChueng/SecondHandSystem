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
					<s:form action="userInfoList" method="post">
						<label style="color:#333">搜索：</label><input type="text" placeholder="搜索用户" name="userName" style="height:20px"/>
					</s:form>
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
					<s:iterator var="user" value="list">
					<tr>
						<td><s:property value="#user.userName"/></td>
						<td><s:property value="#user.schoolClass"/></td>
						<s:if test="#user.sex==0"><td>男</td></s:if>
						<s:elseif test="#user.sex==1"><td>女</td></s:elseif>
						<td>
							<div class="table-fun">
								<a href="userDetail.action?uid=<s:property value="#user.uid"/>" target="content">详情</a>
							</div>
						</td>
					</tr>
					</s:iterator>
					
				</table>
				<div class="page">
					<s:if test="currPage != 1&&currPage <totalPage">
						<a href="userInfoList.action?currPage=1" target="content">首页</a>
						<a href="userInfoList.action?currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
					</s:if>
					<s:if test="currPage != totalPage&&currPage>1">
						<a href="userInfoList.action?currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
						<a href="userInfoList.action?currPage=<s:property value="totalPage"/>" target="content">尾页</a>
					</s:if>
						第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
						共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
				</div>
			</div>
		</div>
	</div>
</body>
</html>