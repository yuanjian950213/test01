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
    
    <title>添加员工</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script src="js/axios-0.18.0.js"></script>

	<script>
		function addUser() {

			var formData = {
				userAccount:"",
				userPwd:"",
				empNo:"",
				empName:"",
				status:"",
				role:"",
			}

			formData.userAccount = document.getElementById("userAccount").value;
			formData.userPwd = document.getElementById("userPwd").value;
			formData.empNo = document.getElementById("empNo").value;
			formData.empName = document.getElementById("empName").value;
			formData.status = document.getElementById("status").value;
			formData.role = document.getElementById("role").value;

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/userRole/add?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/userRole/findAll"
					}
					else {
						alert('添加失败！员工编码或员工姓名有误！')
						window.location.href = "http://localhost:8080/wangbo/pages/user/userAdd.jsp"
					}
				}
			})
		}
	</script>
  </head>
  <body>


    	<form action="">
   	<table id = "newUserTable">
   		<tr>
   			<td>帐号:</td>
   			<td><input type = "text" name="userAccount" id="userAccount"/></td>
   		</tr>
		<tr>
			<td>密码:</td>
			<td><input type = "text" name="userPwd" id="userPwd"/></td>
		</tr>
   		<tr>
   			<td>员工编号:</td>
   			<td><input type = "text" name="empNo" id="empNo"/></td>
   		</tr>  

   		<tr>
   			<td>员工姓名:</td>
   			<td><input type = "text" name="empName" id="empName"/></td>
   		</tr>  

   		<tr>
   			<td>帐号状态:</td>
   			<td><select name="status" id="status" >
   				<option>请选择</option>
	   			<c:forEach items="${userConfigList}" var="status">
	   			<option>${status.configValue }</option>	   			
	   			</c:forEach>				
   			</select>  
   			</td>		
   		</tr>  
   		<tr>
   			<td>帐号角色:</td>
   			<td><select name="role" id="role" >
   				<option>请选择</option>
	   			<c:forEach items="${userRoleList}" var="role">
	   			<option>${role.t_role_name}</option>
	   			</c:forEach>				
   			</select>  
   			</td>		
   		</tr>
   		
   
   		
   		<tr>
   			<td colspan="2">
   				<input type = "button" value="创建" id="select" onclick="addUser()"/>
   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/userRole/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
