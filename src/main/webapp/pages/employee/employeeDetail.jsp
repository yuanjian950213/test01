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
              <td>员工ID:</td>
              <td><input type = "text" name="id" id="id" value="${emp.id}" readonly/></td>
          </tr>
          <tr>
              <td>员工编号:</td>
              <td><input type = "text" name="empNo" id="empNo" value="${emp.empNo}" readonly/></td>
          </tr>
          <tr>
              <td>员工名字:</td>
              <td><input type = "text" name="empName" id="empName" value="${emp.empName}" /></td>
          </tr>

          <tr>
              <td>员工所属部门:</td>
              <td><input type = "text" name="empDept" id="empDept" value="${emp.empDept}" /></td>
          </tr>

          <tr>
              <td>员工性别:</td>
              <td><input type = "text" name="sex" id="sex" value="${emp.sex}" /></td>
          </tr>
          <tr>
              <td>员工入职时间:</td>
              <td><input type = "text" name="createTime" id="entryTime" value="${emp.entryTime}" /></td>
          </tr>
          <tr>
              <td>员工创建时间:</td>
              <td><input type = "text" name="createTime" id="createTime" value="${emp.createTime}" /></td>
          </tr>

          <tr>
              <td colspan="2">
                  <a href="${pageContext.request.contextPath}/employee/findAll" target="contentPage"><input type="button" value="返回"></a>
              </td>
          </tr>
      </table>
  </body>
</html>
