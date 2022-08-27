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
    
    <title>角色修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	  <script>

		  function changeRole(roleId) {
			  var formData = {
				  id:roleId,
				  t_role_name:'',
			  }

			  formData.t_role_name = document.getElementById("t_role_name").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/role/change?",
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
  <body>
  <form action="">
    	<table>
    	<tr><td>角色ID:</td><td>${role.id}</td></tr>
    	<tr><td>角色名称:</td>
    		<td><select name="t_role_name" id="t_role_name" >
    				<option>${role.t_role_name}</option>
    				<c:forEach items="${userRole}" var="userRole">
					<option>${userRole.t_role_name}</option>
					</c:forEach>		
    			</select></td></tr>

    	<tr><td><input type="button" value="修改" onclick="changeRole('${role.id}')"/>
    			<a href="${pageContext.request.contextPath}/role/findAll" target="contentPage">
				<input type="button" value="返回">
				</a></td><td></td></tr>
    	
    	</table>
  </form>
  </body>
</html>
