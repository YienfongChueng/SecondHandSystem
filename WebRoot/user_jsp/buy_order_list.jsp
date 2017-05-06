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
     <span style="color:#16a085">我的订单--买到的二货</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
  <tr>
    <td class="goods">订单号</td>
    <td class="goods">交易金额（元）</td>
    <td class="goods">交易地点</td>
    <td class="goods">卖家</td>
    <td class="goods">交易时间</td>
    <td class="goods">交易状态</td>
    <!-- <td class="goods">操作</td> -->
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
	'    <td class="goods order_item_select" >@orderNum</td>'+
	'    <td class="goods order_item_select">@amout</td>'+
	'    <td class="goods order_item_select">@address</td>'+
	'    <td class="goods order_item_select">@seller</td>'+
	'    <td class="goods order_item_select">@time</td>'+
	'    <td class="goods order_item_select order_status">@status</td>'+
	//'    <td class="goods order_item_select">'+
	//'		<a style="color:#5cbdaa" href="javascript:deleteRow(\'@oid\');">删除</a>'+
	//'		<a style="color:#5cbdaa" href="javascript:detailRow(\'@oid1\');">详情</a>'+
	//'	 </td>'+
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
			url:"product_searchMyBuyOrderByPage.action",
			type: "POST",
			async: false,
			dataType:"json",
			data:{"currPage":currPage1},
			success: function(result){
				var len=0;
			     if(result.totalCount>result.pageSize){
				     len=result.pageSize
				     }else{
				     len=result.totalCount;   
					 }
			     var data=result.list;
			     currPage=result.currPage;
			     totalPage=result.totalPage;
			     $("#curr").html(currPage);
			     $("#total").html(totalPage);
			     for(var i=0;i<len;i++){
				     var temp=template;
				     if(data[i].status==0){
				    	 temp=temp.replace("@status","待付款");
				     }else{
				    	 temp=temp.replace("@status","已完成");
				     }
				     temp=temp.replace("@orderNum",data[i].id);
				     temp=temp.replace("@amout",data[i].amount);
				     temp=temp.replace("@address",data[i].address);
				     temp=temp.replace("@seller",data[i].orderItem[i].product.user.userName);
				     temp=temp.replace("@time",data[i].createTime);
				     //temp=temp.replace("@oid",data[i].id);
				     //temp=temp.replace("@oid1",data[i].id);
				     $("#shopping1").append(temp);
				   }
				},
			error:function(){
				if(confirm("您尚未登录。是否现在去登录？")){
					window.location.href="user_login.jsp";
					}
				}
			
			});
	}
	
	function deleteRow(oid){
		$.post("product_deleteMySellOrder.action", { "oid": oid},function(data){
			alert("订单删除成功！");
		});
	}
	
	function detailRow(oid){
		window.location.href="sellorder_detail.jsp?oid="+oid;
	}
</script>
</html>