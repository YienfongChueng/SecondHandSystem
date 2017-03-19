<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<link rel="stylesheet" href="../admin_jsp/css/reset.css" />
	<link rel="stylesheet" href="../admin_jsp/css/public.css" />
	<link rel="stylesheet" href="../admin_jsp/css/content.css" />
</head>
<body>
  <jsp:include page="top.jsp" flush="true"/>
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">账号信息</a>></div>
		<div class="public-content" style="margin-top: 0">
			<!-- <div class="public-content-header">
				<h3>发布信息</h3>
			</div> -->
			<div class="public-content-cont">
			<form action="" method="post" style="margin:0 auto;width:50%">
				
				
				<div class="form-group">
					<label for="">用户名</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">密码</label>
					<input class="form-input-txt" type="password" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">班级</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">地址</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				
				<div class="form-group">
					<label for="">电话</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">保密问题</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">保密答案</label>
					<input class="form-input-txt" type="text" name="" value="" />
				</div>
				<div class="form-group">
					<label for="">性别</label>
					<span style="height: 6px;margin-left:5px;">
						男<input class="" type="radio" name="sex" value="0" />&nbsp;&nbsp;&nbsp;
						女<input class="" type="radio" name="sex" value="1" />
					</span>
					
				</div>
				
				
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" value="保  存" />
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>