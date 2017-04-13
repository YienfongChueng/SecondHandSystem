<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>个人信息</title>
	<link rel="stylesheet" href="../admin_jsp/css/reset.css" />
	<link rel="stylesheet" href="../admin_jsp/css/public.css" />
	<link rel="stylesheet" href="../admin_jsp/css/content.css" />
	<script src="js/jquery.js"></script>
</head>
<body>
  <jsp:include page="top.jsp" flush="true"/>
	<div class="container">
		<div class="public-nav">您当前的位置：<a href="">账号信息</a>></div>
		<div class="public-content" style="margin-top: 0">
			
			<div class="public-content-cont">
			<form action="" method="post" style="margin:0 auto;width:50%">
				
				<input type="hidden" name="uid" value="" id="uid"/>
				<div class="form-group">
					<label for="">用户名</label>
					<input class="form-input-txt" type="text" name="userName" value="" id="uname"/>
				</div>
				<div class="form-group">
					<label for="">密码</label>
					<input class="form-input-txt" type="password" name="password" value="" id="upass"/>
				</div>
				<div class="form-group">
					<label for="">班级</label>
					<input class="form-input-txt" type="text" name="schoolClass" value="" id="uclass"/>
				</div>
				<div class="form-group">
					<label for="">地址</label>
					<input class="form-input-txt" type="text" name="address" value="" id="uaddr" />
				</div>
				
				<div class="form-group">
					<label for="">电话</label>
					<input class="form-input-txt" type="text" name="phone" value="" id="uphone"/>
				</div>
				<div class="form-group">
					<label for="">保密问题</label>
					<input class="form-input-txt" type="text" name="qusetion" value="" id="uques"/>
				</div>
				<div class="form-group">
					<label for="">保密答案</label>
					<input class="form-input-txt" type="text" name="answer" value="" id="uanswer"/>
				</div>
				<div class="form-group">
					<label for="">性别</label>
					<span style="height: 6px;margin-left:5px;">
						男<input class="" type="radio" name="sex" value="0" id="umale"/>&nbsp;&nbsp;&nbsp;
						女<input class="" type="radio" name="sex" value="1" id="ufemale"/>
					</span>
					
				</div>
				
				
				<div class="form-group" style="margin-left:150px;">
					<input type="submit" class="sub-btn" value="保  存" onClick="save();"/>
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">

	var uid=${param.uid};
	$(document).ready(function() {
		getUserInfo();
		});
	function getUserInfo(){
		$.ajax({
			   type: "POST",
			   url: "user_searchPersonalInfo",
			   data: {"uid":uid},
			   dataType:"json",
			   success: function(result){
			     $("#uname").val(result.userName);
			     $("#upass").val(result.password);
			     $("#uclass").val(result.schoolClass);
			     $("#uaddr").val(result.address);
			     $("#uphone").val(result.phone);
			     $("#uques").val(result.qusetion);
			     $("#uanswer").val(result.answer);
			     $("#uid").val(result.uid);
					if(result.sex==0){
						$("#umale").attr("checked","checked");
					}else if(result.sex==1){
						$("#ufemale").attr("checked","checked");
					}
			   }
			});
	}

	 function save(){
		var uid=$("#uid").val();
		var username=$("#uname").val();
		var password=$("#upass").val();
		var schoolClass=$("#uclass").val();
		var address=$("#uaddr").val();
		var phone=$("#uphone").val();
		var qusetion=$("#uques").val();
		var answer=$("#uanswer").val();
		var sex=$('input:radio:checked').val();
		if(username==null||username==""){
			alert("用户名不能为空！");
			return;
			}
		if(password==null||password==""){
			alert("密码不能为空！");
			return;
			}
		$.ajax({  
            type: "POST",  
            url: "user_updateUserInfoById",  
            data:{"uid":uid,
                "userName":username,
                "password":password,
                "schoolClass":schoolClass,
                "address":address,
                "phone":phone,
                "qusetion":qusetion,
                "sex":sex
                }, 
            dataType: "json",  
            success: function(data){  
            	window.location.reload();      
             }  
        });  
	} 
</script>
</html>