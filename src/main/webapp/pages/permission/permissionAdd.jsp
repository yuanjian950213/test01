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
    
    <title>My JSP 'permissionAdd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.8.3.min.js"></script>
	  <script>

		  function addPermissions() {
			  var formData = {
				  role:'',
				  menu:''
			  }

			  formData.role = document.getElementById("role").value;
			  formData.menu = document.getElementById("menu").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/permission/add?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/permission/findAll"
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
			<td>
				角色:<select id="role" name="role">
				<option>请选择</option>
				<c:forEach items="${roleList}" var="role">
					<option>${role.t_role_name }</option>
				</c:forEach>
			</select>
				菜单:<select id="menu" name="menu">
				<option>请选择</option>
				<c:forEach items="${menusList}" var="menus">
					<option>${menus.t_menu_name}</option>
				</c:forEach>
			</select>
			</td>
		</tr>

		<tr>
   			<td colspan="2">
   				<input type = "button" value="添加" onclick="addPermissions()"/>
   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/permission/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
