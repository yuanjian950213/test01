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
    <title>员工明细</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
      <table id = "deptEditTable">
          <tr>
              <td>请假编号:</td>
              <td><input type = "text" name="id" id="id" value="${holiday.holidayNo}" readonly/></td>
          </tr>
          <tr>
              <td>申请人:</td>
              <td><input type = "text" name="empNo" id="empNo" value="${holiday.holidayUser}" readonly/></td>
          </tr>
          <tr>
              <td>请假类型:</td>
              <td><input type = "text" name="empName" id="empName" value="${holiday.holidayType}" /></td>
          </tr>

          <tr>
              <td>请假事由:</td>
              <td><input type = "text" name="empDept" id="empDept" value="${holiday.holidayBz}" /></td>
          </tr>

          <tr>
              <td>开始时间:</td>
              <td><input type = "text" name="sex" id="sex" value="${holiday.startTime}" /></td>
          </tr>
          <tr>
              <td>结束时间:</td>
              <td><input type = "text" name="createTime" id="entryTime" value="${holiday.endTime}" /></td>
          </tr>
          <tr>
              <td>申请状态:</td>
              <td><input type = "text" name="createTime" id="" value="${holiday.holidayStatus}" /></td>
          </tr>
          <tr>
              <td>提交时间:</td>
              <td><input type = "text" name="createTime" id="createTime" value="${holiday.createTime}" /></td>
          </tr>

          <tr>
              <td colspan="2">
                  <a href="${pageContext.request.contextPath}/holiday/findAll" target="contentPage"><input type="button" value="返回"></a>
              </td>
          </tr>
      </table>
  </body>
</html>
