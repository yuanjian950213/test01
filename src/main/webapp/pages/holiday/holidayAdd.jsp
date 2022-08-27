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
	  <script>
		  function addHoliday1() {
			  var formData = {
				  holidayType:"",
				  holidayBz:"",
				  startTime:"",
				  endTime:"",
				  holidayStatus:''
			  }
			  formData.holidayType = document.getElementById("holidayType").value;
			  formData.holidayBz = document.getElementById("holidayBz").value;
			  formData.startTime = document.getElementById("startTime").value;
			  formData.endTime = document.getElementById("endTime").value;
			  formData.holidayStatus = document.getElementById("holidayStatus1").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/holiday/add?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/holiday/findAll"
					  }
				  }
			  })
		  }


		  function addHoliday2() {
			  var formData = {
				  holidayType:"",
				  holidayBz:"",
				  startTime:"",
				  endTime:"",
				  holidayStatus:''
			  }
			  formData.holidayType = document.getElementById("holidayType").value;
			  formData.holidayBz = document.getElementById("holidayBz").value;
			  formData.startTime = document.getElementById("startTime").value;
			  formData.endTime = document.getElementById("endTime").value;
			  formData.holidayStatus = document.getElementById("holidayStatus2").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/holiday/add?",
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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  
  <body>
    	<form action="">
   	
   	<table id = "holidayAddTable">
   	
   		<tr>
   			<td>请假类型:</td>
   			<td><select name="holidayType" id="holidayType" >
   				<option>---请选择---</option>
	   			<c:forEach items="${holidayTypeList}" var="type">
	   			<option>${type.configValue}</option>
	   			</c:forEach>				
   			</select>  
   			</td>		
   		</tr> 
   		<tr>
   			<td>请假事由:</td>
   			<td><textarea name="holidayBz" id="holidayBz"></textarea></td>
   		</tr>  
   		<tr>
   			<td>开始时间:</td>
   			<td><input type = "text" name="startTime" id="startTime" /></td>
   		</tr>  		
   		<tr>
   			<td>结束时间:</td>
   			<td><input type = "text" name="endTime" id="endTime" /></td>
   		</tr>   		
   		<tr>
   			<td colspan="2">
   				<input type = "button" value="草稿" name="holidayStatus" id="holidayStatus1" onclick="addHoliday1()"/>

   				<input type = "button" value="已提交" name="holidayStatus" id="holidayStatus2" onclick="addHoliday2()"/>

   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/holiday/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
