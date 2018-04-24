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
<link rel="stylesheet"
	href="bootstrap/dist/css/bootstrap.min.css" />	
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript">
	var index=1;
function listCourse(pageIndex,pageSize) {
	var courseList = "";
	$.ajax({
			url : "getMoreDemand",
			type : "POST",
			data : "type=c4&pageIndex="+pageIndex+"&pageSize="+pageSize,
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];

						if(obj.isfree==1){
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
								+ "<div class='course_time'>"
								+ "<span class='schooltime'>"
								+ "</div></div></a>"
								+ "<ul class='sell_status box_sizing'>"
								+ "<li class='course_sell_price'>"
								/* + "<div class='float_left'>已购"
								+ obj.totalNum
								+ "人</div>" */
								+ "<div class='float_right course_price'>RMB <span>"
								+ obj.price
								+ "</span></div></li>"
								+ "<li>"
								+ "<input type='text'style='display: none' class='sellEnd' value='1469894340000' />"
								+ "</span></div></li></ul></div>";
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
									+ "<div class='course_time'>"
									+ "<span class='schooltime'>"
									+ "</div></div></a>"
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
									+ "</span>"
									+ "</div></li></ul></div>";
						}
					}
				}
				$("#j-all-data-con").html(courseList);
			},
			dataType : "json"
		});

}
function next(){
	index++;
	courseList="";
	listCourse(index,12);
}
function pre(){
	if(index==1){
		alert("已经是第一页了!")
		return;
	}
	index--;
	courseList="";
	listCourse(index,12);
}
</script>
</head>
<body onload="listCourse(1,12)">
<%@include file="top1.jsp"%>
	<div class="container list_main clearfix" style="margin-top: 10px;">
		<div class="gototop">
			<i id="j-gototop" class="gototop_png" style="display: none"></i>
		</div>
		<div id="j-all-data-con" class="datalist-con clearfix"></div>
		<nav>
		  <ul class="pager">
		    <li class="previous"><a href="javascript:;" onclick="pre()">&larr; 上一页</a></li>
		    <li class="next"><a href="javascript:;" onclick="next()">下一页 &rarr;</a></li>
		  </ul>
		</nav>
	</div>
</body>
</html>