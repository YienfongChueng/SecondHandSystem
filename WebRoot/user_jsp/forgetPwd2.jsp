<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="model.User" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>

<body>

  <div class="content">
   <div class="web-width">
     <div class="for-liucheng">
      <div class="liulist for-cur"></div>
      <div class="liulist for-cur"></div>
      <div class="liulist"></div>
      <div class="liulist"></div>
      <div class="liutextbox">
       <div class="liutext for-cur"><em>1</em><br /><strong>填写账户名</strong></div>
       <div class="liutext for-cur"><em>2</em><br /><strong>验证身份</strong></div>
       <div class="liutext"><em>3</em><br /><strong>设置新密码</strong></div>
       <div class="liutext"><em>4</em><br /><strong>完成</strong></div>
      </div>
     </div><!--for-liucheng/-->
     <%
        request.setCharacterEncoding("utf-8");
 	    response.setCharacterEncoding("utf-8");	
     	User u=(User)request.getSession().getAttribute("User");
     %>
     <form action="user_checkAnswer" method="post" class="forget-pwd">
       <dl><s:actionerror style="color:red;"/></dl>
       <dl>
        <dt>用户名：</dt>
        <dd><input type="text" readonly name="userName" value='<%=u.getUserName()%>'/></dd>
        <div class="clears"></div>
       </dl>
       <dl class="sel-yzsj">
        <dt>问题：</dt>
        <dd><input type="text" name="question"  value="<%=u.getQusetion()%>" readonly  /></dd>
        <div class="clears"></div>
       </dl>
       
       <dl>
        <dt>回答：</dt>
        <dd><input type="text" name="answer" /></dd>
        <div class="clears"></div>
       </dl>
       <div class="subtijiao"><input type="submit" value="提交" /></div> 
      </form><!--forget-pwd/-->
   </div><!--web-width/-->
  </div><!--content/-->
  
</body>
</html>
