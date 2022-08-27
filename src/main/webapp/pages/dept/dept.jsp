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

    <title>部门</title>
    
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
		
		function del(deptNo,deptName){
			var result = window.confirm("确认要删除吗?");
			if(true == result){
				 axios.get("http://localhost:8080/wangbo/dept/selectOneEmployee/"+deptName).then(
						function (resp){
							if (resp.data){
								alert("该部门下还有员工，无法删除");
								location.href="${pageContext.request.contextPath}/dept/findAll/"

							}
							else {
								alert("开始删除");
								location.href="${pageContext.request.contextPath}/dept/del/"+deptNo;
							}
						}
					)
				}
			}
	</script>

	  <script>
		  function findOne(deptNo) {
			  var formData = {
				  deptNo:""
			  }
			  formData.deptNo = deptNo;

			  axios.post("http://localhost:8080/wangbo/dept/findOne?",formData).then(
			  		function (resp) {
						if(resp.data == "success"){
							location.href="http://localhost:8080/wangbo/pages/dept/deptEdit.jsp"
						}
					}
			  )
		  }
	  </script>

	  <script>
		  function finddetailedOne(deptNo) {
			  var formData = {
				  deptNo:""
			  }
			  formData.deptNo = deptNo;

			  axios.post("http://localhost:8080/wangbo/dept/finddetailedOne?",formData).then(
					  function (resp) {
						  if(resp.data == "success"){
							  location.href="http://localhost:8080/wangbo/pages/dept/deptDetail.jsp"
						  }
					  }
			  )
		  }
	  </script>
  </head>
  
  
  <body>
         	<h1 class="title">首页  &gt;&gt;部门管理 </h1>
         	
         	<div class="add">
         		<a href="pages/dept/deptAdd.jsp" target="contentPage"><img alt="" src="images/add.png" width="18px" height="18px">添加部门</a>
         	</div>

         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>部门编号</td>
         			<td>部门名称</td>
         			<td>部门位置</td>
         			<td>部门负责人</td>
         			<td>操作列表</td>
         		</tr>
    			<c:forEach items="${deptList}" var="dept">
    				<tr>
    				<td>${dept.deptNo }</td>
         			<td>${dept.deptName }</td>
         			<td>${dept.deptLocation }</td>
         			<td>${dept.manager }</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${dept.deptNo}','${dept.deptName}')">
						<img alt="" src="images/edit.png" class="operateImg" onclick="findOne('${dept.deptNo}')" >
						<img alt="" src="images/detail.png" class="operateImg" onclick="finddetailedOne('${dept.deptNo}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
         	</table>
  </body>
</html>
