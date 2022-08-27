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
	<script>

		function del(userAccount){
			var result = window.confirm("确认要删除吗?");
			if(true == result){
				alert("开始删除");
				location.href="${pageContext.request.contextPath}/userRole/del/"+userAccount;
			}
		}



		function findNewOne(userAccount) {
			var formData = {
				userAccount:userAccount,
			}

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/userRole/findNewOne?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/user/userEdit.jsp"
					}
				}
			})

		}

		function finddetailedOne(userAccount) {
			var formData = {
				userAccount:userAccount,
			}

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/userRole/finddetailedOne?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/user/userDetail.jsp"
					}
				}
			})

		}

		function findOne() {
			var formData = {
				dispatchType:'',
				dispatchStatus:''
			}

			formData.dispatchType = document.getElementById("dispatchType").value;
			formData.dispatchStatus = document.getElementById("dispatchStatus").value;


			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/dispatch/findOne?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/dispatch/dispatch.jsp"
					}
				}
			})

		}


		function selectUser() {
			var formData = {
				userAccount:'',
				status:'',
				role:''
			}

			formData.userAccount = document.getElementById("userAccount").value;
			formData.status = document.getElementById("status").value;
			formData.role = document.getElementById("role").value;


			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/userRole/selectUser?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/user/user.jsp"
					}
				}
			})

		}


		function upPage(pageNum){
			if( pageNum == 0 ){
				alert("已经是第一页了");
			}else{

				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/userRole/findAllPage",
					data:JSON.stringify(pageNum),
					contentType:"application/json;charset=utf-8",
					success:function (resp) {
						if (resp == "success"){
							window.location.href = "http://localhost:8080/wangbo/pages/user/user.jsp"
						}
					}
				})
			}
		}


		function downPage(pageNum){
			if( pageNum == 0){
				alert("已经是最后一页了");
			}else{

				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/userRole/findAllPage?",
					data:JSON.stringify(pageNum),
					contentType:"application/json;charset=utf-8",
					success:function (resp) {
						if (resp == "success"){
							window.location.href = "http://localhost:8080/wangbo/pages/user/user.jsp"
						}
					}
				})
			}
		}
		function pageNo(){
			var pageNum = document.getElementById("pageNum").value;
			if(pageNum!="选择页数"){
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/userRole/findAllPage?",
					data:JSON.stringify(pageNum),
					contentType:"application/json;charset=utf-8",
					success:function (resp) {
						if (resp == "success"){
							window.location.href = "http://localhost:8080/wangbo/pages/user/user.jsp"
						}
					}
				})
			}
		}
	</script>
  </head>
  
  
  <body> 
         	<h1 class="title">首页  &gt;&gt;帐户管理 </h1>
         	<div class="add">
         		<a href="${pageContext.request.contextPath}/userRole/saveUi" target="contentPage"><img alt="" src="images/add.png" width="18px" height="18px">添加账户</a>
         	</div>
         	<div><br/><br/>
         	<form action="${pageContext.request.contextPath}/userRole/selectUser">
	         	<table align="center" id="selectByCon">
	         		<tr>
		         		<td>
		         		帐号:<input type="text" name="userAccount" id="userAccount"/>
		         		状态:<select id="status" name="status">
		         					 <option>请选择</option>
					         		 <c:forEach items="${userConfigList}" var="status">
						   			 <option>${status.configValue}</option>
						   			 </c:forEach>
	   						</select>
   						角色:<select id="role" name="role">
	         					 <option>请选择</option>
				         		 <c:forEach items="${userRoleList}" var="role">
					   			 <option>${role.t_role_name}</option>
					   			 </c:forEach>
   						</select>
		         		<input type="button" value="查询" onclick="selectUser()" />
		         		</td>
	         		</tr>	         	
	         	</table>
         	</form></div><br/>

         	<form action="">
	         	<table align="center" id="selectByPages">
	         		<tr>
	         			<td><input type="button" value="上页" onclick="upPage('${pageInfo.prePage}')"/></td>
	         			<td><select onclick="pageNo()"  name="pageNum" id="pageNum">
	         					<option >第${pageInfo.pageNum}页</option>
	         					<c:forEach items="${pageInfo.navigatepageNums}" var="pagesList">
							   		<option >${pagesList}</option>
							   	</c:forEach>
	         				</select>
	         			</td>
	         			<td><input type="button" value="下页" onclick="downPage('${pageInfo.nextPage}')" /></td>
	         		</tr>      	
	         	</table>       	
         	</form>
			<br/>
         	<table><tr><td>当前页数：<input type="text" id="pageGPS" value="${pageInfo.pageNum}" readonly /></td>
         				<td>最大页数：<input type="text" id="maxPage" value="${pageInfo.pages}" readonly /></td>
         	</tr></table>
         	      	
         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>账号</td>
         			<td>员工姓名</td>
         			<td>状态</td>
         			<td>角色</td>
         			<td>操作列表</td>
         		</tr>
    			
    			<c:forEach items="${userList}" var="user">
    				<tr>
    				<td>${user.userAccount}</td>
         			<td>${user.empName}</td>
         			<td>${user.status}</td>
         			<td>${user.role}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${user.userAccount}')">
         				<img alt="" src="images/edit.png" class="operateImg" onclick="findNewOne('${user.userAccount}')">
         				<img alt="" src="images/detail.png" class="operateImg"onclick="finddetailedOne('${user.userAccount}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
          		          		     		         	
         	</table>
  </body>
</html>
