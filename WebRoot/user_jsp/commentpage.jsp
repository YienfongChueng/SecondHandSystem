<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/comment.css">
<title>评论页</title>
</head>
<body>
<button>我来评论</button>
 <ul> 
	<li class="feed" style="margin: 0 auto;padding-top:30px;"> 
 		<!--第一层循环start--> 
		<div class="box1"> 
 		<!--第二层循环start-->
 		<s:iterator var="comlist" value="list">
 		
		<div class="box2"> 
			<div class="avatar"> 
				<img src="../images/male.png" alt="" /> 
			</div> 
			<div class="box2_comments"> 
				<p class='say'>
					<a href=""><s:property value="#comlist.user.userName"/>:</a> 
					<s:property value="#comlist.content"/>
				</p>
				<p> 
					<strong><s:date name="creatTime" format="yyyy-MM-dd"/></strong> 
					<!-- <a href="">删除</a>  -->
					<a href="product_addReply.action?cid=<s:property value="#comlist.id"/>">回复</a> 
				</p>
				
				<s:iterator var="replist" value="comlist.reply">
 				<!--第三层循环start--> 
				<div class="box3"> 
					<div class="avatar">
						<img src="../images/male.png" alt="" /> 
					</div>
					<div class="box3_comments">
						<p class='say'> <a href=""><s:property value="#replist.user.userName"/>:</a>
						<s:property value="#replist.replyContent"/>
						</p> 
						<p> 
							<strong><s:date name="creatTime" format="yyyy-MM-dd"/></strong> 
							<!-- <a href="">删除</a>  -->
							<!-- <a href="">回复</a>  -->
						</p> 
					</div> 
					<div class="clear"> </div> 
				</div> <!--第三层循环end--> 
				</s:iterator>
			</div>
				<p class="line"> </p> 
				<textarea name="" class="reply_area"> 我也说两句 </textarea> 
		</div> <!--第二层循环end-->
		</s:iterator>
	  </div>
		<div class="clear"> </div>
	</li>
	<nav style="text-align: center" id="pageShow">
	
		<a href="product_searchMySellOrderByPage.action?currPage=1">首页</a>
		<a href="product_searchMySellOrderByPage.action?currPage=<s:property value="currPage-1"/>">上一页</a>
	
	
		<a href="product_searchMySellOrderByPage.action?currPage=<s:property value="currPage+1"/>">下一页</a>
		<a href="product_searchMySellOrderByPage.action?currPage=<s:property value="totalPage"/>">尾页</a>
	
		第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
		共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
	</nav> 
 </ul> 
 </body> 
</html>