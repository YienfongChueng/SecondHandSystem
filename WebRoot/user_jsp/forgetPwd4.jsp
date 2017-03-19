<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- <meta http-equiv="Refresh" content="5;URL=user_login.jsp"/> -->
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
		var t=5;//设定跳转的时间 
		setInterval("refer()",2000); //启动2秒定时 
		function refer(){ 
			if(t==0){ 
			location="user_login.jsp"; //#设定跳转的链接地址 
			} 
		document.getElementById('show').innerHTML=""+t+"秒后跳转到登录页面"; // 显示倒计时 
		t--; // 计数器递减 
		}
</script>
</head>

<body>

  <div class="content">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext for-cur"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext for-cur"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
      <div class="successs">
       <h3>恭喜您，修改成功！</h3>
       <h4 style="color: #fff;font-size:18px;" id="show"></h4>
      </div>
   </div><!--web-width/-->
  </div><!--content/-->
 
</body>
</html>
