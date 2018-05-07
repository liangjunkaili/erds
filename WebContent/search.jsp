<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索</title>
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
	<script type="text/javascript" src="static/js/common/common.js"></script>
	<style>
	.grid-cell{position:relative;}
	.pic-over{position:absolute;top:10px;left:10px}
	.pic-over .p1 span{background-color:#FEBC2B;padding:0 5px;margin-left:5px;}
	.pic-over .p2{margin-top:70px;font-size:20px;color:white;font-weight:bold}
	.pic-over .p3{font-size:12px;color:white;margin-top:5px}
	.pic-over .p3 span{margin-left:20px;}
	.pagination>li>a, .pagination>li>span{height:auto}
	</style>
<script type="text/javascript">
var index=1;
function search(pageIndex,pageSize){
	<% 
	String name=request.getParameter("title"); 
    %>
	var title = "<%=name%>";
		var courseList = "";
		var dianbo="[";
		var json;
		$("#j-all-data-con").empty();
		$.ajax({
			url : "search",
			type : "POST",
			data : "title="+title+"&pageIndex="+pageIndex+"&pageSize="+pageSize,
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];
						var id = obj.id;
						var href = "kechen.jsp?cid="+id;
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
					$("#j-all-data-con").append(add);
				});
			},
			dataType : "json"
		});
	}
function next(){
	index++;
	search(index,12);
}
function pre(){
	if(index==1){
		alert("已经是第一页了!")
		return;
	}
	index--;
	search(index,12);
}
</script>
</head>
<body onload="search(1,12)">
<%@include file="header.jsp"%>
	<div class="container list_main clearfix">
		<div class="gototop">
			<i id="j-gototop" class="gototop_png" style="display: none"></i>
		</div>
		<div id="j-all-data-con" class="datalist-con clearfix"></div>
	</div>
	<div class="paginate" style="margin-left:50%">
		<ul class="pagination">
			<li><a href="javascript:;" onclick="pre()">&laquo;</a></li>
			<!-- <li><a href="javascript:;" onclick="search(1,12)">1</a></li>
			<li><a href="javascript:;" onclick="search(2,12)">2</a></li>
			<li><a href="javascript:;" onclick="search(3,12)">3</a></li>
			<li><a href="javascript:;" onclick="search(4,12)">4</a></li>
			<li><a href="javascript:;" onclick="search(5,12)">5</a></li> -->
			<li><a href="javascript:;" onclick="next()">&raquo;</a></li>
		</ul>
	</div>
		<%@include file="footer.jsp" %>
	
</body>
</html>