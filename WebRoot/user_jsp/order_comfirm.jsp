<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!--提交订单页面 -->
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>订单处理 - 提交</title>
<link  rel="stylesheet" href="css/order_confirm.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
.info{margin:5px;width:50%;height:30px;}
</style>
<script type="text/javascript">
	var template='<tr class="shop blue-line">'+
	'<td colspan="3">'+
	' 卖家：'+
	'<a class="J_ShopName J_MakePoint" style="color:#5cbdaa" href="#" id="seller">@seller</a>'+
	'<span class="seller">联系卖家：<a href="#" style="color:#5cbdaa" class="J_MakePoint" id="phone">@phone</a></span>'+
	'<span class="J_WangWang" data-display="inline"></span>'+
	'</td>'+
	'<td colspan="2" class="promo">'+
	'<div>'+
	'<ul class="scrolling-promo-hint J_ScrollingPromoHint">'+
	'</ul>'+
	'</div>'+
	'</td>'+
	'</tr>'+
	'<tr class="item">'+
	'<td class="s-title">'+
	'<a href="@detailurl" target="_blank" style="color:#5cbdaa" class="J_MakePoint" data-point-url="">'+
	'<img src="@proPic" class="itempic">'+
	'<span class="title J_MakePoint" style="color:#5cbdaa">@title</span>'+
	'</a>'+
	'<div style="margin-top:2px">'+
	'<span style="color:gray;">确认订单后立刻通知卖家</span>'+
	'</div>'+
	'</td>'+
	'<td class="s-price">'+
	'<span class=\'price \'>'+
	'<em class="style-normal-small-black J_ItemPrice">@singlePrice</em>'+
	'</span>'+
	'</td>'+
	'<td class="s-amount">@num</td>'+
	'<td class="s-total">'+
	'<span class=\'price \'>'+
	'<em class="style-normal-bold-red J_ItemTotal ">@count</em>'+
	'</span>'+
	'</td>'+
	'</tr>';
	$(document).ready(function(){
		loadData();
	});
	var sumMoney=0;
	var creator_arr=new Array();
	var creatorStr;
	function loadData(){
		$("#preData").html('');
		var ids="${param.ids}";
		$.ajax({
			type: "POST",
			url: "product_getMyCartChooseList.action",
			data: {"ids":ids},
			dataType:"json",
			asyc:false,
			success: function(data){
				var result=data.data;
				var len=data.length;
				for(var i=0;i<len;i++){
					var temp=template;
					temp=temp.replace("@seller",result[i].creatorName);
					temp=temp.replace("@phone",result[i].creatorPhone);
					temp=temp.replace("@detailurl","goods_detail.jsp?id="+result[i].productId);
					temp=temp.replace("@proPic","../upload/"+result[i].productPic);
					temp=temp.replace("@title",result[i].productName);
					temp=temp.replace("@singlePrice",result[i].singlePrice);
					temp=temp.replace("@num",result[i].num);
					temp=temp.replace("@count",result[i].total);
					$("#preData").prepend(temp);
					sumMoney+=result[i].total;
					creator_arr.push(result[i].creatorId);
					}
				creatorStr=creator_arr.join(",");
				$("#J_ActualFee").html(sumMoney);
				$("#sum1").html(sumMoney);
			},
			error: function(){
				alert("登录已过期，请重新登录！");
				}
						
			});
	}
	
	var name='';
	var addr='';
	var call='';
	function getinfo(){
		 name=$("#personName1").val();
		 addr=$("#address1").val();
		 call=$("#phone1").val();
		 $("#linkphone").html(call);
		$("#consumer").html(name);
		$("#J_AddrConfirm").html(addr);
		if(name!=""&&addr!=""&&call!=""){
			$("#personName1").attr({readonly:'true'});
			$("#address1").attr({readonly:'true'});
			$("#phone1").attr({readonly:'true'});
			$("#save").hide();
			}
		}

	

	function addOrder(){
		if(name==''||name==null){
			alert("收货人不能为空！");
			return false;
			}
		if(addr==''||addr==null){
			alert("收货地址不能为空！");
			return false;
			}
		if(call==''||call==null){
			alert("联系电话不能为空！");
			return false;
			}
		$("#amount1").val(sumMoney);
		$("#creatorIds").val(creatorStr);
		$("#addrForm").submit();
		};

	
