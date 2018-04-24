<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" id="WebViewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>鄂尔多斯名师课堂</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link type="image/x-icon" rel="shortcut icon" href="/images/ordosmskt.ico" />
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
<link href="css/zzsc.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="static/js/common/common.js"></script>
<style type="text/css">
.g-flow {
	width: 975px;
	margin: 0 auto;
	text-align: left;
}
.f-cb:after, .f-cbli li:after {
	display: block;
	clear: both;
	visibility: hidden;
	height: 0;
	overflow: hidden;
	content: ".";
}
.f-cb, .f-cbli li {
	zoom: 1;
}
.f-fl {
	float: left;
}
.u-more {
	display: block;
	font-size: 0;
	margin-top: 4px;
}
.u-more span {
	display: inline-block;
	float: left;
	height: 20px;
	line-height: 20px;
	font-size: 13px;
	color: #666;
}
.u-more:hover span {
	color: #10ae58;
}
.f-fr {
	float: right;
}
.g-container {
	margin-left: -20px;
	position: relative;
	z-index: 0;
}
.g-container .g-cell {
	width: 225px;
	margin-left: 20px;
	float: left;
}
.f-cb:after, .f-cbli li:after {
	display: block;
	clear: both;
	visibility: hidden;
	height: 0;
	overflow: hidden;
	content: ".";
}
.f-cb, .f-cbli li {
	zoom: 1;
}
.x-zoomImg {
	overflow: hidden;
}
.x-zoomImg img {
	vertical-align: middle;
	-moz-transition: all 1s ease 0s;
	-o-transition: all 1s ease 0s;
	-webkit-transition: all 1s ease 0s;
	transition: all 1s ease 0s;
}
.x-zoomImg img:hover {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-ms-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
}
.uisprite, .u-rating .star, .u-cover .continue .goImg, .u-cover .thumb .hot,
	.u-cover.u-index-plan .planflag, .u-popular-cover .wrap .info .cnt .icon,
	.u-courseHead a.cmEdit, .u-card .card.onlearn .status span.ic,
	.u-recommendCourse .enroll .hot {
	background:
		url(../res/images/ui/ui_sprite.png?1367c4a3031b72bbecf3674702d4f731)
		no-repeat 4449px 4449px;
}
.u-courseMark, .u-cover .publicStatus, .u-cover .exclusive, .u-mocCover .over,
	.u-mocCover .time {
	background:
		url(../res/images/ui/courseMark_sprite.png?1b8af89368a8b2fd984b82a05216b60c)
		9999px 9999px no-repeat;
}
.u-cover {
	position: relative;
	width: 225px;
	height: 225px;
	float: left;
	margin: 0 0 30px 20px;
	background-color: #fff;
}
.u-cover .recommend {
	display: none;
}
.u-cover .wrap {
	width: 100%;
	height: 100%;
	display: block;
	position: relative;
}
.u-cover .continue .progs {
	background: #ccc;
	height: 4px;
	width: 100%;
}
.u-cover .continue .progs div {
	height: 100%;
	background: #10ae58;
}
.u-cover .continue h4 {
	display: block;
	color: #666;
	font-size: 12px;
	width: 100%;
	max-width: 219px;
	padding: 5px 2px;
	background-color: #f8f8f8;
	border-bottom: 1px solid #e7e7e7;
}
.u-cover .continue .goOnArea {
	margin-top: 15px;
	text-align: center;
	vertical-align: middle;
}
.u-cover .continue .goTxt {
	display: inline;
	font: normal 14px '微软雅黑';
}
.u-cover .continue .goImg {
	height: 22px;
	width: 22px;
	vertical-align: middle;
	background-position: -49px -389px;
}
.u-cover .sign {
	padding: 0 4px;
	height: 20px;
	position: absolute;
	top: -25px;
	right: 0;
	background: #999;
	background: rgba(0, 0, 0, 0.5);
	color: white;
	line-height: 20px;
	text-align: center;
	font-size: 12px;
	z-index: 10;
}
.u-cover .foxconn {
	right: 56px;
}
.u-cover .foxconn2 {
	background: rgba(1, 74, 170, 0.5);
}
.u-cover .img {
	padding: 1px 1px 0;
	height: 124px;
	width: 223px;
	position: relative;
	*display: inline;
}
.u-cover .pic {
	position: relative;
	overflow: hidden;
	height: 124px;
	width: 100%;
	*display: inline;
}
.u-cover .pic1 {
	position: relative;
	overflow: hidden;
	height: 175px;
	width: 100%;
	*display: inline;
}
.u-cover .pic .live {
	width: 213px;
	height: 30px;
	line-height: 30px;
	font-size: 13px;
	position: absolute;
	left: 0;
	bottom: 0;
	padding: 0 5px;
	color: #fff;
	background-color: #10ae58;
}
.u-cover .pic .imgPic {
	width: 223px;
	height: 124px;
	-moz-transition: all 1s ease 0s;
	-o-transition: all 1s ease 0s;
	-webkit-transition: all 1s ease 0s;
	transition: all 1s ease 0s;
}
.u-cover .pic .imgPic1 {
	width: 223px;
	height: 175px;
	-moz-transition: all 1s ease 0s;
	-o-transition: all 1s ease 0s;
	-webkit-transition: all 1s ease 0s;
	transition: all 1s ease 0s;
}
.u-cover .hRed {
	color: #a41f24;
}
.u-cover .hGreen {
	color: #10ae58;
}
.u-cover .tit {
	color: #333;
	padding: 0 5px;
	position: relative;
	margin-top: 5px;
	height: 1.4em;
}
.u-cover .tit1 {
	color: #333;
	padding: 0 5px;
	position: relative;
	margin-top: 55px;
	height: 1.4em;
}
.u-cover .tit h3 {
	line-height: 1.4;
	font-size: 14px;
}
.u-cover .orgName {
	display: block;
	padding: 0 5px;
	line-height: 20px;
	height: 23px;
	color: #999;
	font-family: '微软雅黑';
}
.u-cover .descd {
	-moz-transition: bottom 0.2s ease-out 0s;
	-o-transition: bottom 0.2s ease-out 0s;
	-webkit-transition: bottom 0.2s ease-out 0s;
	transition: bottom 0.2s ease-out 0s;
	position: absolute;
	bottom: -136px;
	right: 0;
	left: 0;
	height: 116px;
	background: #fff;
	z-index: 11;
	padding: 10px 5px;
}
.u-cover .descd .dtit {
	font-size: 14px;
	line-height: 1.4;
	color: #333;
	font-family: '微软雅黑';
}
.u-cover .descd .ddesc {
	font-size: 12px;
	line-height: 1.4;
	color: #999;
	font-family: '微软雅黑';
	max-height: 65px;
	overflow: hidden;
	word-break: break-all;
}
.u-cover .descd .dbtn {
	position: absolute;
	display: block;
	width: 90px;
	height: 24px;
	line-height: 24px;
	color: #fff;
	background-color: #FF6700;
	text-align: center;
	bottom: 10px;
	left: 65px;
}
.u-cover .thumb {
	position: relative;
	padding: 0 5px;
	height: 52px;
}
.u-cover .thumb span {
	color: #999;
}
.u-cover .thumb .cmt {
	float: left;
	line-height: 100%;
}
.u-cover .thumb .hot {
	float: left;
	padding: 0 6px 0 20px;
	color: #999;
	background-position: -55px -350px;
	font-size: 12px;
	border: 1px solid #ddd;
	border-radius: 3px;
}
.u-cover .thumb .desc {
	height: 18px;
	line-height: 18px;
}
.u-cover .thumb .col {
	line-height: 23px;
}
.u-cover .thumb .btn {
	width: 210px;
	position: absolute;
	bottom: 5px;
	left: 7px;
	line-height: 21px;
	font-size: 12px;
}
.u-cover .thumb .btn .normal {
	color: #999;
	height: 21px;
}
.u-cover .thumb .btn .discount {
	color: #bbbbbb;
	text-decoration: line-through;
}
.u-cover .thumb .btn2 .normal {
	color: #ff4000;
}
.u-cover .start, .u-cover .cstart {
	margin: 0 100px;
}
.u-cover .start h3, .u-cover .cstart h3 {
	display: block;
	float: left;
	height: 18px;
	width: 75px;
	font: 16px '微软雅黑';
	background-position: -54px -34px;
}
.u-cover .start div, .u-cover .cstart div {
	float: right;
	height: 18px;
	width: 18px;
	background-position: -2px -32px;
	-webkit-transition: all 300ms linear;
	-moz-transition: all 300ms linear;
	-o-transition: all 300ms linear;
	-ms-transition: all 300ms linear;
	transition: all 300ms linear;
}
.u-cover .mask {
	z-index: 201;
	position: absolute;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
}
.u-cover .mask .delbtn {
	position: absolute;
	width: 32px;
	height: 32px;
	background:
		url(../res/images/ui/courselist_sprite.png?0a4b99138ae51b70c040594a3be43ccb)
		repeat-x 0 -168px;
	top: -12px;
	right: -12px;
	cursor: pointer;
}
.u-cover .cstart {
	margin: 0 90px;
}
.u-cover .cstart h3 {
	background-position: -44px -71px;
}
.u-cover .draft .planInfo {
	margin-top: 40px;
}
.u-cover .planInfo {
	margin: 5px 0 0;
}
.u-cover .planInfo .orgName {
	padding: 0;
}
.u-cover .draftStatus {
	z-index: 200;
	top: 0;
	right: 0;
	color: #fff;
	background: #2c3032;
	line-height: 22px;
	font-size: 12px;
	height: 22px;
	padding: 0 3px;
}
.u-cover .draftStatusTxt {
	color: #d40010;
	text-align: center;
	line-height: 14px;
	display: block;
	height: 14px;
	font-size: 12px;
	margin-bottom: 2px;
}
.u-cover .draftStatusBtn {
	display: block;
	width: 76px;
	width: 76px;
	text-decoration: none;
	background-position: 66px -150px;
	margin: 0 auto;
}
.u-cover .draftStatusBtn span {
	display: block;
	text-align: center;
	padding-left: 10px;
	width: 56px;
	font-size: 12px;
	height: 34px;
	line-height: 33px;
	color: #444;
	background-position: -40px -150px;
}
.u-cover .draftStatusBtn:hover {
	background-position: 66px -200px;
}
.u-cover .draftStatusBtn:hover span {
	background-position: -40px -200px;
}
.u-cover .draftStatusBtn:active {
	background-position: 66px -250px;
}
.u-cover .draftStatusBtn:active span {
	background-position: -40px -250px;
}
.u-cover .publicStatus {top: -1px;left: -2px;z-index: 10;width: 51px;height: 51px;background-position: 0 -80px;z-index: 1;}
.u-cover .exclusive {background-position: -63px -80px;}
.u-cover:hover {-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);}
.u-cover:hover .pic .imgPic {-webkit-transform: scale(1.2);-moz-transform: scale(1.2);-ms-transform: scale(1.2);-o-transform: scale(1.2);transform: scale(1.2);}
.u-cover:hover .btn {color: #fff;background-position: 0 -60px;}
.u-cover:hover .s-fc8 {color: white;}
.u-cover:hover .goImg {background-position: 3px -1182px;}
.u-cover.u-find-cover:hover .descd {bottom: 0;}
.u-cover.u-index-plan .planflag {position: absolute;top: 0px;right: 5px;width: 50px;height: 50px;background-position: -20px -1668px;}
.m-loginbox .wrap {width: 420px;z-index: 100;}
.m-loginbox .wrap .form_content {margin: 0 auto;width: 300px;}
.f-thide {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;-ms-text-overflow: ellipsis;}
.f-dn {display: none;}
.f-fs0 {font-size: 12px;}
</style>
<script type="text/javascript">
if(screen.width<620)  
{  
    document.getElementById('WebViewport').setAttribute('content', 'width='+screen.width+',target-densitydpi=device-dpi,minimum-scale=0.3,maximum-scale=1,user-scalable=1');
}  
	$(function() {
		var container = $('#container');
		var list = $('#list');
		var buttons = $('#buttons span');
		var prev = $('#prev');
		var next = $('#next');
		var index = 1;
		var len = 5;
		var interval = 3000;
		var timer;

		function animate(offset) {
			var left = parseInt(list.css('left')) + offset;
			if (offset > 0) {
				offset = '+=' + offset;
			} else {
				offset = '-=' + Math.abs(offset);
			}
			list.animate({
				'left' : offset
			}, 300, function() {
				if (left > -200) {
					list.css('left', -975 * len);
				}
				if (left < (-975 * len)) {
					list.css('left', -975);
				}
			});
		}

		function showButton() {
			buttons.eq(index - 1).addClass('on').siblings().removeClass('on');
		}

		function play() {
			timer = setTimeout(function() {
				next.trigger('click');
				play();
			}, interval);
		}
		function stop() {
			clearTimeout(timer);
		}

		next.bind('click', function() {
			if (list.is(':animated')) {
				return;
			}
			if (index == 5) {
				index = 1;
			} else {
				index += 1;
			}
			animate(-975);
			showButton();
		});

		prev.bind('click', function() {
			if (list.is(':animated')) {
				return;
			}
			if (index == 1) {
				index = 5;
			} else {
				index -= 1;
			}
			animate(975);
			showButton();
		});

		buttons.each(function() {
			$(this).bind('click', function() {
				if (list.is(':animated') || $(this).attr('class') == 'on') {
					return;
				}
				var myIndex = parseInt($(this).attr('index'));
				var offset = -975 * (myIndex - index);

				animate(offset);
				index = myIndex;
				showButton();
			})
		});

		container.hover(stop, play);

		play();

	});

	function listCourse() {
		
		var url = window.location.href;
		var param = url.split("?")[1];
		var code;
		if (param == undefined) {
			code = 0;
		} else {
			code = param.split("=")[1];
		}
		var e = "";
		var s = "";
		code = parseInt(code);

		var data = "{'bigType':'" + e + "','smallType':'" + s + "'}";

		var courseList = "";
		var teacherList = "";
		var rollList = "";
		var partnersList = "";
		
		var coursec2List = "";
		var coursec2Listleft="";
		
		var demandList = "";
		var demandListleft="";
		
		var coursec3List = "";
		var coursec3Listleft="";
		
		var coursec1List = "";
		var coursec1Listleft="";
		
		var ddlist = "";
		var left = "";
			
		$.ajax({
					url : "getCourses",
					type : "POST",
					data : 'pageIndex=1&pageSize=1000',
					success : function(data) {
						if (data.code == 200) {
							var n = data.demandc1ListSize;
							if(n>7){n=7;}
							for(var i = 0;i <n;i++){
								var o = data.demandc1List[i];
								if(i==0){ 
									if(o.dd==1){
										coursec1Listleft = "<a href='detail2.jsp?cid="+ o.id+"' target='_blank'>"+
												"<div class='x-zoomImg'>"+
												"<img  id='auto-id-1474955498853' src='"+o.coverImg+"' alt='' width='225' height='466'>"+
											"</div>"+
										"</a>";
									}else{
										coursec1Listleft = "<a href='detail.jsp?cid="+ o.id+"' target='_blank'>"+
												"<div class='x-zoomImg'>"+
												"<img  id='auto-id-1474955498853' src='"+o.coverImg+"' alt='' width='225' height='466'>"+
											"</div>"+
										"</a>";
									}
									
								}else{
									if(o.dd==1){
										if(o.price==0){
											coursec1List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
											"<div >"+
												"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
													"<div class='img'>"+
														"<div class='pic f-pr'>"+
															"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
														"</div>"+
														"<div class='tit'>"+
															"<h3 class='f-thide'>"+o.tName+"</h3>"+
															"<div class=' sign f-dn'>"+o.tName+"</div>"+
															"<div class=' sign foxconn2 f-dn '></div>"+
														"</div>"+
														"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
														"<div class='thumb'>"+
															/* "<div class='desc f-cb'>"+
																"<span>已购"+o.totalNum+"人</span>"+
															"</div>"+ */
															"<div class='btn f-pr btn2'>"+
																"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
																"<span class='discount'>"+"</span>"+
															"</div>"+
														"</div>"+
													"</div>"+
												"</a>"+
											"</div>"+
										"</div>";
										}else{
											coursec1List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
											"<div >"+
												"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
													"<div class='img'>"+
														"<div class='pic f-pr'>"+
															"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
														"</div>"+
														"<div class='tit'>"+
															"<h3 class='f-thide'>"+o.tName+"</h3>"+
															"<div class=' sign f-dn'>"+o.tName+"</div>"+
															"<div class=' sign foxconn2 f-dn '></div>"+
														"</div>"+
														"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
														"<div class='thumb'>"+
															"<div class='desc f-cb'>"+
																"<span>已购"+o.totalNum+"人</span>"+
															"</div>"+
															"<div class='btn f-pr btn2'>"+
																"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
																"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+o.oprice+"</span>"+
															"</div>"+
														"</div>"+
													"</div>"+
												"</a>"+
											"</div>"+
										"</div>";
										}
									}else{
										coursec1List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
										"<div >"+
											"<a target='_blank' class=' wrap' href='detail.jsp?cid="+ o.id+"'>"+
												"<div class='img'>"+
													"<div class='pic f-pr'>"+
														"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
													"</div>"+
													"<div class='tit'>"+
														"<h3 class='f-thide'>"+o.tName+"</h3>"+
														"<div class=' sign f-dn'>"+o.tName+"</div>"+
														"<div class=' sign foxconn2 f-dn '></div>"+
													"</div>"+
													"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
													"<div class='thumb'>"+
														"<div class='desc f-cb'>"+
															"<span>已购"+o.totalNum+"人</span>"+
														"</div>"+
														"<div class='btn f-pr btn2'>"+
															"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
															"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+o.oprice+"</span>"+
														"</div>"+
													"</div>"+
												"</div>"+
											"</a>"+
										"</div>"+
									"</div>";
									}
									
								}
							}
							//推荐课程
							var m = data.demandc3ListSize;
							if(m>7){m=7;}
							for(var i = 0;i < m;i++){
								var o = data.demandc3List[i];
									
									if(i==0){
										if(o.dd==1){
											coursec3Listleft = "<a href='detail2.jsp?cid="+ o.id+"' target='_blank'>"+
											"<div class='x-zoomImg'>"+
											"<img  id='auto-id-1474955498853' src='"+o.coverImg+"' alt='' width='225' height='466'>"+
										"</div>"+
									"</a>";
										}else{
											coursec3Listleft = "<a href='detail.jsp?cid="+ o.id+"' target='_blank'>"+
											"<div class='x-zoomImg'>"+
											"<img  id='auto-id-1474955498853' src='"+o.coverImg+"' alt='' width='225' height='466'>"+
										"</div>"+
									"</a>";
										}
										
									}else{
										if(o.dd==1){
											if(o.price==0){
												coursec3List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
												"<div >"+
													"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
														"<div class='img'>"+
															"<div class='pic f-pr'>"+
																"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
															"</div>"+
															"<div class='tit'>"+
																"<h3 class='f-thide'>"+o.tName+"</h3>"+
																"<div class=' sign f-dn'>"+o.tName+"</div>"+
																"<div class=' sign foxconn2 f-dn '></div>"+
															"</div>"+
															"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
															"<div class='thumb'>"+
																 /* "<div class='desc f-cb'>"+
																	"<span>已购"+o.totalNum+"人</span>"+
																"</div>"+  */
																"<div class='btn f-pr btn2'>"+
																	"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
																	/* "<span class='discount'>"+o.tName+"</span>"+ */
																"</div>"+
															"</div>"+
														"</div>"+
													"</a>"+
												"</div>"+
											"</div>";
											}else{
												coursec3List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
												"<div >"+
													"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
														"<div class='img'>"+
															"<div class='pic f-pr'>"+
																"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
															"</div>"+
															"<div class='tit'>"+
																"<h3 class='f-thide'>"+o.tName+"</h3>"+
																"<div class=' sign f-dn'>"+o.tName+"</div>"+
																"<div class=' sign foxconn2 f-dn '></div>"+
															"</div>"+
															"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
															"<div class='thumb'>"+
																 "<div class='desc f-cb'>"+
																	"<span>已购"+o.totalNum+"人</span>"+
																"</div>"+ 
																"<div class='btn f-pr btn2'>"+
																	"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
																	"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+o.oprice+"</span>"+
																"</div>"+
															"</div>"+
														"</div>"+
													"</a>"+
												"</div>"+
											"</div>";
											}
											
										}else{
											coursec3List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
											"<div >"+
												"<a target='_blank' class=' wrap' href='detail.jsp?cid="+ o.id+"'>"+
													"<div class='img'>"+
														"<div class='pic f-pr'>"+
															"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
														"</div>"+
														"<div class='tit'>"+
															"<h3 class='f-thide'>"+o.tName+"</h3>"+
															"<div class=' sign f-dn'>"+o.tName+"</div>"+
															"<div class=' sign foxconn2 f-dn '></div>"+
														"</div>"+
														"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
														"<div class='thumb'>"+
															"<div class='desc f-cb'>"+
																"<span>已购"+o.totalNum+"人</span>"+
															"</div>"+ 
															"<div class='btn f-pr btn2'>"+
																"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
																"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+o.oprice+"</span>"+
															"</div>"+
														"</div>"+
													"</div>"+
												"</a>"+
											"</div>"+
										"</div>";
										}
										
									 } 
							}
							//合作机构
							var p = data.partnersListSize;
							for (var i = 0; i < p; i++) {
								var obj2 = data.partnersList[i];
								partnersList += "<a target='_blank' href='"+obj2.selfUrl+"'><img width='225' height='142' src='"+obj2.logo+"' alt='"+obj2.pname+"'/></a>"
							}
							//轮播图
							var s = data.rollListSize;
							var objh = data.rollList[0];
							var objw = data.rollList[4];
							for (var i = 0; i < s; i++) {
								var obj0 = data.rollList[i];
								
									rollList += "<a href='"
											+ obj0.href
											+ "'><img src='"+obj0.coverimg+"'/></a>";
								

							}
							rollList = "<a href='" + objw.href
									+ "'><img src='"+objw.coverimg+"'/></a>"
									+ rollList + "<a href='"
									+objh.href
									+ "'><img src='"+objh.coverimg+"'/></a>";
							//同步课
							var ll = data.demandListSize;
							if(ll>7){ll=7;}
							for (var i = 0; i < ll; i++) {
								var o = data.demandList[i];
									
								if(i==0){
										demandListleft = "<a href='detail2.jsp?cid="+ o.id+"' target='_blank'>"+
														"<div class='x-zoomImg'>"+
														"<img  id='auto-id-1474955498853' src='"+o.coverImg+"' alt='' width='225' height='466'>"+
													"</div>"+
												"</a>";
								}else{
									if(data.demandList[i].isfree==1){
										demandList += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
										"<div >"+
											"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
												"<div class='img'>"+
													"<div class='pic f-pr'>"+
														"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
													"</div>"+
													"<div class='tit'>"+
														"<h3 class='f-thide'>"+o.tName+"</h3>"+
														"<div class=' sign f-dn'>"+o.tName+"</div>"+
														"<div class=' sign foxconn2 f-dn '></div>"+
													"</div>"+
													"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
													"<div class='thumb'>"+
														"<div class='btn f-pr btn2'>"+
															"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
														"</div>"+
													"</div>"+
												"</div>"+
											"</a>"+
										"</div>"+
									"</div>";
									}else{
										demandList += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
										"<div >"+
											"<a target='_blank' class=' wrap' href='detail2.jsp?cid="+ o.id+"'>"+
												"<div class='img'>"+
													"<div class='pic f-pr'>"+
														"<img class='imgPic ' src='"+o.coverImg+"' alt='' id='auto-id-1474955500090'>"+
													"</div>"+
													"<div class='tit'>"+
														"<h3 class='f-thide'>"+o.tName+"</h3>"+
														"<div class=' sign f-dn'>"+o.tName+"</div>"+
														"<div class=' sign foxconn2 f-dn '></div>"+
													"</div>"+
													"<div class='orgName f-fs0 f-thide'>"+o.title+"</div>"+
													"<div class='thumb'>"+
														"<div class='desc f-cb'>"+
															"<span>已购"+o.totalNum+"人</span>"+
														"</div>"+
														"<div class='btn f-pr btn2'>"+
															"<span class='normal f-fs0'>价格:"+o.price+"</span> "+
															"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+o.oprice+"</span>"+
														"</div>"+
													"</div>"+
												"</div>"+
											"</a>"+
										"</div>"+
									"</div>";
									}
								 } 
							}
							//直播课
							var qq = data.size;
							if(qq>7){qq=7};
							for (var i = 0; i < qq; i++) {
								var obj = data.list[i];
								var newTime = new Date(obj.beginTime.time);
								var endTime = new Date(obj.endTime.time);
								var cTime = subDate(obj.beginTime);
										
										if(i==0){
											coursec2Listleft = "<a href='detail.jsp?cid="+ obj.id+"' target='_blank'>"+
															"<div class='x-zoomImg'>"+
															"<img  id='auto-id-1474955498853' src='"+obj.coverImg+"' alt='' width='225' height='466'>"+
														"</div>"+
													"</a>";
										}else{ 
											coursec2List += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
											"<div >"+
												"<a target='_blank' class=' wrap' href='detail.jsp?cid="+ obj.id+"'>"+
													"<div class='img'>"+
														"<div class='pic f-pr'>"+
															"<img class='imgPic ' src='"+obj.coverImg+"' alt='' id='auto-id-1474955500090'>"+
														"</div>"+
														"<div class='tit'>"+
															"<h3 class='f-thide'>"+obj.tName+"</h3>"+
															"<div class=' sign f-dn'>"+obj.tName+"</div>"+
															"<div class=' sign foxconn2 f-dn '></div>"+
														"</div>"+
														"<div class='orgName f-fs0 f-thide'>"+obj.title+"</div>"+
														"<div class='thumb'>"+
															"<div class='desc f-cb'>"+
																"<span>已购"+ obj.totalNum
																+"人</span>"+
															"</div>"+
															"<div class='btn f-pr btn2'>"+
																"<span class='normal f-fs0'>价格:"+obj.price+"</span> "+
																"<span class='discount' style='text-decoration: line-through;margin-left:20px;'>原价:"+obj.oprice+"</span>"+
															"</div>"+
														"</div>"+
													"</div>"+
												"</a>"+
											"</div>"+
										"</div>";
										 } 
							}
							//名师风采
							var gg = data.teacherSize;
							if(gg>5){gg=5};
							for (var j = 0; j < gg; j++) {
								var o = data.teacherList[j];
								teacherList +="<a target='_blank' class=' wrap' href='teacher_show.jsp?cid="+o.tid+"'><img alt='' src='"+o.headimg+"' style='width: 180px;margin-right: 10px;'></a>";					
										/* teacherList += "<div class='u-cover u-find-cover' id='auto-id-1474955500078'>"+
								"<div >"+
									"<a target='_blank' class=' wrap' href='teacher_show.jsp?cid="+o.tid+"'>"+
										"<div class='img'>"+
											"<div class='pic f-pr'>"+
												"<img class='imgPic ' src='"+o.headimg+"' alt='' id='auto-id-1474955500090'>"+
											"</div>"+
											"<div class='tit'>"+
												"<h3 class='f-thide'>"+o.tName+"</h3>"+
												"<div class=' sign f-dn'>"+"</div>"+
												"<div class=' sign foxconn2 f-dn '></div>"+
											"</div>"+
											"<div class='orgName f-fs0 f-thide'>"+o.sign+"</div>"+
										"</div>"+
									"</a>"+
								"</div>"+
							"</div>"; */
							}
						}

						$("#j-recteachers").append(teacherList);
						$("#list").append(rollList);
						$("#partners").append(partnersList);
						
						$("#leftItem3").append(coursec2Listleft);
						$("#zhiboke").append(coursec2List);
						
						$("#leftItem2").append(demandListleft);
						$("#demandList").append(demandList);
						
						$("#leftItem1").append(coursec3Listleft);
						$("#coursec3List").append(coursec3List);
						
						$("#leftItem4").append(coursec1Listleft);
						$("#coursec1List").append(coursec1List);
					},
					dataType : "json"
				});

	}

	function mySubmit() {
		//jQuery提交
		$("#myform").submit();
	}
</script>
<style type="text/css">
/* .div1{position:absolute;bottom:0px;width:100%;} */
* {
	margin: 0;
	padding: 0;
	text-decoration: none;
}

body {
	padding: 20px;
}

#container {
	width: 975px;
	height: 350px;
	border: 3px solid #333;
	overflow: hidden;
	position: relative;
	/* margin-left: 165px; */
	margin: 0 auto;
}

