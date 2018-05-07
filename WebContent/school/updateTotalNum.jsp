<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程专区</title>
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<style type="text/css">
.t1 {
	clear: both;
	border: 1px solid #c9dae4;
}

.t1 tr th {
	color: #0d487b;
	line-height: 28px;
	border-bottom: 1px solid #9cb6cf;
	border-top: 1px solid #e9edf3;
	font-weight: normal;
	text-shadow: #e6ecf3 1px 1px 0px;
	padding-left: 5px;
	padding-right: 5px;
}

.t1 tr td {
	border-bottom: 1px solid #e9e9e9;
	padding-bottom: 5px;
	padding-top: 5px;
	color: #444;
	border-top: 1px solid #FFFFFF;
	padding-left: 5px;
	padding-right: 5px;
	word-break: break-all;
}
/* white-space:nowrap; text-overflow:ellipsis; */
tr.alt td {
	background: #ecf6fc; /*这行将给所有的tr加上背景色*/
}

tr.over td {
	background: #bcd4ec; /*这个将是鼠标高亮行的背景色*/
}

td a {
	color: red;
}
</style>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript">
	function getCourseList() {
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
								course += "<tr align='center'><td><a href='updateCourseNum.jsp?id="+obj.id+"&name="+obj.title+"&num="+obj.totalNum+"'>选择</a></td><td>"
										+ obj.title
										+ "</td><td>"
										+ obj.totalNum + "</td></tr>";
							}
							$("#list").append(course);
							var pa = data.demandListSize;
							for(var j = 0; j <pa;j++ ){
								var o = data.demandList[j];
								course1 += "<tr align='center'><td><a href='updateDemandNum.jsp?id="+o.id+"&name="+o.title+"&num="+o.totalNum+"'>选择</a></td><td>"
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
</script>
</head>
<body onload="getCourseList()">
	<%@include file="nav2.jsp"%>
	<c:if test="${not empty account }">
	<div style="width: 60%; margin: 0 auto;">
		<table width="100%" id="ListArea" border="0" class="t1" align="center"
			cellpadding="0" cellspacing="0" class="table table-striped">
			<thead>
				<tr>
					<th>选择</th>
					<th>课程名称</th>
					<th>已购人数</th>
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
</body>
</html>