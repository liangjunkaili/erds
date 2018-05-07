<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>更多课程</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" /> <meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" type="image/x-icon" href="" />
	<%@include file="res.jsp" %>
	<link type="text/css" rel="stylesheet" href="./stata/jquery.fileupload-ui_799a92f7.css" />
	<!-- <link type="text/css" rel="stylesheet" href="./stata/org-common_e4312c49.css"/> -->
	<link type="text/css" rel="stylesheet" href="./stata/support_3e733f46.css" />
	<link type="text/css" rel="stylesheet" href="./stata/guide-index_3e961da.css" />
	<link type="text/css" rel="stylesheet" href="./stata/headTemplate_2685fd74.css" />
	<link type="text/css" rel="stylesheet" href="./stata/colpick_1675f31c.css" />
	<link type="text/css" rel="stylesheet" href="./stata/support_3e733f46.css" />
	<link type="text/css" rel="stylesheet" href="./stata/grid-frame_12c65863.css" />
	<link type="text/css" rel="stylesheet" href="./stata/searchComponent_dbc827bd.css" />
	<link type="text/css" rel="stylesheet" href="./stata/courseCenter_3ed3bac6.css" />
	<link href="./css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-1.11.3.min.js"></script>
	<style>
	.grid-cell{position:relative;}
	.pic-over{position:absolute;top:10px;left:10px}
	.pic-over .p1 span{background-color:#FEBC2B;padding:0 5px;margin-left:5px;}
	.pic-over .p2{margin-top:70px;font-size:20px;color:white;font-weight:bold}
	.pic-over .p3{font-size:12px;color:white;margin-top:5px}
	.pic-over .p3 span{margin-left:20px;}
	.pagination>li>a, .pagination>li>span{height:auto}
	</style>
	<script type="text/javascript" src="static/js/common/common.js"></script>
	<script type="text/javascript">
	var index=1;
	function listCourse(pageIndex,pageSize) {
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
			data="type="+code+"&pageIndex="+pageIndex+"&pageSize="+pageSize;
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
			data = "bigType=" + e + "&smallType=" + s+"&pageIndex="+pageIndex+"&pageSize="+pageSize;
		}
		var dianbo="[";
		var json;
		$("#data-list").empty();
		index=pageIndex;
		$.ajax({
				url : "getMoreCourses",
				type : "POST",
				data : data,
				success : function(data) {
					if (data.code == 200) {
						var l = data.size;
						for (var i = 0; i < l; i++) {
							var obj = data.list[i];
							var id = obj.id;
							var href = "kechen.jsp?cid="+id;
							if(obj.dd==2){
								href = "zhibo.jsp?cid="+id;
							}
							var img = obj.coverImg;
							var title = obj.title;
							var tName = obj.tName;
							var type = courseName(obj.bigType,obj.smallType);
							//var Time = new Date(obj.beginTime.time).pattern("yyyy-MM-dd")+'-'+new Date(obj.endTime.time).pattern("yyyy-MM-dd");
							//var duration = obj.duration;
							var price = "RMB:"+obj.price;
							var oprice = "RMB:"+obj.oprice;
							var totalNum = "已购"+obj.totalNum+"人";
							if(obj.price==0){
								price = "免费";
								oprice="";
								totalNum="";
							}
							//var isend = subDate(obj.beginTime);
							var tjk="{'href':'"+href+"','img':'"+img+"','title':'"+title+"','tName':'"+tName+"','type':'"+type+"','time':'"+""+"','duration':'"+""+"','price':'"+price+"','oprice':'"+oprice+"','totalNum':'"+totalNum+"','isend':'"+""+"'},";
							dianbo+=tjk;
						}
						dianbo=dianbo.substring(0,dianbo.length-1);
						dianbo=dianbo+"]";
						json = eval('(' + dianbo + ')');
					}
					$.each(json,function(name,value) {
						var add = '<div class="col-3">\
										<div class="grid-cell hover">\
											<a class="course-pic" href="'+value.href+'" target="_blank">\
												<img class="scale" src="'+value.img+'" />\
											</a>\
											<div class="pic-over" onclick="window.location.href=\''+value.href+'\'; ">\
												<p class="p1"><span>'+value.tName+'</span><p>\
												<p class="p2">'+value.type+'</p>\
												<p class="p3">'+value.time+'<span>'+value.duration+'</span></p>\
											</div>\
											<div class="course-details">\
												<h3 class="course-details-title" title="'+value.title+'">\
													<p>'+value.title+'</p>\
												</h3>\
											</div>\
											<div class="course-data clearfix">\
												<div class="course-price green">'+value.price+'</div>\
												<div class="course-courseware-num">'+value.totalNum+'</div>\
											</div>\
											<div class="course-data clearfix" style="clear:both">\
												<div class="course-price green" style="text-decoration:line-through">'+value.oprice+'</div>\
												<div class="course-courseware-num">'+value.isend+'</div>\
											</div>\
										</div>\
									</div>';
						$("#data-list").append(add);
					});
				},
				dataType : "json"
			});

	}
	function next(){
		index++;
		listCourse(index,12);
	}
	function pre(){
		if(index==1){
			alert("已经是第一页了!")
			return;
		}
		index--;
		listCourse(index,12);
	}
	</script>
</head>
<body onload="listCourse(1,12)">
<%@include file="header.jsp" %>
<div class="content-container clearfix">
	<div class="content-module" style="margin-top:20px;">
		<div class="course-list-wrap   row " id="data-list">
		</div>
	<div class="paginate" style="margin-left:30%">
		<ul class="pagination">
			<li><a href="javascript:;" onclick="pre()">&laquo;</a></li>
			<li><a href="javascript:;" onclick="listCourse(1,12)">1</a></li>
			<li><a href="javascript:;" onclick="listCourse(2,12)">2</a></li>
			<li><a href="javascript:;" onclick="listCourse(3,12)">3</a></li>
			<li><a href="javascript:;" onclick="listCourse(4,12)">4</a></li>
			<li><a href="javascript:;" onclick="listCourse(5,12)">5</a></li>
			<li><a href="javascript:;" onclick="next()">&raquo;</a></li>
		</ul>
	</div>
	</div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
