<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!--我的订单页面 -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单--卖出的商品</title>
<link href="css/order_my.css" rel="stylesheet" type="text/css" />

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
	<tr>
	</tr>
	<s:iterator var="buy" value="list">
	<tr>
	  <td class="goods order_item_select" ><s:property value="#buy.id"/></td>
	  <td class="goods order_item_select"><s:property value="#buy.amount"/></td>
	  <td class="goods order_item_select"><s:property value="#buy.address"/></td>
	  <td class="goods order_item_select"><s:property value="#buy.creatorName"/></td>
	  <td class="goods order_item_select"><s:date name="createTime" format="yyyy-MM-dd HH:mm:ss"/></td>
	  <s:if test="#buy.status==0">
	  	<td class="goods order_item_select order_status">待付款</td>
	  </s:if>
	  <s:else>
	  <td class="goods order_item_select order_status">已完成</td>
	  </s:else>
	</tr>
	</s:iterator>
</table>
	<!-- 分页 -->
	<nav style="text-align: center" id="pageShow">
		<s:if test="currPage != 1">
			<a href="product_searchMyBuyOrderByPage.action?currPage=1" target="content">首页</a>
			<a href="product_searchMyBuyOrderByPage.action?currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
		</s:if>
		<s:if test="currPage != totalPage">
			<a href="product_searchMyBuyOrderByPage.action?currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
			<a href="product_searchMyBuyOrderByPage.action?currPage=<s:property value="totalPage"/>" target="content">尾页</a>
		</s:if>
			第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
			共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
	</nav>
</div>
</body>
</html>