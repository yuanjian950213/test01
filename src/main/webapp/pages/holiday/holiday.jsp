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

	<script type="text/javascript">
		function del(holidayNo,holidayStatus){
			var result = window.confirm("确认要删除吗?");
				if(true == result){
					if (holidayStatus =="草稿"){
						alert("开始删除");
						location.href="${pageContext.request.contextPath}/holiday/del/"+holidayNo;
					}
					else {
						window.confirm("非草稿状态无法删除！");
					}
				}
		}


		function change(holidayNo,holidayStatus){
				if (holidayStatus =="已提交"){
					window.confirm("已提交无法修改！");
				}
				else {
					var formData = {
						holidayNo:holidayNo
					}
					$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/holiday/findNewOne?",
						data:JSON.stringify(formData),
						contentType:"application/json;charset=utf-8",
						success:function (resp) {
							if (resp == "success"){
								window.location.href = "http://localhost:8080/wangbo/pages/holiday/holidayEdit.jsp"
							}
						}
					})
				}
		}

		function finddetailedOne(holidayNo) {
			var formData = {
				holidayNo:holidayNo
			}

			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/holiday/finddetailedOne?",
				data:JSON.stringify(formData),
				contentType:"application/json;charset=utf-8",
				success:function (resp) {
					if (resp == "success"){
						window.location.href = "http://localhost:8080/wangbo/pages/holiday/holidayDetail.jsp"
					}
				}
			})
		}
	</script>

	  <script>
		  function select1() {

			  var formData = {
				  holidayUser:'',
				  holidayType:'',
				  holidayStatus:''
			  }

			  formData.holidayUser = document.getElementById("holidayUser").value;
			  formData.holidayType = document.getElementById("holidayType").value;
			  formData.holidayStatus = document.getElementById("holidayStatus").value;

			  $.ajax({
				  type:"post",
				  url:"${pageContext.request.contextPath}/holiday/select?",
				  data:JSON.stringify(formData),
				  contentType:"application/json;charset=utf-8",
				  success:function (resp) {
					  if (resp == "success"){
						  window.location.href = "http://localhost:8080/wangbo/pages/holiday/holiday.jsp"
					  }
				  }
			  })
		  }
	  </script>


	  <style>
		  td{
			  white-space: nowrap;
		  }
	  </style>
  </head>
  
  
  <body>
         	<h1 class="title">首页  &gt;&gt;请假管理 </h1><br/>
          	<form action="">
	         	<table>
	         		<tr>
		         		<td>
		         		申请人:<input type="text" name="holidayUser" id="holidayUser"/>
		         		请假类型:<select id="holidayType" name="holidayType">
		         					 <option>请选择</option>
					         		 <c:forEach items="${allHolidayType}" var="type">
						   			 <option>${type.configValue}</option>
						   			 </c:forEach>
	   						</select>
	   					申请状态:<select id="holidayStatus" name="holidayStatus">
	   									<option>请选择</option>
					         			<c:forEach items="${allHolidayStatus}" var="status">
						   			 	<option>${status.configValue}</option>
						   			 	</c:forEach>
	   							</select>
		         		<input type="button" value="查询" onclick="select1()" />
		         		</td>
	         		</tr>	         	
	         	</table>
         	</form>    	
         	
         	<div class="add">
         		<a href="${pageContext.request.contextPath}/holiday/saveUi" target="contentPage"><img alt="" src="images/add.png" width="18px" height="18px" onclick="saveUi()">新建假条</a>
         	</div>

         	<table class="deptInfo">
         		<tr class="titleRow">
         			<td>请假编号</td>
         			<td>申请人</td>
         			<td>请假类型</td>
         			<td>开始时间</td>
         			<td>结束时间</td>
         			<td>申请状态</td>
         			<td>提交时间</td>
         			<td>操作列表</td>
         		</tr>
    			
    			<c:forEach items="${holidayList}" var="holiday">
    				<tr>
    				<td>${holiday.holidayNo}</td>
         			<td>${holiday.holidayUser}</td>
         			<td>${holiday.holidayType}</td>
         			<td>${holiday.startTime}</td>
         			<td>${holiday.endTime}</td>
         			<td>${holiday.holidayStatus}</td>
         			<td>${holiday.createTime}</td>
         			<td>
         				<img alt="" src="images/delete.png" class="operateImg" onclick="del('${holiday.holidayNo}','${holiday.holidayStatus}')">
         				<img alt="" src="images/edit.png" class="operateImg" onclick="change('${holiday.holidayNo}','${holiday.holidayStatus}')" >
         				<img alt="" src="images/detail.png" class="operateImg" onclick="finddetailedOne('${holiday.holidayNo}')">
         			</td> 	
         			</tr>		
    			</c:forEach>
          		          		     		         	
         	</table>
  </body>
</html>