</script>
</head>
<body>
   <jsp:include page="top.jsp"/>
   <div id="page">
	<div id="content" class="grid-c">
		<div id="address" class="address" style="margin-top: 20px;" data-spm="2">
			<form name="addrForm" id="addrForm" action="product_addOrder" method="post">
			<input type="hidden" name="ids" value="${param.ids}" />
			<input type="hidden" name="amount" id="amount1" />
			<input type="hidden" name="creatorIds" id="creatorIds" />
				<h3>填写个人信息</h3>
				<ul id="address-list" class="address-list">
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr " >
					<div class="address-info">
						<label id="label-1">收货人:&nbsp;&nbsp;&nbsp;</label><input class="info" type="text" name="personName" id="personName1"/>
					</div>
					</li>
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr ">
					<div class="address-info">
						<label id="label-2">交易地址:</label><input class="info" type="text" name="address" id="address1" />
					</div>
					</li>
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr ">
					<div class="address-info">
						<label id="label-3">联系电话:</label><input class="info" type="text" name="phone" id="phone1" /> 
					</div>
					</li >
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr ">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="info" style="color:#19a97b" value="保存" onclick="getinfo();" id="save"/>
					</li>
					
				</ul>
				
			</form>
		</div>
		<form id="J_Form" name="J_Form" action="" method="post">
			<div>
				<h3 class="dib">确认订单信息</h3>
				<table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable" summary="统一下单订单信息区域">
				   <thead>
				     <tr>
					   <th class="s-title">
						  商品<hr/>
					   </th>
					   <th class="s-price">
						  单价(元)<hr/>
					   </th>
					   <th class="s-amount">
						  数量<hr/>
					   </th>
					   <th class="s-total">
						 小计(元)<hr/>
					   </th>
				     </tr>
				    </thead>
				    <tbody data-spm="3" class="J_Shop" id="preData">
				       <!-- 动态拼接html数据 -->
				       
				        <tr class="item-service" >
					        <td colspan="5" class="servicearea" style="display: none">
					        </td>
				        </tr>
				        <tr class="blue-line" style="height: 2px;">
					        <td colspan="5">
					        </td>
				        </tr>
				        <tr class="other other-line">
					        <td colspan="5">
						       <ul class="dib-wrap">
							      <li class="dib extra-info">
							        <div class="extra-area">
								      <ul class="dib-wrap">
									      <li class="dib title">交易方式：</li>
									      <li class="dib content">见面交易</li>
								      </ul>
							        </div>
							        <div class="servicearea" style="display: none">
							        </div>
							        <div class="extra-area">
								      <ul class="dib-wrap">
									      <li class="dib title">订单处理：</li>
									      <li class="dib content">确认订单后立刻通知卖家</li>
								      </ul>
							        </div>
							        <div class="servicearea" style="display: none">
							        </div>
							       </li>
						       </ul>
					       </td>
				       </tr>
				       <tr class="shop-total blue-line">
					       <td colspan="5">
						             费用合计：
						      <span class='price g_price '>
						      <span>&yen;</span>
						        <em class="style-middle-bold-red J_ShopTotal" id="sum1">1.00</em>
						      </span>
					       </td>
			           </tr>
				   </tbody>
				   <tfoot>
				       <tr>
					       <td colspan="5">
						      <div class="order-go" data-spm="4">
							     <div class="J_AddressConfirm address-confirm">
								     <div class="kd-popup pop-back" style="margin-bottom: 40px;">
									    <div class="box">
										   <div class="bd">
											   <div class="point-in">
												  <em class="t" style="color:#5cbdaa" >实付款：</em>
												  <span class='price g_price '>
												     <span>&yen;</span><em class="style-large-bold-red" id="J_ActualFee">1.00</em>
												  </span>
											   </div>
											   <ul>
												  <li>
												     <em>见面地址:</em>
												     <span id="J_AddrConfirm" style="word-break: break-all;">
                                                                                                                              广东省广州市某镇某街某道
												      </span>
												  </li>
												  <li>
												      <em>买家:</em>
												      <span id="consumer">马仔 135****7031 
												      </span>
											      </li>
												   <li>
												      <em>联系电话:</em>
												      <span id="linkphone">大佬 188****4815 
												     </span>
											      </li> 
											    </ul>
										    </div>
									    </div>
									    <a id="J_Go" class=" btn-go" onclick="addOrder();" tabindex="0">提交订单<b class="dpl-button"></b></a>
								     </div>
							    </div>
						     </div>
					      </td>
				        </tr>
				    </tfoot>
				 </table>
			 </div>
		</form>
	</div>
  </div>
</body>
</html>