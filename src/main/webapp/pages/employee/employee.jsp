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
    
    <title>My JSP 'employee.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script src="js/axios-0.18.0.js"></script>

	<script type="text/javascript">
	
	function del(obj){
			var result = window.confirm("确认要删除吗?");
			if(true == result){
				alert("即将删除" + obj);
				location.href="${pageContext.request.contextPath}/employee/del/"+obj;
			}
		}
	</script>

	 <script>
		  function findNewOne(empNo) {
			  var formData = {
				  empNo:empNo
			  }
			  axios.post("http://localhost:8080/wangbo/employee/findNewOne?",formData).then(function (resp) {
				  if(resp.data == "success"){
					  location.href="http://localhost:8080/wangbo/pages/employee/employeeEdit.jsp"
				  }
			  })
		  }
	  </script>

	  <script>
		  function finddetailedOne(empNo) {
			  var formData = {
				  empNo:empNo
			  }

			  axios.post("http://localhost:8080/wangbo/employee/finddetailedOne?",formData).then(
					  function (resp) {
						  if(resp.data == "success"){
							  location.href="http://localhost:8080/wangbo/pages/employee/employeeDetail.jsp"
						  }
					  }
			  )
		  }
	  </script>

	  <script>
		  function findOne1() {

			  var formData = {
				  empName:"",
				  empDept:""
			  }

			  formData.empName = document.getElementById("employeeName").value;
			  formData.empDept = document.getElementById("employeeDept").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/employee/findOne",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
				  	if (resp == "success"){
				  		window.location.href = "http://localhost:8080/wangbo/pages/employee/employee.jsp"
					}
				  }
			  })
		  }
	  </script>

  </head>
  
  <body>
         	<h1 class="title">首页  &gt;&gt;员工管理 </h1><br/>
         	<form action="">
	         	<table>
	         		<tr>
		         		<td>
		         		姓名:<input type="text" name="empName" id="employeeName"/>
		         		部门:<select name="empDept" id="employeeDept" >
		         					 <option>请选择部门</option>
					         		 <c:forEach items="${deptList}" var="dept">
						   			 <option>${dept.deptName}</option>
						   			 </c:forEach>
	   						</select>
		         		<input onclick="findOne1()"  type="button" value="查询"/>
		         		</td>
	         		</tr>	         	
	         	</table>
         	</form>
         	
         	<div class="add">
         		<a href="${pageContext.request.contextPath}/employee/saveUi" target="contentPage"><img alt="添加员工" src="images/add.png" width="18px" height="18px">添加员工</a>
         	</div>
         	
         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>员工编号</td>
         			<td>员工姓名</td>
         			<td>员工性别</td>
         			<td>所属部门</td>
         			<td>入职时间</td>
         			<td>操作列表</td>
         		</tr>
    			<c:forEach items="${employeeList}" var="emp">
    				<tr>
    				<td>${emp.empNo}</td>
         			<td>${emp.empName}</td>
         			<td>${emp.sex}</td>
         			<td>${emp.empDept}</td>
         			<td>${emp.entryTime}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${emp.empNo}')">
         				<img alt="" src="images/edit.png" class="operateImg" onclick="findNewOne('${emp.empNo}')">
         				<img alt="" src="images/detail.png" class="operateImg" onclick="finddetailedOne('${emp.empNo}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
          		          		     		         	
         	</table>
  </body>
</html>
