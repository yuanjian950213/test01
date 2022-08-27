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
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	
	function del(obj){
			var result = window.confirm("确认要删除吗?");
			if(true == result){
				alert("开始删除");
				location.href="${pageContext.request.contextPath}/dispatch/del/"+obj;
				
			}
		}

	function findNewOne(dispatchNo) {
		var formData = {
			dispatchNo:dispatchNo,
		}

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/dispatch/findNewOne?",
			data:JSON.stringify(formData),
			contentType:"application/json;charset=utf-8",
			success:function (resp) {
				if (resp == "success"){
					window.location.href = "http://localhost:8080/wangbo/pages/dispatch/dispatchEdit.jsp"
				}
			}
		})

	}

	function finddetailedOne(dispatchNo) {
		var formData = {
			dispatchNo:dispatchNo,
		}

		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/dispatch/finddetailedOne?",
			data:JSON.stringify(formData),
			contentType:"application/json;charset=utf-8",
			success:function (resp) {
				if (resp == "success"){
					window.location.href = "http://localhost:8080/wangbo/pages/dispatch/dispatchDetail.jsp"
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
	
	
	</script>
  </head>
  
  <body>
         	<h1 class="title">首页  &gt;&gt;报销管理 </h1><br/>
         	<form action="${pageContext.request.contextPath}/dispatch/findOne">
	         	<table>
	         		<tr>
		         		<td>
		         		报销类型:<select id="dispatchType" name="dispatchType">
		         					 <option>请选择类型</option>
					         		 <c:forEach items="${configdispatchtypeList}" var="type">
						   			 <option>${type.configValue }</option>
						   			 </c:forEach>
	   						</select>
	   					报销状态:<select id="dispatchStatus" name="dispatchStatus">
		         					 <option>请选择状态</option>
					         		 <c:forEach items="${configdispatchStatusList}" var="status">
						   			 <option>${status.configValue }</option>
						   			 </c:forEach>
	   						</select>
		         		<input type="button" value="查询" onclick="findOne()" />
		         		</td>
	         		</tr>	         	
	         	</table>
         	</form>
         	
         	<div class="add">
         		<a href="${pageContext.request.contextPath}/dispatch/saveUi" target="contentPage"><img alt="新建报销" src="images/add.png" width="18px" height="18px">申请报销</a>
         	</div>
         	
         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>报销编号</td>
         			<td>申请人</td>
         			<td>报销类型</td>
         			<td>金额</td>
         			<td>申请时间</td>
         			<td>申请状态</td>
         			<td>操作列表</td>
         		</tr>

    			<c:forEach items="${dispatchList}" var="dispatch">
    				<tr>
    				<td>${dispatch.dispatchNo}</td>
         			<td>${dispatch.dispatchUser}</td>
         			<td>${dispatch.dispatchType}</td>
         			<td>${dispatch.dispatchMoney}</td>
         			<td>${dispatch.dispatchStime}</td>
					<td>${dispatch.dispatchStatus}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${dispatch.dispatchNo}')">
         				<img alt="" src="images/edit.png" class="operateImg" onclick="findNewOne('${dispatch.dispatchNo}')"  >
         				<img alt="" src="images/detail.png" class="operateImg" onclick="finddetailedOne('${dispatch.dispatchNo}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
          		          		     		         	
         	</table>
  </body>
</html>
