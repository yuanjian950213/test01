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
    
    <title>报销单详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script></head>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  <body>
    	<table>
    	<tr><td>用户帐号:</td><td>${user.userAccount }</td></tr>
    	<tr><td>用户的员工编号:</td><td>${user.empNo }</td></tr>
    	<tr><td>账户对应员工名:</td><td>${user.empName }</td></tr>
    	<tr><td>账户对应角色:</td><td>${user.role }</td></tr>
    	<tr><td>帐号状态:</td><td>${user.status }</td></tr>
    	<tr><td>创建时间:</td><td>${user.createTime }</td></tr>
    	<tr><td><a href="${pageContext.request.contextPath}/userRole/findAll" target="contentPage">
				<input type="button" value="返回">
				</a></td><td></td></tr>
    	
    	</table>
  </body>
</html>
