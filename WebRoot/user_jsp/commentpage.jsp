<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="css/comment.css">
<link rel="stylesheet" type="text/css" href="css/dialog.css">
<script type="text/javascript" src="js/dialog.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/dialog-plus.js"></script>
<title>评论页</title>
</head>
<body>
<jsp:include page="topbar.jsp"></jsp:include> 
 <ul> 
	<li class="feed" style="margin: 0 auto;padding-top:30px;"> 
 		<!--第一层循环start--> 
		<div class="box1"> 
 		<!--第二层循环start-->
 		
 		<s:iterator var="comlist" value="list">
		<div class="box2"> 
			<div class="avatar"> 
				<img src="../images/female.png" alt="" /> 
			</div> 
			<div class="box2_comments"> 
				<p class='say'>
					<a href=""><s:property value="#comlist.user.userName"/>:</a> 
					<s:property value="#comlist.content"/>
				</p>
				<p> 
					<strong><s:date name="creatTime" format="yyyy-MM-dd"/></strong> 
					<a class="a_color" href="javascript:void(0);" onclick="opendialog(<s:property value="#comlist.id"/>);">回复</a>  
					<%-- <a class="a_color" href="product_addReply.action?cid=<s:property value="#comlist.id"/>">回复</a>  --%>
				</p>
				<s:if test="#comlist.reply!=null">
				<s:iterator var="replist" value="#comlist.reply">
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
							 <a class="a_color" href="javascript:void(0);" onclick="opendialog(<s:property value="#comlist.id"/>,${param.id });">回复</a>  
							<%-- <a class="a_color" href="product_addReply.action?cid=<s:property value="#comlist.id"/>">回复</a> --%>
						</p> 
					</div> 
					<div class="clear"> </div> 
				</div> <!--第三层循环end--> 
				</s:iterator>
				</s:if>
			</div>
				<p class="line"> </p> 
				<!-- <textarea name="" class="reply_area"> 我也说两句 </textarea> -->
				<div class="line"></div> 
		</div> <!--第二层循环end-->
		</s:iterator>
		<form action="product_addComment?id=${param.id }" method="post">
			<textarea name="content" class="reply_area" placeholder="我也说两句..."></textarea>
			<div style="margin:0 auto;"><button type="submit" style="width:50px;height:25px;">确定</button></div>
		</form>
	  </div>
		<div class="clear"> </div>
	</li>
	<nav style="text-align: center" id="pageShow">
		<s:if test="currPage != 1">
			<a href="product_getCommentList.action?id=${param.id }&currPage=1">首页</a>
			<a href="product_getCommentList.action?id=${param.id }&currPage=<s:property value="currPage-1"/>">上一页</a>
		</s:if>
		<s:if test="currPage != totalPage">
			<a href="product_getCommentList.action?id=${param.id }&currPage=<s:property value="currPage+1"/>">下一页</a>
			<a href="product_getCommentList.action?id=${param.id }&currPage=<s:property value="totalPage"/>">尾页</a>
		</s:if>
		第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
		共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
	</nav> 
 </ul> 
 </body> 
 <script type="text/javascript">
 function opendialog(cid,pid){
	 //debugger;
	 var d = dialog({
		    title: '回复',
		    content: '<form action="product_addReply.action?cid='+cid+'&id='+pid+'" method="post"><input autofocus name="repContent"/><form>'
		});
			d.showModal();
 }
 </script>
</html>