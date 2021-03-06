﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>后台管理</title>
</head>
<body>
<%@include file="common.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<%@include file="top.jsp" %>
			<div class="table-responsive show-ke" id="content0" style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account }">
	<div class="content container list_main clearfix">
		<form action="addTeacher" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<td><label>老&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师</label></td>
				<td><input type="text" name="tName" placeholder="张三"/></td>
			</tr>
			<tr>
				<td><label>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label></td>
				<td><input type="password" name="password" /></td>
			</tr>
			<tr>
				<td><label>签&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label></td>
				<td><input type="text" name="sign"/></td>
			</tr>
			<tr>
				<td><label>描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述</label></td>
				<td><textarea rows="5" cols="30" name="describle"></textarea></td>
			</tr>
			<tr>
				<td><label>头 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;像</label></td>
				<td><input type="file" name="cover" placeholder="上传图片大小推荐：255*144"/></td>
			</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="发布"/></td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
	<c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$("#nav-addTeacher").addClass("active");
})
</script>

</body>
</html>
