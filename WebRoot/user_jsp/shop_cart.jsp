<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link href="css/shopcart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
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
<script type="text/javascript">
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
		$("#mydata").html("");
		var currPage2=$("#input_page").val();
		var currPage3=$("#turnPage").val();
		 if(currPage2!=null&&currPage2!=""){
			currPage1=currPage2;
		}else{
			currPage1=currPage3;
		}
		$.ajax({
			url:"product_searchCartByPage.action",
			type: "POST",
			async: false,
			dataType:"json",
			data:{"currPage":currPage1},
			success: function(result){
				if(result.totalCount==0){
					$("#mydata").prepend('<div><h2 style="text-align:center;font-size:20px;font-weight: bold">购物车空空如也！</h2></div>');
					return;
					}
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
			     var temp='';
			     for(var i=0;i<len;i++){
				     temp='<tr>'+
				     '<td class="tb2_td1"><input type="checkbox" value="'+data[i].productId+'"  name="'+data[i].productId+'"/></td>'+
				     '<td class="tb2_td2"><a href="goods_detail.jsp?id='+data[i].productId+'"><img src="../upload/'+data[i].productPic+'"/></a></td>'+
				     '<td class="tb2_td3"><a href="goods_detail.jsp?id='+data[i].productId+'">'+data[i].productName+'</a></td>'+
				     '<td class="tb1_td4">'+data[i].productDesc+'</td>'+
				     '<td class="tb1_td5">'+data[i].num+'</td>'+
				     '<td class="tb1_td6"><label class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">'+data[i].count+'</label></td>'+
				     '<td class="tb1_td7"><a href="javascript:deletCart('+data[i].id+')">删除</a></td>'+
				     '</tr>';
				     $("#mydata").append(temp);
				   }
				},
			error:function(){
				if(confirm("您尚未登录。是否现在去登录？")){
					window.location.href="user_login.jsp";
					}
				}
			
			});
		}

	function deletCart(id){
		if(confirm("确定要删除？")){
			$.post("product_deleteCartById.action",{"id":id},function(){
				alert("删除成功！");
				location.reload(true);
				});
			}
	}

	function clearChart(){
		if(confirm("确定要清空购物车？")){
			$.post("product_deleteCartAll.action",function(){
				alert("清空成功！");
				location.reload(true);
				});
			}
	}
</script>


</head>
<body>
<jsp:include page="top.jsp"/>
<div class="gwc" style=" margin:auto;">
	<table cellpadding="0" cellspacing="0" class="gwc_tb1">
		<tr>
			<td class="tb1_td1"><input id="allselect" type="checkbox"  class="allselect"/></td>
			<td class="tb1_td1">全选</td>
			<td class="tb1_td3">商品</td>
			<td class="tb1_td4">商品信息</td>
			<td class="tb1_td5">数量</td>
			<td class="tb1_td6">小计</td>
			<td class="tb1_td7">操作</td>
		</tr>
	</table>
	
	<table cellpadding="0" cellspacing="0" class="gwc_tb2" id="mydata">
		
	</table>
	<br>
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
	
	<script type="text/javascript">
	$(function(){
		
	//选中单个checkbox
	$("#mydata input[type='checkbox']").click(function(){
			getCount();
			if($(this).is(":checked")){
				$("#jz1").css("display", "none");
				$("#jz2").css("display", "block");
			}else{
				$("#jz1").css("display", "block");
				$("#jz2").css("display", "none");
			}
	});
	
	//checkbox 全选反选
	$("#allselect").click(function(){
		var t = $("#mydata input[type='checkbox']");
		if($(this).is(":checked")){
			t.prop("checked",true);
			getCount();
			$("#jz1").css("display", "none");
			$("#jz2").css("display", "block");
		}else{
			t.prop("checked",false);
			getCount();
			$("#jz1").css("display", "block");
			$("#jz2").css("display", "none");
		}
	});
	
	});

	var idStr;
	//总价
	function getCount(){
		var count = 0;
		var numbers=0;
		$("#mydata input[type='checkbox']").each(function(){
			if($(this).is(":checked")){
				numbers++;
				count+=parseInt($(this).parents("tr").find(".tot").text());
			}
	    });
		$("#sumprice").text(count.toFixed(2));
		$("#shuliang").text(numbers);
		//获取复选框的id值
		var id_arr=new Array();
		$('#mydata input[type="checkbox"]:checked').each(function(){
			id_arr.push($(this).val());//向数组中添加元素
			});
		idStr=id_arr.join(',');
	}

	function payMoney(){
		window.location.href="order_comfirm.jsp?ids="+idStr;
	}
	
	</script>
	
	<table cellpadding="0" cellspacing="0" class="gwc_tb3">
		<tr>
			<td class="tb1_td1"><input type="button" value="清空购物车" onclick="clearChart();"/></td>
			<td class="tb3_td2">已选商品 <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label> 件</td>
			<td class="tb3_td3">合计(不含运费):<span>￥</span><span style=" color:#ff5500;"><label id="sumprice" style="color:#ff5500;font-size:14px; font-weight:bold;">0.00</label></span></td>
			<td class="tb3_td4"><span id="jz1">结算</span><a href="javascript:payMoney();" style="display:none;"  class="jz2" id="jz2">结算</a></td>
		</tr>
	</table>
	<br>

</div>
</body>
</html>