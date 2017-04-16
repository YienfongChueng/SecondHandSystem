<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>二手网，你要的二货在此！</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
	int uid=0;
	User userLoginInfo=(User)request.getSession().getAttribute("User");
	if(userLoginInfo==null){
		response.sendRedirect("user_login.jsp");
	}else{
		uid=userLoginInfo.getUid();
	}
%>
<body marginwidth="0" marginheight="0">
	<header>
		 <h1><img src="../images/logo-w.png"/></h1>
		 <ul class="rt_nav">
			  <li><a href="index.jsp" target="_blank" class="website_icon">首页</a></li>
			  <li><a href="right_menu.jsp?uid=<%=uid %>" class="admin_icon">我的二货</a></li>
  			  <li><a href="personal_info.jsp?uid=<%=uid %>" class="set_icon">账号信息</a></li>
			  <li><a href="user_userExitLogin.action" class="quit_icon">安全退出</a></li>
		 </ul>
	</header>
</body>
</html>