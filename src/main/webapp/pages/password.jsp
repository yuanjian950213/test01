<%@ page language="java" isELIgnored="false" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>密码重置</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script src="js/axios-0.18.0.js"></script>

	<script>
		function changePwd() {
			var formData = {
				userpwd:'',
				newUserPwd:'',
				checkPwd:''
			}

			formData.userpwd = document.getElementById("userpwd").value;
			formData.newUserPwd = document.getElementById("newUserPwd").value;
			formData.checkPwd = document.getElementById("checkPwd").value;


			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/userRole/changePassword?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "nouser"){
						alert('修改失败！原密码有误')
						window.location.href = "http://localhost:8080/wangbo/pages/password.jsp"
					}
					if (resp == "success"){
						alert('修改成功！请重新登录')
						top.location.href = "http://localhost:8080/wangbo/pages/login.jsp"
					}
					if (resp == "nosuccess"){
						alert('修改失败！新密码与确认密码不一致！')
						window.location.href = "http://localhost:8080/wangbo/pages/password.jsp"
					}

				}
			})

		}
	</script>
  </head>
  <body>


    	<form action="${pageContext.request.contextPath}/userRole/changePassword">
   	<table id = "passwordTable">
   		<tr>
   			<td>原密码:</td>
   			<td><input type = "text" name="userpwd" id="userpwd"/></td>
   		</tr>
		<tr>
			<td>新密码:</td>
			<td><input type = "text" name="newUserPwd" id="newUserPwd"/></td>
		</tr>
   		<tr>
   			<td>确认密码:</td>
   			<td><input type = "text" name="checkPwd" id="checkPwd"/></td>
   		</tr>  

   		<tr>
   			<td colspan="2">
   				<input type = "button" value="修改" id="select" onclick="changePwd()"/>
   				<input type = "reset" value="重置"/>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
