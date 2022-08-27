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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	
	<script>
	
	function del(permissionId){
			var result = window.confirm("确认要删除吗?");
			if(true == result){
				alert("开始删除");
				location.href="${pageContext.request.contextPath}/permission/del/"+permissionId;
			}
		}


	function findNewOne(permissionId) {
		var formData = {
			id:permissionId,
		}

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/permission/findNewOne?",
			data:JSON.stringify(formData),
			contentType:"application/json;charset=utf-8",
			success:function (resp) {
				if (resp == "success"){
					window.location.href = "http://localhost:8080/wangbo/pages/permission/permissionEdit.jsp"
				}
			}
		})

	}

	function findOnePermission() {
		var formData = {
			role:'',
			menu:''
		}

		formData.role = document.getElementById("role").value;
		formData.menu = document.getElementById("menu").value;

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/permission/findOne?",
			data:JSON.stringify(formData),
			contentType:"application/json;charset=utf-8",
			success:function (resp) {
				if (resp == "success"){
					window.location.href = "http://localhost:8080/wangbo/pages/permission/permission.jsp"
				}
			}
		})

	}


	</script>
  </head>
  
  <body>
         	<h1 class="title">首页  &gt;&gt;权限管理 </h1><br/>
         	<form action="${pageContext.request.contextPath}/permission/findOne">
	         	<table>
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
		         		<input type="button" value="查询" onclick="findOnePermission()"/>
		         		</td>
	         		</tr>	         	
	         	</table>
         	</form>
         	
         	<div class="add">
         		<a href="${pageContext.request.contextPath}/permission/saveUi" target="contentPage"><img alt="添加权限" src="images/add.png" width="18px" height="18px">添加权限</a>
         	</div>
         	
         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>角色ID</td>
         			<td>角色名称</td>
         			<td>菜单ID</td>
         			<td>菜单名称</td>
         			<td>操作列表</td>
         		</tr>

    			<c:forEach items="${permissionList}" var="permission">
    				<tr>
    				<td>${permission.roleID}</td>
         			<td>${permission.role}</td>
         			<td>${permission.menuID}</td>
         			<td>${permission.menu}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${permission.id}')">
         				<img alt="" src="images/edit.png" class="operateImg"onclick="findNewOne('${permission.id}')" >
         			</td> 	
         			</tr>		
    			</c:forEach>
          		          		     		         	
         	</table>
  </body>
</html>
