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
					<s:form action="productInfoList" method="post" >
						<label class="label_style">类型：</label>
						<select name="select_type" id="select_type" class="form-select">
							<option value="">选择类型</option>
							<option value="0">求购</option>
							<option value="1">求售</option>
						</select>
					
						<label class="label_style">分类：</label>
						
						 <select name="select_class" id="select_class" class="form-select">
							 <option value="">选择分类</option>
							 <s:iterator var="cl" value="#cateList">
							 	<option value='<s:property value="#cl.cid"/>'><s:property value="#cl.classifyName"/></option>
							 </s:iterator> 
							
						</select>
					
						<label class="label_style">搜索：</label>
							<input type="text" placeholder="搜索商品" name="proName" style="height:20px"/>
					</s:form>
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
					<s:iterator var="pro" value="list">
					<tr>
						<td><s:property value="#pro.proName"/></td>
						<td><img class="thumb" src="../upload/<s:property value="#pro.proPicture"/>" /></td>
						<td><s:date name="#pro.createTime" format="yyyy-MM-dd hh:mm"/></td>
						<td><s:property value="#pro.user.userName"/></td><!-- 连表查询发布者名称 -->
						<td><s:property value="#pro.proHassum"/></td>
						<td><s:property value="#pro.proClicknum"/></td>
						<td><s:property value="#pro.classify.classifyName"/></td><!-- 连表查询分类名称 -->
						<s:if test="#pro.type==0">
						<td>求购</td>
						</s:if>
						<s:elseif test="#pro.type==1">
						<td>求售</td>
						</s:elseif>
						<td>
							<div class="table-fun">
								<a href="productDetail.action?id=<s:property value="#pro.id"/>" target="content">详情</a>
								<a href="delectProduct.action?id=<s:property value="#pro.id"/>" target="content" onclick="delcfm();">删除</a>
							</div>
						</td>
					</tr>
					</s:iterator>
				</table>
				<div class="page">
					<s:if test="currPage != 1">
						<a href="productInfoList.action?currPage=1" target="content">首页</a>
						<a href="productInfoList.action?currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
					</s:if>
					<s:if test="currPage != totalPage">
						<a href="productInfoList.action?currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
						<a href="productInfoList.action?currPage=<s:property value="totalPage"/>" target="content">尾页</a>
					</s:if>
						第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
						共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
				</div>
			</div>
		</div>
	</div>
	<%-- <script src="js/jquery.min.js"></script> --%>
	<script type="text/javascript">
	function delcfm() {
        if (!confirm("确认要删除？")) {
            window.event.returnValue = false;
        }
    }
	</script>
	
</body>
</html>