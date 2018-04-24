<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<div class="table-responsive show-ke" id="content0"
				style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account }">
					<div>
						<%
							String pwd = request.getParameter("pwd");
							String id = request.getParameter("id");
							String tName = request.getParameter("tName");
						%>
						<form action="upTeacher" method="post"
							enctype="multipart/form-data">
							<table class="table table-striped">
								<tr>
									<td><label>名称</label></td>
									<td><input type="text" name="tName" value="<%=tName%>" /></td>
								</tr>
								<tr>
									<td><label>密码</label></td>
									<td><input type="text" name="password" value="<%=pwd%>"
										placeholder="" /> <input type="hidden" name="id"
										value="<%=id%>" />
								</tr>
								<tr>
									<td><input type="reset" name="" value="重置" /></td>
									<td><input type="submit" name="" value="提交" /></td>
								</tr>
							</table>
						</form>
					</div>
				</c:if>
				<c:if test="${empty account }">
					<h1 align="center">
						请<a href="login_manager.jsp">登录</a>
					</h1>
				</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$("#nav-TeacherList").addClass("active");
})
</script>

</body>
</html>
