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
	<jsp:include page="top.jsp"/>
	<aside class="lt_aside_nav content mCustomScrollbar" style="margin-left: 5px;">
		 <h2><a href="">菜单</a></h2>
		 <ul>
		  <li>
		   <dl>
			<dt>我的二货</dt>
			<!--当前链接则添加class:active-->
			<dd class="public-ifame-item"><a href="myproduct_list.jsp" class="active" target="content">我发布的二货</a></dd>
			<dd class="public-ifame-item"><a href="product_searchMyBuyOrderByPage.action" target="content" >我购买的二货</a></dd>
			<dd class="public-ifame-item"><a href="product_searchMySellOrderByPage.action" target="content">我卖出的二货</a></dd> 
		   </dl>
		  </li>
		  <li>
		   <dl>
			<dt>评论管理</dt>
			<dd class="public-ifame-item"><a href="product_searchCommentByPage.action?flag=0" target="content">发出的评论</a></dd>
			<dd class="public-ifame-item"><a href="product_searchCommentByPage.action?flag=1" target="content">收到的评论</a></dd>
		   </dl>
		   <dl>
			<dt>消息管理</dt>
			<dd class="public-ifame-item"><a href="product_searchMessageByPage.action?flag=1" target="content">用户消息</a></dd>
			<dd class="public-ifame-item"><a href="product_searchMessageByPage.action?flag=0" target="content">系统消息</a></dd>
		   </dl>
		  </li> 
		   <p class="btm_infor">© 13计科张燕芳 版权所有</p>
		 </ul>
   </aside>
   <!--主体内容-->
   <section class="rt_wrap content mCustomScrollbar">
		<div class="rt_content">
		<iframe name="content" src="myproduct_list.jsp" frameborder="0" id="mainframe" scrolling="yes" marginheight="0" marginwidth="0" width="100%" style="height: 700px;"></iframe>
     
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