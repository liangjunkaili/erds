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
	var data="";
	if(code.indexOf("c")!=-1){
		data="type="+code;
	}else{
		var e = "b1";
		var s = "s1";
		code = parseInt(code);
		switch (code) {
		case 11:
			e = "b1";
			s = "s1";
			break;
		case 12:
			e = "b1";
			s = "s2";
			break;
		case 13:
			e = "b1";
			s = "s3";
			break;
		case 14:
			e = "b1";
			s = "s4";
			break;
		case 21:
			e = "b2";
			s = "s1";
			break;
		case 22:
			e = "b2";
			s = "s2";
			break;
		case 23:
			e = "b2";
			s = "s3";
			break;
		case 24:
			e = "b2";
			s = "s4";
			break;
		case 31:
			e = "b3";
			s = "s1";
			break;
		case 32:
			e = "b3";
			s = "s2";
			break;
		case 33:
			e = "b3";
			s = "s3";
			break;
		case 34:
			e = "b3";
			s = "s4";
			break;
		case 41:
			e = "b4";
			s = "s1";
			break;
		case 42:
			e = "b4";
			s = "s2";
			break;
		case 43:
			e = "b4";
			s = "s3";
			break;
		case 44:
			e = "b4";
			s = "s4";
			break;
		case 51:
			e = "b5";
			s = "s1";
			break;
		case 52:
			e = "b5";
			s = "s2";
			break;
		case 53:
			e = "b5";
			s = "s3";
			break;
		case 54:
			e = "b5";
			s = "s4";
			break;
		}
		data = "bigType=" + e + "&smallType=" + s;
	}
	
	var courseList = "";
	$.ajax({
			url : "getMoreCourses",
			type : "POST",
			data : data,
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];
						
						var newTime = new Date(obj.beginTime.time);
						var endTime = new Date(obj.endTime.time);
						var cTime = subDate(obj.beginTime);
						if(obj.dd==1){
							if(obj.price==0){
								courseList += "<div class='list_course_show'>"
									+ "<a href='detail2.jsp?cid="
									+ obj.id
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
									+ "</div></a>"
									+ "<ul class='sell_status box_sizing'>"
									+ "<li class='course_sell_price'>"
									+ "<div class='float_right course_price'>RMB <span>"
									+ obj.price
									+ "</span></div></li>"
									+ "<li>"
									+ "<input type='text'style='display: none' class='sellEnd' value='1469894340000' />"
									+ "<div class='float_left surplus'><span>"
									/* +obj.oprice */
									+ "</span></div></li></ul></div>"
							}else{
								courseList += "<div class='list_course_show'>"
									+ "<a href='detail2.jsp?cid="
									+ obj.id
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
									+ "</div></a>"
									+ "<ul class='sell_status box_sizing'>"
									+ "<li class='course_sell_price'>"
									+ "<div class='float_left'>已购"
									+ obj.totalNum
									+ "人</div>"
									+ "<div class='float_right course_price'>RMB <span>"
									+ obj.price
									+ "</span></div></li>"
									+ "<li><div class='float_right course_price' style='text-decoration: line-through;color:gray;'>RMB <span>"
									+obj.oprice
									+ "</span></div></li></ul></div>"
							}
						}else{
							courseList += "<div class='list_course_show'>"
								+ "<a href='detail.jsp?cid="
								+ obj.id
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
				}
				$("#j-all-data-con").append(courseList);
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
</body>
</html>