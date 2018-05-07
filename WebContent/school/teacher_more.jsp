<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更多</title>
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/web/course/list_f1001bb.css~v=1.2.0.css" />
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript">
function listteacher() {
	var data = "{}";
	
	var teacherList = "";
	$.ajax({
			url : "queryTeacher",
			type : "POST",
			data : 'data=' + data,
			success : function(data) {
				if (data.code == 200) {
					var teacherSize = data.size;
					for (var j = 0; j < teacherSize; j++) {
						var obj1 = data.list[j];
						teacherList += "<li class='lector f-fl f-pr' ><a href='teacher_show.jsp?cid="+obj1.tid+"' class='head' data-index='1' data-name='"+obj1.tName+"' title='"+obj1.tName+"'>"
								+ "<img class='' id='' src='"+obj1.headimg+"' width='224' height='224' alt='teacher.name'>"
								+ "<h3 class='f-pa f-fcf info f-thide'>"
								+ "<span class='name'>"
								+ obj1.tName
								+ "</span><span class='title'>"
								/* + "____"
								+ obj1.sign */
								+ "</span>"
								+ "</h3>" + "</a></li>";
					}
				}
				$("#j-recteachers").append(teacherList);
			},
			dataType : "json"
		});

}
</script>
<style type="text/css">
	#j-recteachers li{
		list-style: none;
	display: inline-block;
	margin-right: 10px;
	}
</style>
</head>
<body onload="listteacher()">
<%@include file="top1.jsp"%>
	<div class="g-flow" id="j-teacher"
		style="margin-left: 15%; margin-top: 10px;">
		<!-- <div class="u-bar f-cb">
			<a class="f-fl" style="font-size: 20px; font-weight: bold;">名师风采</a>
		</div> -->
		<ul id="j-recteachers" class="m-lectors f-cb">

		</ul>
	</div>
</body>
</html>