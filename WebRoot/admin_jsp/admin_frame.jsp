<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="model.Admin" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
	Admin adminLoginInfo=(Admin)request.getSession().getAttribute("Admin");
	if(adminLoginInfo==null){
		response.sendRedirect("admin_login.jsp");
	}
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>
	<link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/public.css">
</head>
<body>
<div class="public-header-warrp">
	<div class="public-header">
		<div class="content">
			<div class="public-header-logo"><a href=""><i>LOGO</i><h3>校园二手物品交易系统</h3></a></div>
			<div class="public-header-admin fr">
				<p class="admin-name"><%=adminLoginInfo.getName()%> 管理员 您好！</p>
				<div class="public-header-fun fr">
					<a href="exitLogin.action" class="public-header-loginout">安全退出</a>	
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!-- 内容展示 -->
<div class="public-ifame mt20">
	<div class="content">
	
		<div class="clearfix"></div>
		<!-- 左侧导航栏 -->
		<div class="public-ifame-leftnav">
			<div class="public-title-warrp">
				<div class="public-ifame-title ">
					<a href="">首页</a>
				</div>
			</div>
			<ul class="left-nav-list">
				<li class="public-ifame-item">
					<a href="javascript:;">管理员管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li class="active"><a href="adminInfoList.action" target="content">管理员列表</a></li>
							<li><a href="admin_add_admin.jsp" target="content">新增管理员</a></li>
							
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">用户管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="userInfoList.action" target="content">用户列表</a></li>
							
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">分类管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="cateInfoList.action" target="content">分类列表</a></li>
							<li><a href="admin_add_class.jsp" target="content">新增分类</a></li>
						</ul>
					</div>
				</li>
				<li class="public-ifame-item">
					<a href="javascript:;">商品管理</a>
					<div class="ifame-item-sub">
						<ul>
							<li><a href="productInfoList.action" target="content">商品列表</a></li>
						</ul>
					</div>
				</li>
				
				
			</ul>
		</div>
		<!-- 右侧内容展示部分 -->
		<div class="public-ifame-content">
		<iframe name="content" src="admin_main.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");

	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			$(".ifame-item-sub").hide();
			if($(this.lastElementChild).css('display') == 'block'){
				$(this.lastElementChild).hide()
				$(".ifame-item-sub li").removeClass("active");
			}else{
				$(this.lastElementChild).show();
				$(".ifame-item-sub li").on('click',function(){
					$(".ifame-item-sub li").removeClass("active");
					$(this).addClass("active");
				});
			}
		});
	}
});

	
</script>
</body>
</html>