#list {
	width: 6825px;
	height: 400px;
	position: absolute;
	z-index: 1;
}

#list img {
	float: left;
	width: 975px;
	height: 400px;
}

#buttons {
	position: absolute;
	height: 10px;
	width: 100px;
	z-index: 2;
	bottom: 20px;
	left: 450px;
}

#buttons span {
	cursor: pointer;
	float: left;
	border: 1px solid #fff;
	width: 10px;
	height: 10px;
	border-radius: 50%;
	background: #333;
	margin-right: 5px;
}

#buttons .on {
	background: orangered;
}

.arrow {
	cursor: pointer;
	display: none;
	line-height: 39px;
	text-align: center;
	font-size: 36px;
	font-weight: bold;
	width: 40px;
	height: 40px;
	position: absolute;
	z-index: 2;
	top: 180px;
	background-color: RGBA(0, 0, 0, .3);
	color: #fff;
}

.arrow:hover {
	background-color: RGBA(0, 0, 0, .7);
}

#container:hover .arrow {
	display: block;
}

#prev {
	left: 20px;
}

#next {
	right: 20px;
}

.m-lectors li {
	list-style: none;
	display: inline-block;
}

.search-form {
	float: left;
	background-color: #fff;
	padding: 10px;
}

.search-text {
	height: 25px;
	line-height: 25px;
	float: left;
	width: 350px;
	border: 0;
	outline: none;
}

