<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>宣传片</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<link href="video/video-js.css" rel="stylesheet" type="text/css">
<script src="video/video.js"></script>
<script>
   videojs.options.flash.swf = "video/video-js.swf";
 </script>
</head>
<body>
	<%@include file="header.jsp"%>
	<div style="height: 564px; width: 1000px; margin: 0 auto;">
		<video id="my_video_1" src="http://oev6hl3jh.bkt.clouddn.com/%E5%AE%A3%E4%BC%A0%E7%89%87.mp4" controls="controls" preload="auto"
			width="1000px" height="564px" autoplay="autoplay"></video>
	</div>
	<%@include file="footer.jsp"%>
	<script type="text/javascript">
	window.onload = function(){
		init();
	    //去掉默认的contextmenu事件，否则会和右键事件同时出现。
	    document.oncontextmenu = function(e){
	        e.preventDefault();
	    };
	    document.getElementById("my_video_1").onmousedown = function(e){
	        if(e.button ==2){
	        	console.log("你点了右键");
	        }else if(e.button ==0){
	        	console.log("你点了左键");
	        }else if(e.button ==1){
	        	console.log("你点了滚轮");
	        }
	    }
	}
	</script>
</body>
</html>
