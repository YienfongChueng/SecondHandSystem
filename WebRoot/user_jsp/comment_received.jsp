<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的评论</title>
<link href="css/order_my.css" rel="stylesheet" type="text/css" />
</head>
<body>
  
  <div id="nav">
     <span>您的位置： </span>
     <span style="color:#16a085">我的评论</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
  <tr>
    <td class="goods" >评论内容</td>
    <td style="text-align: center">商品信息</td>
    <td class="goods" >评论时间</td>
    <td class="goods" >评论人</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping1">
	<!-- 数据 -->
	<tr>
	</tr>
	<s:iterator var="ctm" value="list">
	<tr>
	  <td class="goods order_item_select" ><s:property value="#ctm.content"/></td>
	  <td class="order_logo" ><img style="width:74px;height:70px" src="../upload/<s:property value="#ctm.product.proPicture"/>" alt="shopping"/></td>
	  <td class="order_describe order_item_select">
	  <a href="goods_detail.jsp?id=<s:property value="#ctm.product.id"/>" target="content" style="color:#16a085"><s:property value="#ctm.product.proName"/></a>
	  <br />
	  <s:property value="#ctm.product.proDesc"/></td>
	  <%-- <td class="goods order_item_select"><s:property value="#ctm.product.proName"/></td> --%>
	  <td class="goods order_item_select"><s:date name="creatTime" format="yyyy-MM-dd"/></td>
	  <td class="goods order_item_select"><s:property value="#ctm.user.userName"/></td>
	</tr>
	</s:iterator>
</table>
	<!-- 分页 -->
	<nav style="text-align: center" id="pageShow">
		<s:if test="currPage != 1">
			<a href="product_searchMyBuyOrderByPage.action?flag=1&currPage=1" target="content">首页</a>
			<a href="product_searchMyBuyOrderByPage.action?flag=1&currPage=<s:property value="currPage-1"/>" target="content">上一页</a>
		</s:if>
		<s:if test="currPage != totalPage">
			<a href="product_searchMyBuyOrderByPage.action?flag=1&currPage=<s:property value="currPage+1"/>" target="content">下一页</a>
			<a href="product_searchMyBuyOrderByPage.action?flag=1&currPage=<s:property value="totalPage"/>" target="content">尾页</a>
		</s:if>
			第<span style="color:red;font-weight:600"><s:property value="currPage"/></span>页
			共<span style="color:red;font-weight:600"><s:property value="totalPage"/></span>页
	</nav>
</div>
</body>
</html>