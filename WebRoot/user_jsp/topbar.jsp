<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="model.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>二手网，你要的二货在此！</title>
<link rel="stylesheet" type="text/css" href="css/topbar.css">
<script src="js/jquery.min.js"></script>

</head>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");	
	int uid=0;
	String uName="";
	User userLoginInfo=(User)request.getSession().getAttribute("User");
	if(userLoginInfo==null){
		response.sendRedirect("user_login.jsp");
	}else{
		uid=userLoginInfo.getUid();
		uName=userLoginInfo.getUserName();
	}
%>
<body marginwidth="0" marginheight="0">
<input type="hidden" value="<%=uName %>" id="uuname" />
	<div id="commonTopbar" class="commonTopbar">
   <div id="commonTopbar_welcome" class="bar_left" style="margin-left:50px">
     <label>欢迎来到二手网！</label> 
   </div>
   <div class="bar_right" style="position:relative;margin-right:50px" id="info">
        <div id="commonTopbar_login">
           <a href="user_login.jsp">登录
           </a>
           <span class="gap">|</span>
           <a href="user_regster.jsp">注册
           </a> 
        </div>   
        <div class="shopping_cart">
           <a href="shop_cart.jsp" target="_blank">购物车
           </a>
        </div>   
        <div class="post_order">
           <a href="fabu.jsp?uid=<%=uid %>" target="_blank">发布商品
           </a>
        </div>        
        <div id="commonTopbar_my58menu" class="haschild">
           <a id="commonTopbar_tomy58" target="_blank" href="right_menu.jsp">个人中心
           </a>
        </div>
   </div> 
  
</div>
</body>
<script type="text/javascript">
	
	var uuname=$("#uuname").val();
	if(uuname!=null&&uuname!=""){
		$("#commonTopbar_login").hide();
		temp='<span style="color:green">欢迎：'+uuname+'  登录本系统！</span>';
		$("#info").append(temp);
	}
</script>
</html>