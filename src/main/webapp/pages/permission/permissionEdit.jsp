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
    
    <title>权限修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	  <script>
		  function changePermission(permissionId) {
			  var formData = {
				  id:permissionId,
				  role:'',
				  menu:'',
			  }
			  formData.role = document.getElementById("role").value;
			  formData.menu = document.getElementById("menu").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/permission/change?",
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	
  <body>
  <form action="">
    	<table>
    	<tr><td>角色ID:</td><td>${permissions.roleID}</td></tr>
    	<tr><td>角色名称:</td>
    		<td><select name="role" id="role">
    				<option>${permissions.role}</option>
    				<c:forEach items="${roleList}" var="roleList">
					<option>${roleList.t_role_name}</option>
					</c:forEach>		
    			</select></td></tr>

			<tr><td>菜单ID:</td><td>${permissions.menuID}</td></tr>
			<tr><td>菜单名称:</td>
				<td><select name="menu" id="menu" >
					<option>${permissions.menu}</option>
					<c:forEach items="${menusList}" var="menusList">
						<option>${menusList.t_menu_name}</option>
					</c:forEach>
				</select></td></tr>

    	<tr><td><input type="button" value="修改" onclick="changePermission('${permissions.id}')"/>
    			<a href="${pageContext.request.contextPath}/permission/findAll" target="contentPage">
				<input type="button" value="返回">
				</a></td><td></td></tr>
    	
    	</table>
  </form>
  </body>
</html>
