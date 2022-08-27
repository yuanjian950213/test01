<%@ page language="java" isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>用户登录</title>
	<base href="<%=basePath%>">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
  	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script src="js/axios-0.18.0.js"></script>

	  <script>
		  function loginUser() {
			  var formData = {
				  userAccount:'',
				  userPwd:'',
				  code:''
			  };

			  formData.userAccount = document.getElementById("userAccount").value;
			  formData.userPwd = document.getElementById("userPwd").value;
			  formData.code = document.getElementById("code").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/user/login?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/pages/main.jsp"
					  }
					  else {
						  window.location.href="http://localhost:8080/wangbo/pages/login.jsp"
					  }
				  }
			  })
		  }
	  </script>

	  <script type="text/javascript">
		  function changecode () {
			  $("#codeImg").attr("src","${pageContext.request.contextPath}/user/code?" + new Date());
		  }
	  </script>
  </head>

   <style type="text/css">
   body{
   	 background-color: #0070A2;
   }
   </style>




  <body>
     <div id = "login">
     	  <div id = "title">
     	  		NJWB管理系统
     	  </div>
     	  <form action="">
     	  <table id="loginTable">
     	  		<tr>
     	  			<td>用户名:&nbsp;</td>
     	  			<td>
     	  				<input type= "text" name = "userAccount" id = "userAccount"/>
						<br>
						<div id="errorusername">${login_msg}</div>
						<span id="username_err" class="err_msg" style="display:none">用户名不能为空</span>
     	  			</td>
     	  		</tr>
     	  		<tr>
     	  			<td>密&nbsp;&nbsp;&nbsp;码:&nbsp;</td>
     	  			<td>
     	  				<input type= "password" name = "userPwd" id = "userPwd"/>
						<br>
						<span id="password_err" class="err_msg" style="display:none">密码不能为空</span>
     	  			</td>
     	  			<td>&nbsp;</td>
     	  		</tr>

      	  		<tr>
     	  			<td>验证码:&nbsp;</td>
     	  			<td>
     	  				<input type= "text" name = "code" id = "code"/>
						<div id="code_err">${code_msg}</div>
     	  			</td>
     	  			<td>
     	  				&nbsp;
     	  			</td>
     	  		</tr>
     	  		    	  		
     	  		<tr>
     	  			<td colspan="3" align="center">
							<img align="bottom" id="codeImg" onclick="changecode()" src="${pageContext.request.contextPath}/user/code" alt="图片加载失败" title="点击换一张" >
     	  				<input type= "button" id="loginup" value="登&nbsp;录" class="btn" align="bottom" onclick="loginUser()"/>
     	  			</td>
     	  		</tr>
     	  </table>
     	</form>
     </div>
	 <script>
		 document.getElementById("userAccount").onblur = function () {
			 var userAccount = this.value;
			 axios.post("http://localhost:8080/wangbo/user/loginByUsername?",userAccount).then(
					 function (resp) {
						 if (resp.data){
							 document.getElementById("username_err").style.display = "none";
						 }
						 else {
							 document.getElementById("username_err").style.display = "";
						 }
					 })
		 }
	 </script>

	 <script>
		 document.getElementById("userPwd").onblur = function () {
			 var userPwd = this.value;
			 axios.post("http://localhost:8080/wangbo/user/loginByPassword?",userPwd).then(
					 function (resp) {
						 if (resp.data){
							 document.getElementById("password_err").style.display = "none";
						 }
						 else {
							 document.getElementById("password_err").style.display = "";
						 }
					 })
		 }
	 </script>
  </body>
</html>
