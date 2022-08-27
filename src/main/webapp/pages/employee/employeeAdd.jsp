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
		  function add() {
			  var formData = {
				  empNo:'',
				  empName:'',
				  sex:'',
				  empDept:'',
				  entryTime:''
			  }

			  formData.empNo = document.getElementById("empNo").value;
			  formData.empName = document.getElementById("empName").value;
			  formData.empDept = document.getElementById("empDept").value;
			  formData.entryTime = document.getElementById("entryTime").value;

				let sex = document.getElementsByName("sex");

			  for (let i = 0; i < sex.length; i++) {
				  if (sex[i].checked){
				  	formData.sex = sex[i].value
				  }
			  }


			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/employee/add",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/employee/findAll"
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
   			<td>员工编号:</td>
   			<td><input type = "text" name="empNo" id="empNo"/></td>
   		</tr>
   		<tr>
   			<td>员工姓名:</td>
   			<td><input type = "text" name="empName" id="empName"/></td>
   		</tr>  

   		<tr>
   			<td>性别:</td>
   			<td align="center">
				<input type ="radio" name="sex" id="sex1"  value="1"/>男
   			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   				<input type ="radio" name="sex" id="sex0" value="0"/>女
			</td>
   		</tr>  

   		<tr>
   			<td>所属部门:</td>
   			<td><select name="empDept" id="empDept" >
   				<option>---请选择部门---</option>
	   			<c:forEach items="${deptList}" var="dept">
	   			<option>${dept.deptName}</option>
	   			</c:forEach>				
   			</select>
   			</td>		
   		</tr>  
   		
   		<tr>
   			<td>入职时间:</td>
   			<td><input type = "text" name="entryTime" id="entryTime" onclick="WdatePicker()"/></td>
   		</tr>  
   		
   		<tr>
   			<td colspan="2">
   				<input type = "button" value="添加" onclick="add()"/>
   				<input type = "reset" value="重置"/>
				<a href="${pageContext.request.contextPath}/employee/findAll" target="contentPage">
				<input type="button" value="返回">
				</a>
   			</td>
   		</tr>  	
   	</table>
	
   	</form>
  </body>
</html>