.search-button {
	background-image: url(img/search.png);
	width: 29px;
	height: 29px;
	float: left;
	border: 0
}

#search li{
	list-style: none;
	display: inline-block;
}
</style>
</head>
<body onload="listCourse();">
	<%@include file="top1.jsp"%>
<div class="go-top dn" id="go-top">
    <a href="javascript:;" class="uc-2vm"></a>
	<div class="uc-2vm-pop dn">
		<h2 class="title-2wm">用微信扫一扫</h2>
		<div class="logo-2wm-box">
			<img src="img/weixin.jpg" alt="" width="240" height="240">
		</div>
	</div>
	<script>
$(function(){
	$(window).on('scroll',function(){
		var st = $(document).scrollTop();
		if( st>0 ){
			if( $('#main-container').length != 0  ){
				var w = $(window).width(),mw = $('#main-container').width();
				if( (w-mw)/2 > 70 )
					$('#go-top').css({'left':(w-mw)/2+mw+20});
				else{
					$('#go-top').css({'left':'auto'});
				}
			}
			$('#go-top').fadeIn(function(){
				$(this).removeClass('dn');
			});
		}else{
			$('#go-top').fadeOut(function(){
				$(this).addClass('dn');
			});
		}	
	});
	 $('#go-top .go').on('click',function(){
		$('html,body').animate({'scrollTop':0},500);
	}); 

	$('#go-top .uc-2vm').hover(function(){
		$('#go-top .uc-2vm-pop').removeClass('dn');
	},function(){
		$('#go-top .uc-2vm-pop').addClass('dn');
	});
});
</script>
	
    
    <a href="javascript:;" class="go"></a>
