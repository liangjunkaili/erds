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
					<th>头像</th><th>名称</th><th>时间</th><th>内容</th><th>操作</th>
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
	
	var courseList;
	var data = "{'pageIndex':0,'pageSize':100}";	 
	$.ajax({
			url : "getCommentforT",
			type : "POST",
			data : 'data='+data,
			success : function(data) {
				if (data.code == 200) {
					var size = data.size;
					for(var i=0;i<size;i++){
						var obj = data.commentList[i];
						var ctime = obj.time;
						var newTime = new Date(ctime.time);
						courseList+="<tr><td><img alt='' src='"+obj.headimg+"' width='100px;' height='100px;'></td><td>"+obj.nickname+"</td><td>"+newTime.pattern("yyyy-MM-dd") +"</td><td>"+obj.content+"</td><td><a href='delComments?id="+obj.id+"'>删除</a></td></tr>";
					}
					$("#list").append(courseList);
				}
			},
			dataType : "json"
		});

}
$(function(){
	$("#nav-checkComments").addClass("active");
	init();
})
</script>
</body>
</html>
