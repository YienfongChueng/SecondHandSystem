<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}

</style>
<script src="js/jquery.js"></script>
<script src="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  
  //测试提交，对接程序删除即可
  /* $(".submit_btn").click(function(){
	  location.href="index.html";
	  }); */
});

function check(form){
	if(form.userName.value == ""){
		alert("用户不能为空！");
		return false;
	}
	if(form.password.value == ""){
		alert("密码不能为空！");
		return false;
	}
}
</script>
</head>
<body>
 <s:form action="user_userRegister.action" namespace="user_jsp/" method="post" onsubmit="return check(this);">
<dl class="admin_login1">
 <dt>
  <strong>用户注册</strong>
  <em>User Register</em>
 </dt>
<dd><s:actionerror style="color:#fff"/></dd>
 <dd class="">
	<input type="text" placeholder="用户名" name="userName" class="login_txtbx1"/>
 </dd>
 <dd class="">
	<input type="password" placeholder="密码" name="password" class="login_txtbx1"/>
 </dd>
 <dd class="">
	<input type="text" placeholder="班级" name="schoolClass" class="login_txtbx1"/>
 </dd>
 <dd class="">
	<input type="text" placeholder="电话" name="phone" class="login_txtbx1"/>
 </dd>
 <dd class="">
	<textarea placeholder="地址" name="address" class="login_txtbx1"></textarea>
 </dd>
 <dd class="">
	<input type="text" placeholder="保密问题,用于找回密码" name="qusetion" class="login_txtbx1"/>
 </dd>
 <dd class="">
	<input type="text" placeholder="保密答案" name="answer" class="login_txtbx1"/>
 </dd>
 
 <dd>
  <input type="submit" value="提交" class="submit_btn"/>
 </dd>

</dl>
</s:form>
</body>
</html>