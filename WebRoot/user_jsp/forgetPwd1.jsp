<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>找回密码</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js"></script>
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
	//验证码
	  createCode();
	  
});  
function check(form){
	return validate();
}
</script>

</head>

<body>
 
  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <form action="user_forgetPwd" method="post" class="forget-pwd" onsubmit="return check(this);">
       <dl><s:actionerror style="color:red;"/><s:fielderror style="color:red;"/></dl>
       <dl>
        <dt>账户名：</dt>
        <dd><input type="text" name="userName"/></dd>
        <div class="clears"></div>
       </dl> 
       <dl>
        <dt>验证码：</dt>
        <dd>
         <input type="text" id="J_codetext" maxlength="4"/> 
         <div class="yanzma">
         <canvas style="height: 36px;" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
          <!-- <img src="yzm.gif" /> -->  <a style="margin-left: 75px;" href="javascript:createCode();">换一换</a> 
         </div>
        </dd>
        <div class="clears"></div>
       </dl>
       <div class="subtijiao"><input type="submit" value="提交" /></div> 
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
  
<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
</div>
</body>
</html>
