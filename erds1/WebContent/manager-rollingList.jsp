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
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>序号</th><th>链接</th><th>图片</th><th>优先级</th><th>操作</th>
				</tr>
			</thead>
			<tbody id="list">
			
			</tbody>
		</table>
		<a href="javascript:;" onclick="update()">修改优先级</a>
	</div>
	</c:if>
	
	 <c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
			</div>
		</div>
	</div>

<script type="text/javascript">
function init(){
	
	var courseList1 = "";
	$.ajax({
			url : "allRolling",
			type : "POST",
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];
						courseList1+="<tr><td id='id"+i+"'>"+obj.id+"</td><td>"+obj.href+"</td><td>"+obj.coverimg+"</td><td><input type='text' value='"+obj.cid+"' id='cid"+i+"'></td><td><a href='delRolling?id="+obj.id+"'>删除</a></td></tr>";
					}
				}
				$("#list").append(courseList1);
			},
			dataType : "json"
		});

}
	
	function update(){
		var id1 = $("#id0").html();
		var cid1 = $("#cid0").val();
		var id2 = $("#id1").html();
		var cid2 = $("#cid1").val();
		var id3 = $("#id2").html();
		var cid3 = $("#cid2").val();
		var id4 = $("#id3").html();
		var cid4 = $("#cid3").val();
		var id5 = $("#id4").html();
		var cid5 = $("#cid4").val();
		$.ajax({
			url : "upRoll",
			type : "POST",
			data : "id1="+id1+"&cid1="+cid1+"&id2="+id2+"&cid2="+cid2+"&id3="+id3+"&cid3="+cid3+"&id4="+id4+"&cid4="+cid4+"&id5="+id5+"&cid5="+cid5,
			success : function(data) {
				if (data.code == 200) {
					alert("修改成功!");
				}
			},
			dataType : "json"
		});
	}
	$(function(){
		$("#nav-rollingList").addClass("active");
		init();
	})
</script>
</body>
</html>
