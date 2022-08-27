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
    
    <title>My JSP 'roleAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	  <script>
		  function addRole() {
			 var formData = {
				 t_role_name:'',
			 }
				formData.t_role_name = document.getElementById("t_role_name").value;

			 $.ajax({
				 type:"post",
				 url:"${pageContext.request.contextPath}/role/add?",
				 data:JSON.stringify(formData),
				 contentType:"application/json;charset=utf-8",
				 success:function (resp) {
					 if (resp == "success"){
						 window.location.href = "http://localhost:8080/wangbo/role/findAll"
					 }
				 }
			 })
		 }
	  </script>
  </head>
  
  <body>
    	<form action="">
   	
   	<table id = "deptEditTable">
   		<tr>
   			<td>角色名称:</td>
   			<td><input type = "text" name="t_role_name" id="t_role_name"/></td>
   		</tr>  

   		<tr>
   			<td colspan="2">
   				<input type = "button" value="添加" onclick="addRole()"/>
   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/role/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
