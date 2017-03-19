
﻿<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!--首页  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>二手网，二货尽在此处！</title>
<link rel="stylesheet" type="text/css" href="css/homepage.css">
<link rel="stylesheet" type="text/css" href="css/topbar.css">
<link rel="stylesheet" href="css/bootstrap_v3_3.css">
<style type="text/css">
</style>
</head>
<body>
<div id="commonTopbar" class="commonTopbar">
   <div id="commonTopbar_welcome" class="bar_left" style="margin-left:50px">
     <label>欢迎来到二手网！</label> 
   </div>
   <div class="bar_right" style="position:relative;margin-right:50px">
        <div id="commonTopbar_login">
           <a href="">登录
           </a>
           <span class="gap">|</span>
           <a href="">注册
           </a> 
        </div>   
        <div class="shopping_cart">
           <a href="" target="_blank">购物车
           </a>
        </div>   
        <div class="post_order">
           <a href="" target="_blank">发布商品
           </a>
        </div>        
        <div id="commonTopbar_my58menu" class="haschild">
           <a id="commonTopbar_tomy58" target="_blank" href="http://my.58.com/?pp=topbar">个人中心
           </a>
           <span class="mark"></span>
           <div class="hc" id="commonTopbar_loginbox">
              <a id="commonTopbar_tomypost" href="http://my.58.com/index/?pp=topbar" target="_blank">我的发布
              </a>
              <a id="commonTopbar_tozhaopinqiuzhi" href="http://my.58.com/zhaopinqiuzhi/?pp=topbar" target="_blank">招聘/简历
              </a>
              <a id="commonTopbar_tomytradebuy" href="http://my.58.com/buyordermgr/?pp=topbar" target="_blank">买家交易
              </a>
          </div>
        </div>
   </div> 
  
</div>
<div id="headerWrap">
    <div id="homeWrap" class="wrapper">
        <div id="brand_top_banner" style="display:none"></div>
        <div id="header">
            <div id="headerinside">
                <a href="http://gz.58.com" target="_self" id="logo"><img id="bigLogo" src="http://139.199.206.70/pic/logo.jpg" style="width:70px;" alt="" title="" /><img id="miniLogo" src="http://139.199.206.70/pic/logo.jpg" style="width:40px;height:20pxx"alt="" title="" /></a><div id="brand_mini_banner" class="search-no" style="display:none"></div>
                <form onsubmit='_gaq.push(["pageTracker._trackEvent", "home", "search_top_click", "/gz/index/"]);var r=true;try{b_query(); r=false;}catch(e){};return r;' action="/sou/" target="_self">
                <div id="searchbar" style="margin-top:15px">
                     <div id="saerkey">
                        <span id="key"><input type="text" id="keyword" name="key" class="keyword" value="找你要的二货" onBlur="win.closeToolTipWindow();if(this.value=='')this.value='找你要的二货',this.className='keyword'" onKeyUp="win.GetContentData();" onFocus="if(this.value=='找你要的二货')this.value='',this.className='keyword2'" autocomplete="off"/></span>
                    </div>
                    <div class="inputcon">
                        <input  type="submit" name="button" id="searchbtn" class="btnall"  value="搜&nbsp;索" onMouseMove="this.className='btnal2'" onMouseOut="this.className='btnall'" tongji_tag="pc_home_search" onclick="if(document.getElementById('keyword').value=='找工作 找房子 找服务')return false;" />
                    </div>
                    <div id="hotwords" class="search-no clear">
                        <span id="hot"></span>
                        <span id="hot2"><a href="/yewu/" class="null">自行车</a><a href="http://pic2.58.com/ds/biandang/gzl/pc_gzl_index.html?from=pc_home_sousuo_hot_guzhanglv" tongji_tag="pc_home_sousuo_hot_guzhanglv" class="null">手机</a><a href="http://zhaobiao.58.com/pc/quickpost/index?cateid3=4063&from=pc_zhaobiao_zhuangxiu_home_sousuo_wyzx&qc=pc_kuaisufabu" class="null">电脑</a><a href="http://xueyuan.58.com/list/gz" class="null">书籍</a><a href="http://j1.58cdn.com.cn/ds/chongwu/topic/topic_pet-dog.html" class="null">耳机</a></span>
                    </div>
                </div>
                </form>
               
            </div>
        </div>
        <ul class="navcon" id="nav" style="margin-top:20px">
            <li id="homeNav" class="navBg fl"><a class="navWit" href="/" target="_self">首页</a></li>
        </ul>
    </div>
</div>
<nav class="navbar navbar-default" style="margin-top:-8px;margin-left:48px;margin-right:48px">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" style="font-size:15px">综合</a>
      
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">人气 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">从低到高</a></li>
            <li><a href="#">从高到低</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">价格 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">从低到高</a></li>
            <li><a href="#">从高到低</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">供求 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">从低到高</a></li>
            <li><a href="#">从高到低</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">电子产品</a></li>
            <li><a href="#">书籍</a></li>
            <li><a href="#">生活用品</a></li>
            <li><a href="#">二手车</a></li>
          </ul>
        </li>
      </ul>     
    </div>
  </div>
</nav>

<div class="row" style="margin-left:34px;margin-right:34px;">
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
</div>

<div class="row" style="margin-left:34px;margin-right:34px;">
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-3">
    <div class="thumbnail">
      <img src="http://139.199.206.70/pic/logo.jpg" alt="pic1">
      <div class="caption">
        <h3 style="color:#16a085">¥&nbsp59.00</h3>
        <p style="color:#808080">春季2017新款白衬衫，男女通用</p>
        <p><a href="#" class="btn btn-primary" style="background:#16a085" role="button">详情</a> <a href="#" class="btn btn-default" role="button">客服</a></p>
      </div>
    </div>
  </div>
</div>

<nav style="text-align: center">
   <ul class="pagination pagination-lg">
	<li><a href="#">&laquo;</a></li>
	<li><a href="#">1</a></li>
	<li><a href="#">2</a></li>
	<li><a href="#">3</a></li>
	<li><a href="#">4</a></li>
	<li><a href="#">5</a></li>
	<li><a href="#">6</a></li>
	<li><a href="#">7</a></li>
	<li><a href="#">&raquo;</a></li>
  </ul>
</nav>>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
</body></html>