<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
 body{height:100%;background:#16a085;overflow:hidden;} 
canvas{z-index:-1;position:absolute;}
.ulList{list-style-type:none;
width:100%;}
.lione{
width:90px;
float:left;
}
.litwo{
float:right;
}
.aList{
color:white;
}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
<script src="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
});
function login(form){
	if(form.userName.value == ""){
		alert("用户不能为空！");
		return false;
	}
	if(form.password.value == ""){
		alert("密码不能为空！");
		return false;
	}
	return validate();
}

</script>
</head>
<body>
<s:form action="userLogin" method="post" theme="simple" namespace="user_jsp/" onsubmit="return login(this);">
	<dl class="admin_login">
 <dt>
  <strong>校园二手物品交易系统</strong>
  <em>SecondHand System</em>
 </dt>
 <dd style="color:white"><s:actionerror/></dd>
 <dd class="user_icon">
  <input type="text" placeholder="账号" class="login_txtbx" name="userName"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码" class="login_txtbx" name="password"/>
 </dd>
 <dd class="val_icon">
   <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div> 
  <!-- <input type="button" value="点击核验验证码" class="ver_btn" onClick="validate();">  -->
 </dd>
 <dd>
  <input type="submit" value="立即登陆" class="submit_btn" />
 </dd>
 <dd>
  <div>
  	<ul class="ulList">
  	<li class="lione"><a class="aList" href="forgetPwd1.jsp">忘记密码？</a></li>
  	<li class="litwo"><a class="aList" href="user_regster.jsp">去注册</a></li>
  	</ul>
  </div>
  
 </dd>
</dl>
</s:form>

</body>

</html>
