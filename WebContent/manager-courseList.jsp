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
			<div>
				<div class="table-responsive show-ke" id="content0"
					style="margin-left: 300px; margin-top: 30px;">
					<c:if test="${not empty account }">
							<table class="table table-striped" id="courseList">
								<tr>
									<td>编号</td>
									<td>标题</td>
									<td>操作</td>
								</tr>
							</table>
					</c:if>
					<c:if test="${empty account }">
						<h1 align="center">
							请<a href="login_manager.jsp">登录</a>
						</h1>
					</c:if>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var courseList = "";
	function init() {
		$(".show-ke").show();
		$(".hide-ke").hide();
		$.ajax({
			url : "live_more",
			type : "POST",
			data : "pageIndex=1&pageSize=1000",
			success : function(data) {
				if (data.code == 200) {
					for (var i = 0; i < data.size; i++) {
						var obj = data.list[i];
						courseList += "<tr><td>"+obj.id+"</td><td>"+obj.title+"</td><td><a href='delCourse?id="+obj.id+"'>删除</a></td></tr>";
					}
					$("#courseList").append(courseList);
				}
			},
			dataType : "json"
		});

	}
	$(function(){
		$("#nav-courseList").addClass("active");
		init();
	})
</script>

</body>
</html>
