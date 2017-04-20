<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--商品详情页面 -->
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>商品详情-页面</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
 
<!--引入Css样式类库文件-->  
<link rel="stylesheet" href="css/product_detail.css">
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
		
			<span class="div_p">大家说</span>
		</div>
		<hr style="background-color: #16a085;height:2px;">
		<ul class="goodsphotos" id="mydata">
			<!-- <li style="margin-top:5px;">
                <section style="margin:15px;">
                    <div >
                        <time class="time" >12:00</time>
                        <span class="person_name" >李峰</span>
                    </div>
                    <div class="comment_content">不错，很精彩，实用性很强，值得一看推荐阅读！</div>
                    <div >
                        <a href="javascript:void(0);" class="reply_btn" id="dialog_link" >回复</a>
                    </div>
                    <ul style="margin-top:20px;">
                        <li class="comment_reply_li" ><label class="comment_reply_label">小鱼：</label><span class="comment_reply_label">谢谢大家的点赞与好评！</span></li>
                    </ul>
                    
                </section>  
            </li>
			<li style="margin-top:5px;">
			<textarea style="width:590px;height:225px;margin-left:20px;" placeholder="我来评论"></textarea>
			<div>
			<button style="width:65px;height:40px;margin:10px 0 0 20px;background-color:#16a085;color:#fff;font-size:17px;" >提交</button>
			</div>
			</li> -->
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

var template='<li style="margin-top:5px;">'+
'                <section style="margin:15px;">'+
'                    <div >'+
'                        <time class="time" >@time</time>'+
'                        <span class="person_name" >@userName</span>'+
'                    </div>'+
'                    <div class="comment_content">@commentContent</div>'+
'                    <div >'+
'                        <a href="javascript:void(0);" class="reply_btn" id="dialog_link" >回复</a>'+
'                    </div>'+
'                    <ul style="margin-top:20px;">'+
'                        <li class="comment_reply_li" ><label class="comment_reply_label">@louzhu</label><span class="comment_reply_label">@replyContent</span></li>'+
'                    </ul>'+
'                    '+
'                </section>  '+
'            </li>';
function loadComment(){
	$.ajax({
		   url: "product_getCommentList.action",
		   type: "POST",
		   dataType:"json",
		   data:{"id":id},
		   success: function(result){
			   var temp=template;
			   var len=0;
			     if(result.totalCount>result.pageSize){
				     len=result.pageSize
				 }else{
				     len=result.totalCount;   
				}
				var data=result.list;
				var replyData=result.list.reply;
				for(var i=0;i<len;i++){
					temp+=temp.replace("@time",data.creatTime);
					temp+=temp.replace("@userName",data.user.userName);
					temp+=temp.replace("@commentContent",data.content);
					$.each(replyData, function(){     
						temp+=temp.replace("@louzhu",replyData.user.userName);
						temp+=temp.replace("@replyContent",replyData.reply);
					});
					
				}
				$("#mydata").append(temp);
				var temp2='<li style="margin-top:5px;">'+
				'			<textarea style="width:590px;height:225px;margin-left:20px;" placeholder="我来评论"></textarea>'+
				'			<div>'+
				'			<button style="width:65px;height:40px;margin:10px 0 0 20px;background-color:#16a085;color:#fff;font-size:17px;" >提交</button>'+
				'			</div>'+
				'			</li>';
				$("#mydata").append(temp2);
		}
	});
}
</script>

</html>