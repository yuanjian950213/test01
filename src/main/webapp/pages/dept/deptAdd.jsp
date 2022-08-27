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
    
    <title>My JSP 'deptAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	 <script src="js/axios-0.18.0.js"></script>
	  <script>
		  function add(){
			  var formData = {
				  deptNo:'',
				  deptName:'',
				  deptLocation:'',
				  manager:''
			  }
			  formData.deptNo = document.getElementById("deptNo").value;
			  formData.deptName = document.getElementById("deptName").value;
			  formData.deptLocation = document.getElementById("deptLocation").value;
			  formData.manager = document.getElementById("manager").value;

			  axios.post("http://localhost:8080/wangbo/dept/insert?",formData).then(
			  		function (resp) {
						if (resp.data == "success"){
							location.href = "http://localhost:8080/wangbo/dept/findAll"
						}
					}
			  )
		  }

	  </script>

  </head>
  
  <body>
    	<form action="${pageContext.request.contextPath}/dept/insert">
   	
   	<table id = "deptEditTable">
   		<tr>
   			<td>部门编号:</td>
   			<td><input type = "text" name="deptNo" id="deptNo"/></td>
   		</tr>
   		<tr>
   			<td>部门名称:</td>
   			<td><input type = "text" name="deptName" id="deptName"/></td>
   		</tr>  

   		<tr>
   			<td>部门位置:</td>
   			<td><input type = "text" name="deptLocation" id="deptLocation"/></td>
   		</tr>  

   		<tr>
   			<td>部门负责人:</td>
   			<td><input type = "text" name="manager" id="manager"/></td>
   		</tr>  
   		
   		<tr>
   			<td colspan="2">
   				<input type = "submit" value="添加" onclick="add()"/>
   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/dept/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
