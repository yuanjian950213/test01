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
	  <script src="js/jquery-1.8.3.min.js"></script>
	  <script>
		  function changes() {
			  var formData = {
				  holidayNo:"",
				  holidayUser:"",
				  holidayType:"",
				  holidayBz:"",
				  startTime:"",
				  endTime:""
			  }

			 formData.holidayNo = document.getElementById("holidayNo").value;
			 formData.holidayUser = document.getElementById("holidayUser").value;
			 formData.holidayType = document.getElementById("holidayType").value;
			 formData.holidayBz = document.getElementById("holidayBz").value;
			 formData.startTime = document.getElementById("startTime").value;
			 formData.endTime = document.getElementById("endTime").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/holiday/change?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/holiday/findAll"
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
			<td>报销编号:</td>
			<td><input type = "text" name="holidayNo" id="holidayNo" value="${holiday.holidayNo}" readonly/></td>
		</tr>
		<tr>
			<td>报销申请人:</td>
			<td><input type = "text" name="holidayUser" id="holidayUser" value="${holiday.holidayUser}" readonly/></td>
		</tr>
		<tr>
			<td>报销类型:</td>
			<td><select id="holidayType" name="holidayType">
				<option>${holiday.holidayType}</option>
				<c:forEach items="${holidayTypeList}" var="type">
					<option>${type.configValue}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
   			<td>请假事由:</td>
   			<td><input type = "text" name="holidayBz" id="holidayBz" value="${holiday.holidayBz}" /></td>
   		</tr>  

   		<tr>
   			<td>开始时间:</td>
   			<td><input type = "text" name="startTime" id="startTime" value="${holiday.startTime}" /></td>
   		</tr>  

   		<tr>
   			<td>结束时间:</td>
   			<td><input type = "text" name="endTime" id="endTime" value="${holiday.endTime}" /></td>
   		</tr>  
   		
   		<tr>
   			<td colspan="2">
   				<input type = "button" value="修改" onclick="changes()"/>
				<a href="${pageContext.request.contextPath}/holiday/findAll" target="contentPage"><input type="button" value="返回"></a>
   			</td>
   		</tr>  	
   	</table>
   	
   	
   	</form>
  </body>
</html>
