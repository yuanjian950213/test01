<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'delete.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
	
		//alert("姓名参数非法，不允许为空");
		var resultCode = ${resultCode};
		//alert(resultCode);
		switch (resultCode){
				case 3000:
				alert("操作成功！");
				location.href = "user.action";
				break;
				case 3001:
				alert("操作失败！稍后在试");
				location.href = "user.action";
				break;
				case 3011:
				alert("验证码错误！");
				location.href = "pages/login.jsp";
				break;
				case 3012:
				alert("用户名不存在！");
				location.href = "pages/login.jsp";
				break;
				case 3013:
				alert("密码错误！");
				location.href = "pages/login.jsp";
				break;
				case 3014:
				alert("已安全退出！");
				location.href = "pages/login.jsp";
				break;
				case 3015:
				alert("员工编号不存在！");
				location.href ="user.action";
				break;
				case 3016:
				alert("员工名不正确！");
				location.href ="user.action";
				break;
		
		}
		
	</script>
	
  </head>
  <body>
  
  </body>
</html>
