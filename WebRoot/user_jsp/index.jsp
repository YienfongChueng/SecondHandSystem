<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--首页  -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>二手网，二货尽在此处！</title>
<link rel="stylesheet" type="text/css" href="css/homepage.css">
<link rel="stylesheet" href="css/bootstrap_v3_3.css">
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

<jsp:include page="topbar.jsp"></jsp:include>

<div id="headerWrap">
    <div id="homeWrap" class="wrapper">
        <div id="brand_top_banner" style="display:none"></div>
        <div id="header">
            <div id="headerinside">
                <a href="index.jsp" target="_self" id="logo">
	                <img id="bigLogo" src="../images/logo-l.png" style="width:70px;" alt="" title="logo" />
	                <img id="miniLogo" src="../images/logo-l.png" style="width:40px;height:20px"alt="" title="logo" />
                </a><div id="brand_mini_banner" class="search-no" style="display:none"></div>
                <form onsubmit="" action="" method="post" target="_self">
                <div id="searchbar" style="margin-top:15px">
                     <div id="saerkey">
                        <span id="key">
                        	<input type="text" id="keyword" name="proName" class="keyword2" placeholder="找你要的二货" />
                        </span>
                    </div>
                    <div class="inputcon">
                        <input  type="submit" name="button" id="searchbtn" class="btnall"  value="搜&nbsp;索" onMouseMove="this.className='btnal2'" onMouseOut="this.className='btnall'" tongji_tag="pc_home_search" onclick="loadData();return false;" />
                    </div>
                    <div id="hotwords" class="search-no clear">
                        <span id="hot"></span>
                        <span id="hot2">
                        <!-- <a href="" class="null">自行车</a>
                        <a href="" class="null">手机</a>
                        <a href="" class="null">耳机</a> --></span>
                    </div>
                </div>
                </form>
               
            </div>
        </div>
        <ul class="navcon" id="nav" style="margin-top:20px">
            <li id="homeNav" class="navBg fl">
            	<a class="navWit" href="/" target="_self">首页</a>
            </li>
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
      <a class="navbar-brand" href="javascript:loadData();" style="font-size:15px">综合</a>
      
    </div>
	<input type="hidden" id="condition"/>
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">人气 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="javascript:loadData();" onclick="selectWhat(1);">从高到低</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">价格 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="javascript:loadData();" onclick="selectWhat(2);">从低到高</a></li>
            <li><a href="javascript:loadData();" onclick="selectWhat(3);">从高到低</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">供求 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="javascript:loadData();" onclick="selectWhat(4);">求购</a></li>
            <li><a href="javascript:loadData();" onclick="selectWhat(5);">求售</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
          <input type="hidden" id="cid"/>
          <ul class="dropdown-menu" id="classify">
            
          </ul>
        </li>
      </ul>     
    </div>
  </div>
</nav>

<div class="row" style="margin-left:34px;margin-right:34px;" id="dataList">
  
</div>

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

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script> 
<script type="text/javascript">
var currPage;
var totalPage;

	$(document).ready(function(){
		loadData();
		loadClassify();
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
	function selectWhat(obj){
		switch(obj){
		case 1:
			$("#condition").val(1);
			break;
		case 2:
			$("#condition").val(2);
			break;
		case 3:
			$("#condition").val(3);
			break;
		case 4:
			$("#condition").val(4);
			break;
		case 5:
			$("#condition").val(5);
			break;
		}
	}
	function loadData(){
		$("#dataList").html("");
		var keyword=$("#keyword").val();
		var cid=$("#cid").val();
		var condition=$("#condition").val();
		var currPage2=$("#input_page").val();
		var currPage3=$("#turnPage").val();
		 if(currPage2!=null&&currPage2!=""){
			currPage1=currPage2;
		}else{
			currPage1=currPage3;
		}
		 
		$.ajax({
			   url: "product_searchProductList.action",
			   type: "POST",
			   async: false,
			   dataType:"json",
			   data:{"keyword":keyword,"currPage":currPage1,"cid":cid,"condition":condition},
			   success: function(result){
			     var len=0;
			     if(result.totalCount>result.pageSize){
				     len=result.pageSize
				     }else{
				     len=result.totalCount;   
					 }
			     var data=result.list;
			     var temp='';
			     var ptype='';
			     var page='';
			     currPage=result.currPage;
			     totalPage=result.totalPage;
			     $("#curr").html(currPage);
			     $("#total").html(totalPage);
			     for(var i=0;i<len;i++){
			    	var ty= data[i].type;
			    	var time=data[i].time;
			    	if(ty==0){
			    		ptype='求购';
				    	}else{
				    	ptype='求售';
					    	}
				    
			    	  temp='<div class="col-sm-6 col-md-3">'+
			    		'    <a href="goods_detail.jsp?id='+data[i].id+'"><div class="thumbnail">'+
			    		'      <img style="width:147px;height:150px;" src="../upload/'+data[i].proPicture+'" alt="pic1">'+
			    		'      <div class="caption">'+
			    		'        <h3 style="color:#16a085">￥'+data[i].proPrice+'</h3>'+
			    		'        <p style="color:#808080">'+data[i].proName+'</p>'+
			    		'        <p>'+
			    		'			<a href="" class="btn btn-primary" style="background:#16a085" role="button">加入购物车</a> '+
			    		'			<a class="btn btn-default" role="button">'+data[i].classify.classifyName+'</a>'+
			    		'			<p><span>&nbsp;&nbsp;浏览：'+data[i].proClicknum+' 人</span>'	+
			    		'			<span>&nbsp;&nbsp;类型：'+ptype+' </span>'	+
			    		'			<span>&nbsp;&nbsp;'+time+' </span></p>'	+
			    		'		</p>'+
			    		'      </div>'+
			    		'    </div></a>'+
			    		'  </div>';
				   $("#dataList").append(temp);
			   }
			   }
			});
		}
	function loadClassify(){
		$("#classify").html("");
		$.ajax({
			   url: "product_searchClassifyList.action",
			   type: "POST",
			   dataType:"json",
			   success: function(result){
			     var len=result.length;
			     var data=result.data;
			     var temp='';
			     for(var i=0;i<len;i++){
				     temp='<li><a href="javascript:loadData();" onclick="getCid('+data[i].cid+')">'+data[i].classifyName+'</a></li>';
				     $("#classify").append(temp);
				     }
			   }
			});
		}
	function getCid(cid){
		$("#cid").val(cid);
		}
</script>
</body>
</html>