<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!--提交订单页面 -->
<!DOCTYPE html >
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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
	function loadData(){
		$("#preData").html('');
		var ids="${param.ids}";
		$.ajax({
			type: "POST",
			url: "product_getComfirmProductList.action",
			data: {"ids":ids},
			dataType:"json",
			success: function(data){
				var result=data.data;
				/* $.each(function(){
					
					}); */
				var len=data.length;
				var temp=template;
				for(var i=0;i<len;i++){
					
					temp+=temp.replace("@seller",result[i].user.userName);
					temp+=temp.replace("@phone",result[i].user.phone);
					temp+=temp.replace("@detailurl","goods_detail.jsp?id="+result[i].id);
					temp+=temp.replace("@proPic","${basePath}/upload/"+result[i].proPicture);
					temp+=temp.replace("@title",result[i].proName);
					temp+=temp.replace("@singlePrice",result[i].proPrice);
					temp+=temp.replace("@num","1");
					temp+=temp.replace("@count",result[i].proPrice);
					}
					$("#preData").prepend(temp);
			},
			error: function(){
				alert("登录已过期，请重新登录！");
				}
						
			});
	}
</script>
</head>
<body>
   <jsp:include page="top.jsp"/>
   <div id="page">
	<div id="content" class="grid-c">
		<div id="address" class="address" style="margin-top: 20px;" data-spm="2">
			<form name="addrForm" id="addrForm" action="#">
				<h3>填写个人信息</h3>
				<ul id="address-list" class="address-list">
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr " >
					<div class="address-info">
						<label id="label-1">收货人:&nbsp;&nbsp;&nbsp;</label><input class="info" type="text" name="personName"/>
					</div>
					</li>
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr ">
					<div class="address-info">
						<label id="label-2">交易地址:</label><input class="info" type="text" name="address" />
					</div>
					</li>
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr ">
					<div class="address-info">
						<label id="label-3">联系电话:</label><input class="info" type="text" name="phone" /> 
					</div>
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
				    <tbody data-spm="3" class="J_Shop">
				       <tr class="first">
					      <td colspan="5">
					      </td>
				       </tr>
				       <!-- <tr class="shop blue-line">
					      <td colspan="3">
                                                                                    卖家：
						    <a class="J_ShopName J_MakePoint" style="color:#5cbdaa" href="#" id="seller"></a>
						    <span class="seller">联系卖家：<a href="#" style="color:#5cbdaa" class="J_MakePoint" id="phone"></a></span>
						    <span class="J_WangWang" data-display="inline"></span>
					      </td>
					     <td colspan="2" class="promo">
						    <div>
							  <ul class="scrolling-promo-hint J_ScrollingPromoHint">
						      </ul>
						    </div>
					     </td>
				        </tr>
				       <tr class="item">
					        <td class="s-title">
						       <a href="#" target="_blank" style="color:#5cbdaa" title="大佬牌名牌限量版logo你值得拥有" class="J_MakePoint" data-point-url="">
						         <img src="http://139.199.206.70/pic/logo.jpg" class="itempic">
						         <span class="title J_MakePoint" style="color:#5cbdaa" data-point-url="">大佬牌名牌限量版logo你值得拥有</span>
					           </a>
						       <div class="props">
							     <span>颜色: 白绿 </span>
							     <span>信仰: 白绿精神 </span>
							     <span>保质期: 永久 </span>
							     <span>品牌: 值得信赖 </span>
						       </div>
						       <div style="margin-top:2px">
							     <span style="color:gray;">确认订单后立刻通知卖家</span>
						       </div>
					        </td>
					        <td class="s-price">
						       <span class='price '>
						         <em class="style-normal-small-black J_ItemPrice">1.00</em>
						       </span>
						       <input type="hidden" name="costprice" value="1.00" class="J_CostPrice"/>
					        </td>
					        <td class="s-amount" data-point-url="">1</td>
					        <td class="s-total">
						       <span class='price '>
						         <em class="style-normal-bold-red J_ItemTotal ">1.00</em>
						       </span>
					        </td>
				        </tr> -->
				        <tr class="item-service" id="preData">
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
						        <em class="style-middle-bold-red J_ShopTotal">1.00</em>
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
												  <em class="t" style="color:#5cbdaa">实付款：</em>
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
												      <em>卖家:</em>
												      <span id="seller">大佬 188****4815 
												     </span>
											      </li>
											    </ul>
										    </div>
									    </div>
									    <a id="J_Go" class=" btn-go" data-point-url="" tabindex="0" title="点击此按钮，提交订单。">提交订单<b class="dpl-button"></b></a>
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