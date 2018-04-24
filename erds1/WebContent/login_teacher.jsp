<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>鄂尔多斯名师讲堂_教师登录</title>

<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/login_704b305.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script>
function check(){
	var e=$("#j-tel").val();
	var s=$("#j-pwd").val();
	if(e!=null&&e!=""){
		if(s!=null&&s!=""){
			return true;
		}else{
			alert("请输入密码");
			return false;
		}
	}else{
		alert("请输入工号");
		return false;
	}
}
function login(){
	if(check()){
		
	
	var e=$("#j-tel").val();
	
	var s=$("#j-pwd").val();
	
	 var data = "{'tid':'"+e+"','password':'"+s+"'}";	 
	$.ajax({
		 url: "login_teacher",
		 type: "POST",
		 data:'data='+data,
		 success: function(data){
			 if(data.code==200){
				 window.location.href="teacher_course.jsp?tid="+data.tid;
			 }else{
				 alert("账号密码错误");
			 }
		 },
		 dataType: "json"
		});}
}
</script>
</head>
<body>
	<div class="login_layer login_supernatant">
		<span class="vertical_middle"></span>
		<div class="login_box clearfix" id="login_box">
			<div class="login_title">
				<div class="login_logo">
					<img src="./img/small_logo.png"
						alt="logo" width="97px;" height="54px;" style="margin-top: 0px;"/>
				</div>
				<span>教师登录</span>
			</div>
			<div class="login_tel">
				<input type="text" value="" id="j-tel"
					class="account_number account_input" placeholder="工号"
					autocomplete="off">
			</div>
			<div class="login_pwd">
				<input type="password" value="" id="j-pwd"
					class="account_password account_input" placeholder="密码">
			</div>
			<a href="javascript:;" id="j-login-btn" class="login_btn" onclick="login()">登录</a>
			<div class="login_hint clearfix">
				<!-- <a href="forget.html~forget.html" class="forget_pwd float_left">忘记密码？</a> -->
				<!-- <a href="register.jsp" class="skip_register float_right">注册账号></a> -->
				<!-- <a href="forgotPWD.jsp" class="skip_register float_left">忘记密码?</a> -->
			</div>
			<div id="j-login-fall" class="login_fall">密码错误</div>
		</div>
	</div>
</body>
</html>
