<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.beecloud.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>教师列表</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/detail/detailpc_d14fbe7.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/payment/pay_1f4a5f5.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/components/sidebar_d58d76f.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/account_bb3c9f3.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript" id="bdshare_js" data="type=slide&img=0&pos=right&uid=11824" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
var bds_config = {"bdTop":155};
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>

<script type="text/javascript">

function init(){
	var url = window.location.href;
	var param = url.split("?")[1];
	var tid = param.split("=")[1];
	var courseList = "";
	$.ajax({
		 url: "findTeacherById",
		 type: "POST",
		 data:'tid='+tid,
		 success: function(data){
			 if(data.code!=0){
				var tname = data.teacher.tName;
				var sign = data.teacher.sign;
				var describle = data.teacher.describle;
				$("#headimg").attr("src",data.teacher.headimg);
						}
						$("#tname").append(tname);
						$("#sign").append(sign);
						$("#describle").append(describle);
					},
					dataType : "json"
				});
	}
</script>
</head>
<body onload="init()">
	<%

		BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651",
				"3db27c52-220d-41f5-ba05-bf398febb5c0");
	%>
	<%@include file="top1.jsp"%>
		<div class="container clearfix">
		
			
			<div class="main_right">
				<div class="teacher_info_wrap">
					<div class="detail_block_hd no_border_bottom">
						<div class="teacher_info_hd clearfix">
							<img id="headimg" src="" alt="" />
							<div class="detail_teacher_info">
								<div id="tname" class="detail_teacher_name font_dark"></div>
								<div id="sign" class="detail_teacher_title font_mid_grey"></div>
							</div>
						</div>
						<div  class="detail_teacher_intro font_mid_grey">
						<pre id="describle" style="white-space: pre-wrap;"></pre>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	
	
</body>
</html>
