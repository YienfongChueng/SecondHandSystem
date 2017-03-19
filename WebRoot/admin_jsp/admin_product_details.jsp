<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="model.Product" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台商品详情</title>
	<link rel="stylesheet" href="css/reset.css" />
	<link rel="stylesheet" href="css/public.css" />
	<link rel="stylesheet" href="css/content.css" />
</head>
<body marginwidth="0" marginheight="0">
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="admin_main.jsp" target="content">管理首页</a>><a href="">商品管理</a></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>商品详情信息
				<span><a href="javascript:history.back(-1);" class="buttom_style">返回</a></span>
				</h3>
			</div>
			<div class="public-content-cont">
			<!-- <form action="" method="post" style="margin:0 auto;width:50%"> -->
				
				<div class="form-group">
					<label for="">商品名称：</label>
					<input class="form-input-txt" type="text" name="" value='<s:property value="#product.proName"/>' readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">商品图片：</label>
					<img class="thumb" src="../upload/<s:property value="#product.proPicture"/>" />
				</div>
				<div class="form-group">
					<label for="">商品描述：</label>
					<textarea class="form-input-textara" type="text" name="" readonly="true"><s:property value="#product.proDesc"/></textarea>
				</div>
				<div class="form-group">
					<label for="">发布人</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.user.userName"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">发布时间：</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.createTime"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">商品价格：</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.proPrice"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">剩余量：</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.proHassum"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">点击量：</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.proClicknum"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">所属分类：</label>
					<input class="form-input-txt" type="text" name="" value="<s:property value="#product.classify.classifyName"/>" readonly="true"/>
				</div>
				<div class="form-group">
					<label for="">类型：</label>
					<s:if test="#product.type==0">
						<input class="form-input-txt" type="text" name="" value="求购" readonly="true"/>
					</s:if>
					<s:elseif test="#product.type==1">
						<input class="form-input-txt" type="text" name="" value="求售" readonly="true"/>
					</s:elseif>
					
				</div>
				<!-- </form> -->
			</div>
		</div>
	</div>

</body>
</html>