<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--我的订单页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我发布的二货 - 二手网</title>
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
     <span style="color:#16a085">我发布的二货</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="goods" colspan="2">商品</td>
    <td class="goods">单价（元）</td>
    <td class="goods">库存</td>
    <td class="goods">发布时间</td>
    <td class="goods">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
	
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
    '@prodesc</td>'+
    '<td class="goods order_item_select">@price</td>'+
    '<td class="goods order_item_select"><label id="count">@hassum</label></td>'+
    '<td class="goods order_item_select">@createTime</td>'+
    '<td class="goods order_item_select"><a style="color:#5cbdaa" href="javascript:deleteRow(\'@id\');">删除</a></td>'+
	'</tr>';
	
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
			   url: "product_searchMyProductByPage.action",
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
			    	temp=temp.replace("@proPic","../upload/"+data[i].proPicture);
			    	temp=temp.replace("@url","goods_detail.jsp?id="+data[i].id);
			    	temp=temp.replace("@title",data[i].proName);
			    	temp=temp.replace("@prodesc",data[i].proDesc);
			    	temp=temp.replace("@hassum",data[i].proHassum);
			    	temp=temp.replace("@createTime",data[i].createTime);
			    	temp=temp.replace("@price",data[i].proPrice);
			    	temp=temp.replace("@id",data[i].id);
			    	$("#shopping").append(temp);
			    }
			   }
		});
	}
	
	function deleteRow(pid){
		$.post("product_deleteMyProductById.action", {"id": pid},function(data){
			alert("删除商品成功！");
		});
	}
</script>
</html>