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
				<c:if test="${not empty account}">
					<div class="content container list_main clearfix">
						<div>
							<table class="table table-striped">
								<thead>
									<tr>
										<th>编号</th>
										<th>课程名称</th>
										<th>主讲人</th>
										<th>操作</th>
										<th>课节情况</th>
									</tr>
								</thead>
								<tbody id="list">
								</tbody>
							</table>
						</div>
					</div>
						<!-- <div>
						<a href="javascript:;" onclick="pre()">上一页</a><a href="javascript:;" onclick="next()">下一页</a>
					</div> -->
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
	var courseList = "";
	var index=1;
	function init(pageIndex,pageSize) {
		$.ajax({
					url : "getMoreDemand",
					type : "POST",
					data : "type=c1&pageIndex="+pageIndex+"&pageSize="+pageSize,
					success : function(data) {
						if (data.code == 200) {
							var l = data.size;
							for (var i = 0; i < l; i++) {
								var obj = data.list[i];
								courseList += "<tr><td>"
										+ obj.id
										+ "</td><td>"
										+ obj.title
										+ "</td><td>"
										+ obj.tName
										+ "</td><td><a href='manager-addSubject.jsp?did="
										+ obj.id+"&title1="+ obj.title
										+ "'>添加课时</a>|<a href='delDemand?id="+obj.id+"'>删除</a>|<a href='manager-updateDemand.jsp?id="+obj.id+"'>编辑</a></td><td><a href='manager-SubjectList.jsp?did="
										+ obj.id + "'>" + obj.state
										+ "</a></td></tr>";
							}
						}
						$("#list").append(courseList);
					},
					dataType : "json"
				});

	}
	function next(){
		index++;
		courseList="";
		init(index,20);
	}
	function pre(){
		index--;
		courseList="";
		init(index,20);
	}
	$(function(){
		$("#nav-DemandListc1").addClass("active");
		init(1,1000);
	})
</script>
</body>
</html>
