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

		function del(roleId){

			var result = window.confirm("确认要删除吗?");

			if(true == result){
				axios.get("http://localhost:8080/wangbo/role/findUser/"+roleId).then(
						function (resp){
							if (resp.data){
								alert("该角色下还有员工，无法删除");
								location.href="${pageContext.request.contextPath}/role/findAll"
							}
							else {
								alert("开始删除");
								location.href="${pageContext.request.contextPath}/role/del/"+roleId;
							}
						}
				)
			}
		}

		function saveUi(roleId) {
			var formData = {
				id:roleId,
			}

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/role/saveUi?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/role/roleEdit.jsp"
					}
				}
			})

		}


	</script>
  </head>
  
  
  <body> 
         	<h1 class="title">首页  &gt;&gt;角色管理</h1>
         	<div class="add">
         		<a href="pages/role/roleAdd.jsp" target="contentPage"><img alt="" src="images/add.png" width="18px" height="18px">添加角色</a>
         	</div>
         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>角色ID</td>
         			<td>角色名称</td>
         			<td>操作列表</td>
         		</tr>
    			
    			<c:forEach items="${roleList}" var="roleList">
    				<tr>
    				<td>${roleList.id}</td>
         			<td>${roleList.t_role_name}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${roleList.id}')">
         				<img alt="" src="images/edit.png" class="operateImg"  onclick="saveUi('${roleList.id}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
         	</table>
  </body>
</html>
