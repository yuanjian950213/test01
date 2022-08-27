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
    
    <title>报销单修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  	<script type="text/javascript" src="/njwbSystem/js/My97DatePicker/WdatePicker.js"></script>
	  <script src="js/jquery-1.8.3.min.js"></script>
	  <script>
		  function changes() {
			  var formData = {
				  dispatchNo:${dispatch.dispatchNo},
				  dispatchType:"",
				  dispatchDetails:"",
				  dispatchMoney:"",
				  dispatchStatus:"",
			  }

			  formData.dispatchType = document.getElementById("dispatchType").value;
			  formData.dispatchDetails = document.getElementById("dispatchDetails").value;
			  formData.dispatchMoney = document.getElementById("dispatchMoney").value;
			  formData.dispatchStatus = document.getElementById("dispatchStatus").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/dispatch/change?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/dispatch/findAll"
					  }
				  }
			  })
		  }
	  </script>
  </head>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">

	
	
	
	
	
	
	</script>
  <body>
  <form action="">
    	<table>
    	<tr><td>报销编号:</td><td>${dispatch.dispatchNo}</td></tr>
    	<tr><td>申 请 人:</td><td>${dispatch.dispatchUser}</td></tr>
    	<tr><td>报销类型:</td><td><select id="dispatchType" name="dispatchType">
		      				 <option>${dispatch.dispatchType}</option>
			         		 <c:forEach items="${configdispatchtypeList}" var="type">
				   			 <option>${type.configValue}</option>
				   			 </c:forEach>
			   				</select> </td></tr>
    	<tr><td>摘   要:</td><td><textarea id="dispatchDetails" name="dispatchDetails">${dispatch.dispatchDetails }</textarea></td></tr>
    	<tr><td>金   额:</td><td><input type="text" id="dispatchMoney" name="dispatchMoney" value="${dispatch.dispatchMoney }"/></td></tr>
    	<tr><td>申请状态:</td><td><select id="dispatchStatus" name="dispatchStatus">
		         					 <option>${dispatch.dispatchStatus }</option>
					         		 <c:forEach items="${configdispatchStatusList}" var="status">
						   			 <option>${status.configValue }</option>
						   			 </c:forEach>
	   						</select></td></tr>
    	<tr><td><a href="${pageContext.request.contextPath}/dispatch/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
			<input type = "button" value="修改" onclick="changes()"/>
		</td></tr>
    	
    	</table>
  </form>
  </body>
</html>
