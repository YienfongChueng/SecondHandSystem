<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--我的订单页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单详情 - 二手网</title>
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
     <span style="color:#16a085">我的订单详情</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="goods" colspan="2">商品</td>
    <td class="goods">单价（元）</td>
    <td class="goods">数量</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
	<!-- <tr>
	    <td class="order_item_select"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
	    <td class="order_logo" ><img style="width:74px;height:70px" src="http://139.199.206.70/pic/logo.jpg" alt="shopping"/></td>
	    <td class="order_describe"><a href="#" style="color:#16a085">logo大甩卖，不买就笨了</a><br />
	        颜色：白绿<br />
	        信仰：白绿精神</td>
	    <td class="order_price">1.00</td>
	    <td class="order_amount"> <label id="count">1</label> </td>
    </tr> -->
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
	'<td class="order_logo" ><img style="width:74px;height:70px" src="@proPic" alt="shopping"/></td>'+
	'<td class="order_describe"><a href="@url" style="color:#16a085">@title</a><br />'+
	' @prodesc</td>'+
	'<td class="order_price">@count</td>'+
	'<td class="order_amount"> <label id="count">@num</label> </td>'+
	'</tr>';
	
	var oid="${param.oid}";
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
		$("#shopping").html('');
		var currPage2=$("#input_page").val();
		var currPage3=$("#turnPage").val();
		 if(currPage2!=null&&currPage2!=""){
			currPage1=currPage2;
		}else{
			currPage1=currPage3;
		}
		$.ajax({
			   type: "POST",
			   url: "product_searchMySellOrderByPage.action",
			   data: {"oid":oid},
			   dataType:"json",
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
			    	temp=temp.replace("@proPic","../upload/"+data[i].product.proPicture);
			    	temp=temp.replace("@url","goods_detail.jsp?id="+data[i].product.id);
			    	temp=temp.replace("@title",data[i].product.proName);
			    	temp=temp.replace("@prodesc",data[i].product.proDesc);
			    	temp=temp.replace("@count",data[i].count);
			    	temp=temp.replace("@num",data[i].num);
			    	$("#shopping").append(temp);
			    }
			   }
		});
	}
</script>
</html>