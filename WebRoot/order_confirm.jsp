<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--提交订单页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>订单处理 - 提交</title>
<link rel="stylesheet" type="text/css" href="css/topbar.css">
<link  rel="stylesheet" href="css/order_confirm.css"/>
</head>
<body>
   <div id="commonTopbar" class="commonTopbar">
     <div id="commonTopbar_welcome" class="bar_left" style="margin-left:100px">
         <a id="headpage" href="http://my.58.com/index/?pp=topbar" target="_blank" style="color:#16a085">首页
         </a>
     </div>
   </div>
   <div id="page">
	<div id="content" class="grid-c">
		<div id="address" class="address" style="margin-top: 20px;" data-spm="2">
			<form name="addrForm" id="addrForm" action="#">
				<h3>确认交易地址</h3>
				<ul id="address-list" class="address-list">
					<li class="J_Addr J_MakePoint clearfix J_DefaultAddr " data-point-url="http://log.mmstat.com/buy.1.20">
					<div class="address-info">
						<input name="address" class="J_MakePoint " type="radio" value="674944241" id="addrId_674944241" data-point-url="http://log.mmstat.com/buy.1.20" ah:params="id=674944241^^stationId=0^^address=湖北民族学院（信息工程学院） 男生宿舍楼5栋102^^postCode=445000^^addressee=朱万雄^^phone=^^mobile=18727717260^^areaCode=422801" checked="checked">
						<label for="addrId_674944241" class="user-address">
                                                             广东省广州市某镇某街某道 (马仔 收) 
						  <em>135****7031</em>
						</label>
					</div>
					</li>
				</ul>
				<ul id="J_MoreAddress" class="address-list hidden">
				</ul>
				<div class="address-bar">
					<a href="#" class="new J_MakePoint" id="J_NewAddressBtn">添加地址</a>
				</div>
			</form>
		</div>
		<form id="J_Form" name="J_Form" action="/auction/order/unity_order_confirm.html" method="post">
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
				       <tr class="shop blue-line">
					      <td colspan="3">
                                                                 卖家：
						    <a class="J_ShopName J_MakePoint" style="color:#5cbdaa" data-point-url="" href="" target="_blank" title="大佬">大佬</a>
						    <span class="seller">联系卖家：<a href="" style="color:#5cbdaa" target="_blank" class="J_MakePoint" data-point-url="">188****4815</a></span>
						    <span class="J_WangWang" data-nick="淘米魅" data-display="inline"></span>
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
				        </tr>
				        <tr class="item-service">
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
							      <li class="dib user-info">
							        <ul class="wrap">
								      <li>
								        <div class="field gbook">
									       <label class="label">给卖家留言：</label>
									       <textarea style="width:350px;height:80px;" title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name="">
									       </textarea>
								        </div>
								      </li>
							        </ul>
							      </li>
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
</body>
</html>