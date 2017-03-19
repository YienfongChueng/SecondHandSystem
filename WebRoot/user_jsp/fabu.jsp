<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>发布信息</title>
	<link rel="stylesheet" href="../admin_jsp/css/reset.css" />
	<link rel="stylesheet" href="../admin_jsp/css/public.css" />
	<link rel="stylesheet" href="../admin_jsp/css/content.css" />
</head>
<body>
  <jsp:include page="top.jsp" flush="true"/>
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">发布信息</a>></div>
		<div class="public-content">
			<div class="public-content-header">
				<h3>发布信息</h3>
			</div>
			<div class="public-content-cont">
			<form action="" method="post" style="margin:0 auto;width:50%">
				<div class="form-group">
					<label for="">请选择分类</label>
					<select name="" class="form-select">
						<option value="">请选择分类</option>
					</select>
				</div>
				<div class="form-group">
					<label for="">请选择类型</label>
					<select name="" class="form-select">
						<option value="">求购</option>
						<option value="">求售</option>
					</select>
				</div>
				<div class="form-group">
					<label for="">商品名称</label>
					<input class="form-input-txt" type="text" name="Dream_SiteName" value="" />
				</div>
				<div class="form-group">
					<label for="">商品价格</label>
					<input class="form-input-txt" type="text" name="Dream_SiteName" value="" />
				</div>
				<div class="form-group">
					<label for="">商品描述</label>
					<textarea class="form-input-textara" type="text" name="Dream_SiteName"></textarea>
				</div>
				
				<div class="form-group">
					<label for="">剩余量</label>
					<input class="form-input-txt" type="text" name="Dream_SiteName" value="" />
				</div>
				<div class="form-group">
					<label for="">商品图片</label>
					<input class="form-input-txt" type="text" name="Dream_SiteName" value="" />
					<div class="file"><input type="file" class="form-input-file"/>选择文件</div>
					<div class="file"><input type="submit" class="form-input-file"/>上传</div>
					<a href="#">预览</a>
				</div>
				
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" value="提  交" />
					<input type="reset" class="sub-btn" value="重  置" />
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>