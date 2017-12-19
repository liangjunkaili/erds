<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>温馨提示</title>
</head>
<body style="text-align: center;">
<%@include file="header.jsp" %>
<p style="font-size: 30px;">
温馨提示:<%=request.getSession().getAttribute("message") %></p>
<%@include file="footer.jsp" %>
</body>
</html>