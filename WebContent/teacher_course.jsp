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
function listCourse() {
	//init_a();
	var url = window.location.href;
	var param = url.split("?")[1];
	var code;
	if (param == undefined) {
		code = 0;
	} else {
		code = param.split("=")[1];
	}

	var data = "{'tid':'" + code + "'}";
	
	var courseList = "";
	var demandList = "";
	$.ajax({
			url : "getCoursesForTeacher",
			type : "POST",
			data : 'data=' + data,
			success : function(data) {
				if (data.code == 200) {
					/* for (var i = 0; i < data.demandssize; i++) {
						var o = data.demands[i];
						demandList += "<li class='lector f-fl f-pr'><div class='list_course_show'>"
							+ "<a href='detail2.jsp?cid="
							+ o.id
							+ "' class='course_con' style='background-image: url("
							+ o.coverImg
							+ ");'>"
							+ "<div class='supernatant'></div>"
							+ "<div class='course_show_img box_sizing'>"
							+ "<div class='course_teacher_name'>"
							+ o.tName
							+ "</div>"
							+ "<br>"
							+ "<div class='course_class'>"
							+ o.title
							+ "</div>"
							+ "<div class='course_time'>"
							+ "</div></div></a>"
							+ "<ul class='sell_status box_sizing'>"
							+ "<li class='course_sell_price'>"
							+ "<div class='float_left'>已购"
							+ o.totalNum
							+ "人</div>"
							+ "<div class='float_right course_price'>RMB <span>"
							+ o.price
							+ "</span></div></li>"
							+ "<li>"
							+ "<input type='text'style='display: none' class='sellEnd' value='1469894340000' />"
							+ "<div class='float_left surplus'>"
							+ "</div></li></ul></div></li>"
					} */
					
					 var l = data.coursessize;
					for (var i = 0; i < l; i++) {
						var obj = data.courses[i];
						var newTime = new Date(obj.beginTime.time);
						var endTime = new Date(obj.endTime.time);
						var cTime = subDate(obj.beginTime);

						courseList += "<div class='list_course_show'>"
								+ "<a href='beginCourse?roomId="+obj.roomId+"&uid="+obj.tid+"&username="+obj.tName
								+ "' class='course_con' style='background-image: url("
								+ obj.coverImg
								+ ");'>"
								+ "<div class='supernatant'></div>"
								+ "<div class='course_show_img box_sizing'>"
								+ "<div class='course_teacher_name'>"
								+ obj.tName
								+ "</div>"
								+ "<br>"
								+ "<div class='course_class'>"
								+ courseName(obj.bigType,obj.smallType)
								+ "</div>"
								+ "<div class='course_time'>"
								+ "<span class='schooltime'>"
								+ newTime.pattern("yyyy-MM-dd")
								+ "-"
								+ endTime.pattern("yyyy-MM-dd")
								+ "</span> <spanclass='period'>"
								+ obj.duration
								+ "课时</span>"
								+ "</div></div></a>"
								+ "<ul class='sell_status box_sizing'>"
								+ "<li class='course_sell_price'>"
								+ "<div class='float_left'>已购"
								+ obj.totalNum
								+ "人</div>"
								+ "<div class='float_right course_price'>RMB <span>"
								+ obj.price
								+ "</span></div></li>"
								+ "<li>"
								+ "<input type='text'style='display: none' class='sellEnd' value='1469894340000' />"
								+ "<div class='float_left surplus'><span>"
								+ cTime
								+ "</span></div></li></ul></div>"
					}
				} 
				$("#j-all-data-con").append(courseList);
				/* $("#demandlist").append(demandList); */
			},
			dataType : "json"
		});

}
</script>
</head>
<body onload="listCourse()">
<%@include file="top1.jsp"%>
	<div class="container list_main clearfix" style="margin-top: 10px;">
		<div class="gototop">
			<i id="j-gototop" class="gototop_png" style="display: none"></i>
		</div>
		<div id="j-all-data-con" class="datalist-con clearfix"></div>
	</div>
	<br />
	<!-- <div class="container list_main clearfix" style="margin-top: 10px;">
		<div class="gototop">
			<i id="j-gototop" class="gototop_png" style="display: none"></i>
		</div>
		<div id="demandlist" class="datalist-con clearfix"></div>
	</div> -->
	
</body>
</html>