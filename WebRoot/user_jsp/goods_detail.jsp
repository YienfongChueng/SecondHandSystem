<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--商品详情页面 -->
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情-页面</title>
<link rel="stylesheet" href="css/product_detail.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
</head>
<body>
   <jsp:include page="topbar.jsp"></jsp:include>   
   <div class="Detailspage"> 
		<ul class="goodsphotos">
			
				<div class="bigphoto" ><img id="proLogo" style="width: 400px;height:400px; margin:0 auto;" src="../images/logo-l.png"></div>
				
				<ol class="maintheme">
					<div class="title"><a href="#"><p id="title"></p></a></div>
					<div class="image01"><img src=""></div>
					<div class="describe"><p id="describe"></p></div>
					<div class="price-service">
						<p class="price-discribe">售价</p>
						<p class="price">￥<span id="pro_price"></span></p>
						<div class="service01">
							<p class="service_describe01">卖家</p>
							<p class="service_describe02" id="username"></p>
						</div>
						<div class="service02">
							<p class="service_describe01">发布时间</p>
							<p class="service_describe02" id="time"></p>
						</div>
						<div class="service02">
							<p class="service_describe01">信息类型</p>
							<p class="service_describe02" id="info_type"></p>
						</div>
						<div class="service02">
							<p class="service_describe01">库存</p>
							<p class="service_describe02" id="hassum"></p>
						</div>
						
					</div>
					
					<div class="amount">
						<p class="count">数量</p>
						<div class="reduce"><img src="../images/jian.jpg"></div>
						<form>	
                        <input class="input" value="1"></form>
						<div class="add"><img src="../images/jia.jpg"></div>

					</div>
					<div class="purchase"><a href="#"><img src="../images/addtocart.png"></a></div>
				
			</ol>	
			
		</ul>
		<!-- 评论区域 -->
		<div class="div_div">
		<ul class="div_ul">
		<p class="div_p">大家说</p>
		</ul>
		</div>
		<hr style="background-color: #16a085;height:2px;">
		<ul class="goodsphotos">
		<li class="comment_li">
			<p class="comment_p"><label class="comment_label">人名说：</label>哈哈哈哈</p>
			<span class="comment_span">时间</span>
			<ul>
				<li>
					<p class="comment_p"><label class="comment_label">回复说：</label>哈哈哈哈</p>
					<span class="comment_span">时间</span>
				</li>
			</ul>
		<li>
		</ul>
		
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	loadData();
	loadComment();
	});
var id=${param.id};
var hassum;
function loadData(){
	$.ajax({
		   url: "product_getProductDetail.action",
		   type: "POST",
		   dataType:"json",
		   data:{"id":id},
		   success: function(result){
			   hassum=result.proHassum;
		     $("#title").html(result.proName);
		     $("#proLogo").attr("src",'../upload/'+result.proPicture);
		     $("#describe").html(result.proDesc);
		     $("#pro_price").html(result.proPrice);
		     $("#username").html(result.user.userName);
		     $("#time").html(result.createTime);
		     if(result.type==0){
		    	 $("#info_type").html("求购");
			 }else{
				 $("#info_type").html("求售");
				 }
		     
		     $("#hassum").html(hassum);
		   }
		});
	}

function loadComment(){
	$.ajax({
		   url: "product_getCommentList.action",
		   type: "POST",
		   dataType:"json",
		   data:{"id":id},
		   success: function(result){
			   
		}
	});
}
</script>
</html>