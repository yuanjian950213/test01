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
    
    <title>员工编辑</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
		body,div,table,tr,td{
			margin: 0px;
			padding: 0px;
		}
	
		#deptEditTable{
			font-size: 15px;
			border-collapse: collapse;
			width: 350px;
		}
		
		#deptEditTable td{
			height: 40px;
		}
	
	</style>
  </head>
  
  <body>
    <form action="${pageContext.request.contextPath}/employee/change">
   	<table id = "deptEditTable">
   		<tr>
   			<td>员工编号:</td>
   			<td><input type = "text" name="empNo" id="empNo" value="${emp.empNo}" readonly/></td>
   		</tr>
   		<tr>
   			<td>员工姓名:</td>
   			<td><input type = "text" name="empName" id="empName" value="${emp.empName}" /></td>
   		</tr>  

   		<tr>
   			<td>员工性别:</td>
   			<td><input type = "text" name="sex" id="sex" value="${emp.sex}" /></td>
   		</tr>  

   		<tr>
   			<td>所属部门:</td>
   			<td><input type = "text" name="empDept" id="empDept" value="${emp.empDept}" /></td>
   		</tr>
		<tr>
			<td>入职时间:</td>
			<td><input type = "text" name="entryTime" id="entryTime" value="${emp.entryTime}" /></td>
		</tr>

		<tr>
   			<td colspan="2">
   				<input type = "submit" value="修改"/>
				<a href="${pageContext.request.contextPath}/employee/findAll" target="contentPage"><input type="button" value="返回"></a>
   			</td>
   		</tr>  	
   	</table>
   	
   	
   	</form>
  </body>
</html>
