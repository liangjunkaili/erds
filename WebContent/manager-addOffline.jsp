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
				style="margin-left: 300px; margin-top: 30px;">
				<c:if test="${not empty account }">
					<form action="addOffline" method="post"
						enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
								<td><label>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label></td>
								<td><input type="text" name="title" /></td>
							</tr>
							<tr>
								<td><label>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</label></td>
								<td><input type="text" name="price" placeholder="0.00" /></td>
							</tr>
							<tr>
								<td><label>地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址</label></td>
								<td><input type="text" name="address" placeholder="0.00" /></td>
							</tr>
							<tr>
								<td><label>封
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</label></td>
								<td><input type="file" name="cover"
									placeholder="上传图片大小推荐：255*144" /></td>
							</tr>
							<tr>
								<td><label>课程介绍</label></td>
								<td>
									<textarea rows="5" cols="30" name="provide1" placeholder="课程的详细介绍"></textarea> 
										<input type="file" name="provide" />
										<input type="file" name="provide" />
										<input type="file" name="provide" />
								</td>
							</tr>
							<tr>
								<td><input type="reset" name="" value="重置" /></td>
								<td><input type="submit" name="" value="发布" /></td>
							</tr>
						</table>
					</form>
					<table class="table table-striped" id="courseList">
								<tr>
									<td>序列号</td>
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
<script type="text/javascript">
$(function(){
	$("#nav-addOffline").addClass("active");
	
	$.ajax({
  		 url: "/erds/getAllOffline",
  		 type: "POST",
  		 data:'pageIndex='+1+"&pageSize="+1000,
  		 success: function(data){
  			 if(data.code==200){
  				for (var i = 0; i < data.size; i++) {
					var obj = data.list[i];
					courseList += "<tr><td>"+obj.id+"</td><td>"+obj.title+"</td><td><a href='manager-offline-user.jsp?cid="+obj.id+"'>查看报名学生名单</a>||<a href='delOffline?id="+obj.id+"'>删除</a></td></tr>";
				}
				$("#courseList").append(courseList);
  			 }
  		 }
   	});
})
</script>
</body>
</html>
