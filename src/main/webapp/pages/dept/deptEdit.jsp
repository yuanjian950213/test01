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
    
    <title>部门编辑</title>
    
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
    <form action="${pageContext.request.contextPath}/dept/change">
   	<table id = "deptEditTable">
   		<tr>
   			<td>部门编号:</td>
   			<td><input type = "text" name="deptNo" id="deptNo" value="${dept.deptNo}" readonly/></td>
   		</tr>
   		<tr>
   			<td>部门名称:</td>
   			<td><input type = "text" name="deptName" id="deptName" value="${dept.deptName}" /></td>
   		</tr>  

   		<tr>
   			<td>部门位置:</td>
   			<td><input type = "text" name="deptLocation" id="deptLoc" value="${dept.deptLocation}" /></td>
   		</tr>  

   		<tr>
   			<td>部门负责人:</td>
   			<td><input type = "text" name="manager" id="deptMaster" value="${dept.manager}" /></td>
   		</tr>  
   		
   		<tr>
   			<td colspan="2">
   				<input type = "submit" value="修改"/>
				<a href="${pageContext.request.contextPath}/dept/findAll" target="contentPage"><input type="button" value="返回"></a>
   			</td>
   		</tr>  	
   	</table>
   	
   	
   	</form>
  </body>
</html>
