<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--我的订单页面 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单--卖出的商品</title>
<link href="css/order_my.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.page-input{
	width:40px;
	height: 20px;
	line-height: 20px;
	padding-left: 5px;
	border-radius: 5px;
	border:1px solid #ccc;
	outline: none;
}
.page-btn{
	width:40px;
	height: 28px;
	line-height: 20px;
	padding-left: 5px;
	border-radius: 5px;
	border: none;
	color:#fff;
	background: #6CB98F;
}
</style>
</head>
<body>
  
  <div id="nav">
     <span>您的位置： </span>
     <span style="color:#16a085">我的订单</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
  <tr>
    <td class="goods" colspan="2">商品</td>
    <td class="prices">单价（元）</td>
    <td class="amounts">数量</td>
    <td class="status">交易状态</td>
    <td class="delete">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping1">
	<!-- 数据 -->
</table>
	<!-- 分页 -->
	<nav style="text-align: center" id="pageShow">
	<input type="hidden" id="turnPage"/>
		<a id="first" href="javascript:loadData();" onclick="turnPage(1);">首页</a>
		<a id="pre" href="javascript:loadData();" onclick="turnPage(2);">上一页</a>
		<a id="next" href="javascript:loadData();" onclick="turnPage(3);">下一页</a> 
		<a id="last" href="javascript:loadData();" onclick="turnPage(4);">尾页</a>  
		第<span style="color:red;font-weight:600" id="curr"></span>页
		共<span style="color:red;font-weight:600" id="total"></span>页
		<input type="text" class="page-input" id="input_page">
		<input type="submit" class="page-btn" value="跳转" onclick="loadData();return false;">
	</nav>
</div>
</body>
<script src="js/jquery.js"></script>
<script type="text/javascript">
	var template='<tr>'+
	//'    <td colspan="8" class="shopInfo">卖家：<a href="#" style="color:#16a085">@sellerName</a> </td>'+
	'  </tr>'+
	'   <tr>'+
	'    <td class="order_logo" ><img style="width:74px;height:70px" src="@logopic" alt="shopping"/></td>'+
	'    <td class="order_describe"><a href="@url" target="_blank" style="color:#16a085">@title</a><br />'+
	'        @proDesc</td>'+
	'    <td class="order_price">@sum</td>'+
	'    <td class="order_amount"> <label id="count">@num</label> </td>'+
	'    <td class="order_status">@status</td>'+
	'    <td class="order_delete "><a style="color:#5cbdaa" href="javascript:deleteRow(\'@oid\');">删除</a></td>'+
	'  </tr>';
	
	var currPage;
	var totalPage;
	$(document).ready(function(){
		loadData();
		});
	function turnPage(obj){
		switch(obj){
		case 1:
			$("#turnPage").val(1);
			break;
		case 2:
			$("#turnPage").val(currPage-1);
			break;
		case 3:
			$("#turnPage").val(currPage+1);
			break;
		case 4:
			$("#turnPage").val(totalPage);
			break;
		}
	}
	
	function loadData(){
		$("#shopping1").html('');
		var currPage2=$("#input_page").val();
		var currPage3=$("#turnPage").val();
		 if(currPage2!=null&&currPage2!=""){
			currPage1=currPage2;
		}else{
			currPage1=currPage3;
		}
		$.ajax({
			url:"product_searchMySellOrderByPage.action",
			type: "POST",
			async: false,
			dataType:"json",
			data:{"currPage":currPage1},
			success: function(result){
			     var data=result.list;
			     currPage=result.currPage;
			     totalPage=result.totalPage;
			     $("#curr").html(currPage);
			     $("#total").html(totalPage);
			     for(var i=0;i<result.list.length;i++){
				     var temp=template;
				     //temp=temp.replace("@sellerName",);
				     temp=temp.replace("@logopic","../upload/"+data[i].orderItem[i].product.proPicture);
				     temp=temp.replace("@url","goods_detail.jsp?id="+data[i].orderItem[i].product.id);
				     temp=temp.replace("@title",data[i].orderItem[i].product.proName);
				     temp=temp.replace("@proDesc",data[i].orderItem[i].product.proDesc);
				     temp=temp.replace("@sum",data[i].orderItem[i].count);
				     temp=temp.replace("@num",data[i].orderItem[i].num);
				     temp=temp.replace("@status",data[i].status);
				     temp=temp.replace("@oid",data[i].id);
				   }
				},
			error:function(){
				if(confirm("您尚未登录。是否现在去登录？")){
					window.location.href="user_login.jsp";
					}
				}
			
			});
	}
</script>
</html>