<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--我的订单页面 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>我的订单 - 二手网</title>
<link href="css/order_mime.css" rel="stylesheet" type="text/css" />
<link href="css/topbar.css" rel="stylesheet" type="text/css" />
</head>
<body>
  <div id="commonTopbar" class="commonTopbar">
     <div id="commonTopbar_welcome" class="bar_left" style="margin-left:100px">
       <a id="headpage" href="http://my.58.com/index/?pp=topbar" target="_blank" style="color:#16a085">首页   
       </a>
    </div>
  </div>
  <div id="nav">
     <span>您的位置： </span>
     <span style="color:#16a085">我的订单</span>
  </div>
  <div id="content">
 <table width="100%" border="0" cellspacing="0" cellpadding="0" id="shopping">
 <form action="" method="post" name="myform">
  <tr>
    <td class="allselect"><input id="allCheckBox" type="checkbox" value="" onclick="selectAll()" />全选</td>
    <td class="goods" colspan="2">商品</td>
    <td class="prices">单价（元）</td>
    <td class="amounts">数量</td>
    <td class="status">交易状态</td>
    <td class="delete">操作</td>
  </tr>
  <tr>
    <td colspan="8" class="line"></td>
  </tr>
  <tr>
    <td colspan="8" class="shopInfo">卖家：<a href="#" style="color:#16a085">大佬</a> </td>
  </tr>
   <tr id="product1">
    <td class="order_item_select"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
    <td class="order_logo" ><img style="width:74px;height:70px" src="http://139.199.206.70/pic/logo.jpg" alt="shopping"/></td>
    <td class="order_describe"><a href="#" style="color:#16a085">logo大甩卖，不买就笨了</a><br />
        颜色：白绿<br />
        信仰：白绿精神</td>
    <td class="order_price">1.00</td>
    <td class="order_amount"> <label id="count">1</label> </td>
    <td class="order_status">已完成</td>
    <td class="order_delete "><a style="color:#5cbdaa" href="javascript:deleteRow('product1');">删除</a></td>
  </tr>
  
  <tr>
    <td colspan="8" class="shopInfo">卖家：<a href="#" style="color:#16a085">大佬</a> </td>
  </tr>
   <tr id="product1">
    <td class="order_item_select"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
    <td class="order_logo" ><img style="width:74px;height:70px" src="http://139.199.206.70/pic/logo.jpg" alt="shopping"/></td>
    <td class="order_describe"><a href="#" style="color:#16a085">logo大甩卖，不买就笨了</a><br />
        颜色：白绿<br />
        信仰：白绿精神</td>
    <td class="order_price">1.00</td>
    <td class="order_amount"> <label id="count">1</label> </td>
    <td class="order_status">已完成</td>
    <td class="order_delete "><a style="color:#5cbdaa" href="javascript:deleteRow('product1');">删除</a></td>
  </tr>
  
  <tr>
    <td colspan="8" class="shopInfo">卖家：<a href="#" style="color:#16a085">大佬</a> </td>
  </tr>
   <tr id="product1">
    <td class="order_item_select"><input name="cartCheckBox" type="checkbox" value="product1" onclick="selectSingle()" /></td>
    <td class="order_logo" ><img style="width:74px;height:70px" src="http://139.199.206.70/pic/logo.jpg" alt="shopping"/></td>
    <td class="order_describe"><a href="#" style="color:#16a085">logo大甩卖，不买就笨了</a><br />
        颜色：白绿<br />
        信仰：白绿精神</td>
    <td class="order_price">1.00</td>
    <td class="order_amount"> <label id="count">1</label> </td>
    <td class="order_status">已完成</td>
    <td class="order_delete "><a style="color:#5cbdaa" href="javascript:deleteRow('product1');">删除</a></td>
  </tr>
  </form>
</table>

</div>
</body>
</html>