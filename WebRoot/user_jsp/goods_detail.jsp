<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="model.User" %>
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
						<div class="reduce"><img src="../images/jian.jpg" onclick="sub()"  />
						</div>
						<form>	
                        <input class="input" value="1" id="needNum"></form>
						<div class="add"><img src="../images/jia.jpg" onclick="add()" /></div>

					</div>
					<div class="purchase"><a href="javascript:selflog_show();"><img src="../images/addtocart.png"></a></div>
				
			</ol>	
			
		</ul>
		<!-- 评论区域 -->
		<div class="div_div">
			<span class="div_p">大家说</span>
		</div>
		<hr style="background-color: #16a085;height:2px;">
		<ul class="goodsphotos" id="mydata">
		
		<!--遮罩弹窗 display: none-->
        <div id="mask" style="display: none"></div>
        <div class="pop_up" id="pop_up" style="width:50%;margin:0 auto;display: none">
          <form action="">
            <header style="font-size:20px;color:green;font-weight:bold;">
               	 回复               
            </header>
            <section class="p10-p15 bgfff">
                <textarea style="width:60%;border:2px solid green;" placeholder="回复内容..." rows="10" id="reasonText"></textarea>
            </section>
            <footer>
              <input type="button" value="提交" onclick="showDialog(false,'#mask, #pop_up');" style="width:65px;height:40px;margin:10px 0 0 20px;background-color:#16a085;color:#fff;font-size:17px;" ></footer>
          </form>
        </div>	
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
	function selflog_show()
	{ 
		var num = parseInt($("#needNum").val());
		$.ajax({
			url:"product_addToCart.action",
			type: "post",
			data:{"id":id,"num":num},
			success:function(msg){
				alert("添加成功!");
				},
			error:function(msg){
				alert("您尚未登录！");
				setTimeout("linkToLogin();",2000);
				}
			});
		
	}

	function linkToLogin(){
		window.location.href="user_login.jsp";
		}
	function add(){
	   var num = parseInt($("#needNum").val());
	   if(num<hassum)
	   {
		   $("#needNum").val(++num);
	   }
	}
	function sub(){
	   var num = parseInt($("#needNum").val());
	   if(num>1)
	   {
	      $("#needNum").val(--num);
	   }
	}

var template='<li style="margin-top:5px;">'+
'                <section style="margin:15px;">'+
'                    <div >'+
'                        <time class="time" >@time</time>'+
'                        <span class="person_name" >@userName</span>'+
'                    </div>'+
'                    <div class="comment_content">@commentContent</div>'+
'                    <div >'+
'                        <a href="javascript:void(0);" class="reply_btn" id="dialog_link" onclick="showDialog(true,\'#mask, #pop_up\')" >'+
'						<input type="hidden" id="commId" value="@commentId" />'+
'						回复</a>'+
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
			   var len=0;
			     if(result.totalCount>result.pageSize){
				     len=result.pageSize
				 }else{
				     len=result.totalCount;   
				}
				var data=result.list;
				for(var i=0;i<len;i++){
					var temp=template;
					temp=temp.replace("@time",data[i].creatTime);
					temp=temp.replace("@userName",data[i].user.userName);
					temp=temp.replace("@commentContent",data[i].content);
					temp=temp.replace("@commentId",data[i].id);
						for(var j=0;j<data[i].reply.length;j++){
						temp=temp.replace("@louzhu",data[0].product.user.userName+":");
						temp=temp.replace("@replyContent",data[i].reply[j].replyContent);
						}
					
				$("#mydata").append(temp);
				}
				var temp2='<li style="margin-top:5px;">'+
				'			<textarea id="toCommentContent" style="width:590px;height:100px;margin-left:20px;" placeholder="我来评论"></textarea>'+
				'			<div>'+
				'			<button style="width:65px;height:40px;margin:10px 0 0 20px;background-color:#16a085;color:#fff;font-size:17px;" onclick="toComment();" >提交</button>'+
				'			</div>'+
				'			</li>';
				$("#mydata").append(temp2);
		}
	});
}
//弹窗
function showDialog(flag,el){
    if(flag){
        $(el).show();
    }else if(flag == false){
        var cid=$("#commId").val();
        var repContent=$("#reasonText").val();
        toReply(cid,repContent);
        $(el).hide();
    }
}
function toComment(){
	var content=$("#toCommentContent").val();
	$.post("product_addComment.action",{"id":id,"content":content},function(data){
		   alert("评论成功！");
		   window.location.reload();
	});
}

function toReply(cid,repContent){
	$.post("product_addReply.action",{"cid":cid,"repContent":repContent},function(data){
		   alert("评论成功！");
		   window.location.reload();
	});
}

</script>

</html>