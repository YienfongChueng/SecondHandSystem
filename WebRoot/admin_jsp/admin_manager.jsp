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
	<title>后台管理员管理</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">管理员管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>管理员列表</h3>
			</div>
			<div class="public-content-cont">
				<table class="public-cont-table">
					<tr>
						<th style="width:20%">编号</th>
						<th style="width:20%">管理员账号</th>
						<th style="width:20%">权限角色</th>
						<th style="width:20%">操作</th>
					</tr>
					<s:iterator var="admin" value="list">
					<input type="hidden" name="aid" value="<s:property value="#admin.aid"/>"/>
					<tr>
						<td><s:property value="#admin.aid"/></td>
						<td><s:property value="#admin.name"/></td>
						<s:if test="#admin.role==0">
							<td>超级管理员</td>
						</s:if>
						<s:elseif test="#admin.role==1">
							<td>系统管理员</td>
						</s:elseif>
						<td>
							<div class="table-fun">
								<a href="editAdmin.action?aid=<s:property value="#admin.aid"/>" target="content">修改</a>
								<a href="delectAdmin.action?id=<s:property value="#admin.aid"/>" target="content" onclick="delcfm();">删除</a>
							</div>
						</td>
					</tr>
					</s:iterator>
					
				</table>
				<div class="page">
					
					<s:if test="currPage != 1">
						<a href="adminInfoList.action?currPage=1" target="content">首页</a>
						<a href="adminInfoList.action?currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
					</s:if>
					<s:if test="currPage != totalPage">
						<a href="adminInfoList.action?currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
						<a href="adminInfoList.action?currPage=<s:property value="totalPage"/>" target="content">尾页</a>
					</s:if>
						第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
						共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
						<!-- <input type="text" class="page-input">
						<input type="submit" class="page-btn" value="跳转"> -->
					 
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
	</script>
</body>
</html>