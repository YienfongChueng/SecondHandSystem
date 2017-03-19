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
	<title>后台管理员修改</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">管理员管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>修改管理员
					<span><a href="javascript:history.back(-1);" class="buttom_style">返回</a></span>
				</h3>
			</div>
			<div class="public-content-cont">
			<s:form action="saveAdmin" method="post" style="margin:0 auto;width:50%">
			<input type="hidden" name="aid" value="<s:property value="#admin.aid"/>"/>
				<div><s:actionerror style="color:red;"/></div>
				<div class="form-group">
					<label for="">管理员名称:</label>
					<input class="form-input-txt" type="text" name="name" value='<s:property value="#admin.name"/>' />
				</div>
				<div class="form-group">
					<label for="">原密码:</label>
					<input class="form-input-txt" type="password" readonly="true" value='<s:property value="#admin.password"/>' />
				</div>
				<div class="form-group">
					<label for="">新密码：</label>
					<input class="form-input-txt" type="password" name="password" value="" />
				</div>
				<div style="margin-top:10px;">
					<label for="">权限角色：</label>
					<s:if test="#admin.role==0">
						<label>超级管理员<input style="width:15px;height:15px;" type="radio" name="role" value="0" checked="checked"/></label>
						<label>系统管理员<input style="width:15px;height:15px;" type="radio" name="role" value="1" /></label>
					</s:if>
					<s:elseif test="#admin.role==1">
						<label>超级管理员<input style="width:15px;height:15px;" type="radio" name="role" value="0" /></label>
						<label>系统管理员<input style="width:15px;height:15px;" type="radio" name="role" value="1" checked="checked"/></label>
					</s:elseif>
					
					
				</div>

				<div class="form-group" style="margin-left:100px;">
					<input type="submit" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
			</s:form>
			</div>
		</div>
	</div>
</body>
</html>