<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>denglu</title>
</head>
<body>
 Welcome!  <shiro:principal/>  
    <br><br>  
      
   <%--  <shiro:hasAnyRoles name="user">  
        <a href="/jsp/user.jsp">User Page</a>  
    </shiro:hasAnyRoles>  
      
    <br><br>  
      
    <shiro:hasAnyRoles name="admin">  
        <a href="/jsp/admin.jsp">Admin Page</a>  
    </shiro:hasAnyRoles>  
      
    <br><br>   --%>
    <a href="/erds/logout.do">Logout</a>
</body>
</html>