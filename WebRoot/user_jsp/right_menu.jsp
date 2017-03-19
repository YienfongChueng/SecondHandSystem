<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>二手网，你要的二货在此！</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>
<body>
	
	<aside class="lt_aside_nav content mCustomScrollbar">
		 <h2><a href="">菜单</a></h2>
		 <ul>
		  <li>
		   <dl>
			<dt>我的二货</dt>
			<!--当前链接则添加class:active-->
			<dd class="public-ifame-item"><a href="#" class="active">我发布的二货</a></dd>
			<dd class="public-ifame-item"><a href="#" >我购买的二货</a></dd>
			<dd class="public-ifame-item"><a href="#" >我卖出的二货</a></dd> 
		   </dl>
		  </li>
		  <li>
		   <dl>
			<dt>评论管理</dt>
			<dd class="public-ifame-item"><a href="#" >发出的评论</a></dd>
			<dd class="public-ifame-item"><a href="#" >收到的评论</a></dd>
		   </dl>
		  </li> 
		   <p class="btm_infor">© 13计科张燕芳 版权所有</p>
		 </ul>
   </aside>
   <!--主体内容-->
   <section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
		<iframe name="content" src="" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
     
		</div>
	</section>
</body>
<script src="js/jquery.js"></script>
<script>
$().ready(function(){
	var item = $(".public-ifame-item");
	for(var i=0; i < item.length; i++){
		$(item[i]).on('click',function(){
			
				$(".public-ifame-item a").on('click',function(){
					$(".public-ifame-item a").removeClass("active");
					$(this).addClass("active");
				});
			
		});
	}
});
</script>
</html>