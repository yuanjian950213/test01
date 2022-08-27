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
    	<tr><td>报销编号:</td><td>${dispatch.dispatchNo }</td></tr>
    	<tr><td>申 请 人:</td><td>${dispatch.dispatchUser }</td></tr>
    	<tr><td>报销类型:</td><td>${dispatch.dispatchType }</td></tr>
    	<tr><td>摘   要:</td><td>${dispatch.dispatchDetails }</td></tr>
    	<tr><td>金   额:</td><td>${dispatch.dispatchMoney }</td></tr>
    	<tr><td>申请时间:</td><td>${dispatch.dispatchStime }</td></tr>
    	<tr><td>申请状态:</td><td>${dispatch.dispatchStatus }</td></tr>
    	<tr><td><a href="${pageContext.request.contextPath}/dispatch/findAll" target="contentPage">
				<input type="button" value="返回">
				</a></td><td></td></tr>
    	
    	</table>
  </body>
</html>
