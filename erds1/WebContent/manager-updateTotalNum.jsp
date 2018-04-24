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
			<div class="table-responsive show-ke" id="content0" style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account }">
	<div >
		<table class="table table-striped">
			<thead>
				<tr>
					<th align="center">选择</th>
					<th align="center">课程名称</th>
					<th align="center">已购人数</th>
				</tr>
			</thead>
			<tbody id="list">
			<tbody id="list1">
			</tbody>
		</table>
	</div>
	</c:if>
	<c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
var courseList = "";
var data = "{}";
function init(){
	var data = "{'pageIndex':0,'pageSize':20}";
	var course = "";
	var course1 = "";
	$
			.ajax({
				url : "manGetCourses",
				type : "POST",
				data : 'data=' + data,
				success : function(data) {
					if (data.code == 200) {
						var p = data.size;
						for (var i = 0; i < p; i++) {
							var obj = data.list[i];
							course += "<tr ><td><a href='manager-updateCourseNum.jsp?id="+obj.id+"&name="+obj.title+"&num="+obj.totalNum+"'>选择</a></td><td>"
									+ obj.title
									+ "</td><td>"
									+ obj.totalNum + "</td></tr>";
						}
						$("#list").append(course);
						var pa = data.demandListSize;
						for(var j = 0; j <pa;j++ ){
							var o = data.demandList[j];
							course1 += "<tr><td><a href='manager-updateDemandNum.jsp?id="+o.id+"&name="+o.title+"&num="+o.totalNum+"'>选择</a></td><td>"
							+ o.title
							+ "</td><td>"
							+ o.totalNum + "</td></tr>";
						}
						$("#list1").append(course1);
					}
				},
				dataType : "json"
			});

}
$(function(){
	$("#nav-updateTotalNum").addClass("active");
	init();
})
</script>

</body>
</html>
