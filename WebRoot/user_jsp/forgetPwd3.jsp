<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script src="js/Particleground.js"></script>
<style type="text/css">
 body{height:100%;background:#BAE4C1;overflow:hidden;} 
canvas{z-index:-1;position:absolute;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	  //粒子背景特效
	  $('body').particleground({
	    dotColor: '#5cbdaa',
	    lineColor: '#5cbdaa'
	  });
}); 
	function check(form){
		if (form.password.value == "") {
			alert("请输入密码！");
			return false;
		}
		if (form.repassword.value == "") {
			alert("请输入确认密码！");
			return false;
		}
		if (form.password.value != form.repassword.value) {
			alert("两次密码输入不一致！");
			return false;
		}
	}
</script>
</head>

<body>

	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br />
						<strong>填写账户名</strong>
					</div>
					<div class="liutext for-cur">
						<em>2</em><br />
						<strong>验证身份</strong>
					</div>
					<div class="liutext for-cur">
						<em>3</em><br />
						<strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>4</em><br />
						<strong>完成</strong>
					</div>
				</div>
			</div>
			<!--for-liucheng/-->
			<%
				User u = (User) request.getSession().getAttribute("User");
			%>
			<form action="user_updatePwd" method="post" class="forget-pwd"
				onsubmit="return check(this);">
				<input type="hidden" name="uid" value="<%=u.getUid()%>"/>
				<dl>
					<dt>用户名：</dt>
					<dd>
						<input type="text" name="userName" value="<%=u.getUserName()%>"
							readonly />
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>新密码：</dt>
					<dd>
						<input type="password" name="password" />
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>确认密码：</dt>
					<dd>
						<input type="password" name="repassword" />
					</dd>
					<div class="clears"></div>
				</dl>
				<div class="subtijiao">
					<input type="submit" value="提交" />
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->

</body>
</html>
