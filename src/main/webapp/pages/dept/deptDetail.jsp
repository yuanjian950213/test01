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
    <title>部门明细</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->

  </head>
  
  <body>
      <table id = "deptEditTable">
          <tr>
              <td>部门ID:</td>
              <td><input type = "text" name="id" id="deptId" value="${dept.id}" readonly/></td>
          </tr>
          <tr>
              <td>部门编号:</td>
              <td><input type = "text" name="deptNo" id="deptNo" value="${dept.deptNo}" readonly/></td>
          </tr>
          <tr>
              <td>部门名称:</td>
              <td><input type = "text" name="deptName" id="deptName" value="${dept.deptName}" /></td>
          </tr>

          <tr>
              <td>部门位置:</td>
              <td><input type = "text" name="deptLocation" id="deptLoc" value="${dept.deptLocation}" /></td>
          </tr>

          <tr>
              <td>部门负责人:</td>
              <td><input type = "text" name="manager" id="deptMaster" value="${dept.manager}" /></td>
          </tr>
          <tr>
              <td>部门创建时间:</td>
              <td><input type = "text" name="createTime" id="createTime" value="${dept.createTime}" /></td>
          </tr>

          <tr>
              <td colspan="2">
                  <a href="${pageContext.request.contextPath}/dept/findAll" target="contentPage"><input type="button" value="返回"></a>
              </td>
          </tr>
      </table>
  </body>
</html>
