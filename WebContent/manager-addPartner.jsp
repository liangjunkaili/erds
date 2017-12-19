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
				<c:if test="${not empty account}">
	<div class="content container list_main clearfix">
		<form action="addPartner" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<td><label>公&nbsp;&nbsp;&nbsp;司&nbsp;&nbsp;&nbsp;名&nbsp;&nbsp;&nbsp;字</label></td>
				<td><input type="text" name="pName" placeholder="张三"/></td>
			</tr>
			<tr>
				<td><label>公&nbsp;&nbsp;&nbsp;司&nbsp;&nbsp;&nbsp;链&nbsp;&nbsp;&nbsp;接</label></td>
				<td><input type="text" name="url" placeholder="http://5s-edu.com/"/></td>
			</tr>
			<tr>
				<td><label>L&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;G&nbsp;&nbsp;&nbsp;&nbsp;O</label></td>
				<td><input type="file" name="logo" placeholder="上传图片大小推荐：255*144"/></td>
			</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="发布"/></td>
			</tr>
		</table>
		</form>
	</div>
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>编号</th><th>公司名称</th><th>公司LOGO</th><th>公司网站</th>
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
var list = "";
function init(){
	
	$.ajax({
		url : "queryPartner",
		type : "POST",
		success : function(data) {
			if (data.code == 200) {
				var m = data.size;
				for (var i = 0; i < m; i++) {
					var o = data.list[i];
					list+="<tr><td>"+o.id+"</td><td>"+o.pName+"</td><td>"+o.logo+"</td><td>"+o.selfUrl+"</td></tr>";
				}
				$("#list").append(list);
			}
		},
		dataType : "json"
	});

}
$(function(){
	$("#nav-addPartner").addClass("active");
	init();
})
</script>
</body>
</html>