</div>

	<div id="container">
		<div id="list" style="left: -975px;"></div>
		<div id="buttons">
			<span index="1" class="on"></span> <span index="2"></span> <span
				index="3"></span> <span index="4"></span> <span index="5"></span>
		</div>
		<a href="javascript:;" id="prev" class="arrow">&lt;</a> <a
			href="javascript:;" id="next" class="arrow">&gt;</a>
	</div>

	<div class="g-flow" id="free_course" >
		<div class=" f-cb">
			<h2 class="f-fl">推荐课程</h2>
			<a class="u-more f-fr" data-index="更多" data-name="更多" target="_blank"
				href="more.jsp?type=c3"><span>更多</span></a>
		</div>
		<div class="f-cb">
			<div class="g-container">
				<div class="g-cell" id="leftItem1"></div>
				<div id="cxkctj">
					<div class=" f-cb" id="coursec3List"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="g-flow" id="syn_course" >
		<div class=" f-cb">
			<h2 class="f-fl">同步课程</h2>
			<a class="u-more f-fr" data-index="更多" data-name="更多" target="_blank"
				href="more2.jsp"><span>更多</span></a>
		</div>
		<div class="f-cb">
			<div class="g-container">
				<div class="g-cell" id="leftItem2"></div>
				<div id="cxkctj">
					<div class=" f-cb" id="demandList"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="g-flow" id="live_course" >
		<div class=" f-cb">
			<h2 class="f-fl">直播课程</h2>
			<a class="u-more f-fr" data-index="更多" data-name="更多" target="_blank"
				href="live_more.jsp"><span>更多</span></a>
		</div>
		<div class="f-cb">
			<div class="g-container">
				<div class="g-cell" id="leftItem3"></div>
				<div id="cxkctj">
					<div class=" f-cb" id="zhiboke"></div>
				</div>
			</div>
		</div>
	</div>

	<div class="g-flow" id="certification" >
		<div class=" f-cb">
			<h2 class="f-fl">直播回放</h2>
			<a class="u-more f-fr" data-index="更多" data-name="更多" target="_blank"
				href="more.jsp?type=c1"><span>更多</span></a>
		</div>
		<div class="f-cb">
			<div class="g-container">
				<div class="g-cell" id="leftItem4"></div>
				<div id="cxkctj">
					<div class=" f-cb" id="coursec1List"></div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="g-flow" id="certification" >
		<div class=" f-cb">
			<h2 class="f-fl">名师风采</h2>
			<a class="u-more f-fr" data-index="更多" data-name="更多" target="_blank"
				href="teacher_more.jsp"><span>更多</span></a>
		</div>
		<div class="f-cb">
			<div class="g-container">
				<div class="g-cell" id=""></div>
				<div id="cxkctj">
					<div class=" f-cb" >
						<div style="margin-left: 25px;" id="j-recteachers">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="g-flow" id="cooperation_dept"
		style=" margin-top: 10px;">
		<div class="u-bar f-cb">
			<a class="f-fl" style="font-size: 20px; font-weight: bold;">合作机构</a>
		</div>
		
		<div>
			<marquee scrolldelay="30" behavior="scroll" id="partners" onmouseover="this.stop()" onmouseout="this.start()">
			</marquee>
		</div>
	</div>
	
	<div class="div1">
		<%-- <%@include file="footer.jsp"%> --%>
	</div>
</body>
</html>
