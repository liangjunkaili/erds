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
	<div style="width: 60%;height: 100%;margin-left: 220px;" class="container">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号</th><th>课程名称</th><th>资源路径<th>操作</th>
				</tr>
			</thead>
			<tbody id="list">
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
	
	var url = "";
	var did = <%=request.getParameter("did")%>;
	var courseList1 = "";
	$.ajax({
			url : "getSubject",
			type : "POST",
			data :'did='+did,
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];
						courseList1+="<tr align='center'><td>"+obj.id+"</td><td>"+obj.title+"</td><td>"+obj.videoUrl+"</td><td><a href='delSubject?id="+obj.id+"'>删除</a></td><tr>";
					}
				}
				$("#list").append(courseList1);
			},
			dataType : "json"
		});

}
$(function(){
	$("#nav-DemandList").addClass("active");
	init();
})
</script>

</body>
</html>
