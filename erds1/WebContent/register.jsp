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
<title>鄂尔多斯名师讲堂_注册</title>
<link type="image/x-icon" rel="shortcut icon" href="/images/ordosmskt.ico" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/login_704b305.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/forget_8985893.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
<script>
var validateCode="";
function register(){
	
	var e=$("#register_number").val(),t=/^1[0-9]{10}$/;
	if(!t.test(e))
		return $("#register_fall").show().html("请输入合法的手机号"),void $("#register_btn").html("注册");
	var v = $("#register_validateCode").val();
	if(v==""){
		return $("#register_fall").show().html("验证码不能为空"),void $("#register_btn").html("注册");
	}
	if(validateCode!=v){
		return $("#register_fall").show().html("验证码错误"),void $("#register_btn").html("注册");
	}
	var l=$("#nickname").val();
	var a=/^([0-9a-zA-Z]|[\u4E00-\u9FA5])*$/;
	if(l==null || l=="")
		return $("#register_fall").show().html("昵称不能为空"),void $("#register_btn").html("注册");l=encodeURI(l);
	var s=$("#register_password").val(),n=/^[\w]{6,20}$/;
	if(!n.test(s))
		return $("#register_fall").show().html("密码需为6-20位英文及数字"),void $("#register_btn").html("注册");
	var o=$("#register_password_repeat").val();
	if(s!=o)
		return $("#register_fall").show().html("两次输入密码不一致"),void $("#register_btn").html("注册");
	$.ajax({
		 url: "register",
		 type: "POST",
		 data:'uid='+e+'&nickname='+l+'&password='+s,
		 success: function(data){
			 if(data.code==100){
				 alert(data.message)
			 }else{
				 if(confirm("注册成功!")){
					 window.location.href="login.jsp";
				 }
			 }
		 },
		 dataType: "json"
		});
}

function getValidateCode(){
	var o = $('.aa');
	var e=$("#register_number").val(),t=/^1[0-9]{10}$/;
	if(!t.test(e)){
		alert("请输入合法的手机号");
		return;
	}
	time(o);
	var v = $("#register_validateCode").val();
	$.ajax({
		 url: "getCodeForReset",
		 type: "POST",
		 data:'userphone='+e+"&validateCode="+v,
		 success: function(data){
			 validateCode = data.code;
			 /* if(data.code==1){
				 $("#register_fall").html(data.message);
				 $(".login_fall").show();
			 }else{
				 alert(data.message);
			 } */
		 },
		 dataType: "json"
		});
}
var wait=60;//时间
function time(o) {//o为按钮的对象，p为可选，这里是60秒过后，提示文字的改变
	if (wait == 0) {
		o.attr('href','javascript:;');
		o.attr('onclick','getValidateCode()');
		o.html("点击发送验证码");
		wait = 60;
	} else {
		o.removeAttr('href');//去掉a标签中的href属性
		o.removeAttr('onclick');//去掉a标签中的onclick事件
		o.html(wait + "秒后重新获取验证码");//改变按钮中value的值
		wait--;
		setTimeout(function() {
			time(o);//循环调用
		},
		1000)
	}
} 
</script>
</head>
<body>
	<div class="register_layer login_supernatant" style="float: left;">
		<span class="vertical_middle"></span>
		<div class="login_box clearfix" id="register_box">
			<div class="login_title">
				<div class="login_logo">
					<img src="./img/small_logo.png"
						alt="logo" width="97px;" height="54px;" style="margin-top: 0px;"/>
				</div>
				<span>注册</span>
			</div>
			<div class="login_tel">
				<input type="text" value="" id="register_number"
					class="account_number account_input" placeholder="手机号"
					autocomplete="off">
					<a href="javascript:;"  class="login_btn aa" onclick="getValidateCode()">获取验证码</a>
			</div>
			<div class="login_pwd">
				<input type="text" value="" id="register_validateCode"
					class="account_password account_input" placeholder="验证码">
			</div>
			<div class="register_nickname">
				<input type="text" value="" id="nickname"
					class="account_number account_input" placeholder="昵称"
					autocomplete="off" maxlength="10">
			</div>
			<div class="login_pwd">
				<input type="password" value="" id="register_password"
					class="account_password account_input" placeholder="密码">
			</div>
			<div class="login_pwd">
				<input type="password" value="" id="register_password_repeat"
					class="account_password_repeat account_input" placeholder="重复密码">
			</div>
			<button  id="register_btn" class="login_btn" onclick="register()">注册</button>
			<div class="login_hint clearfix register_hint">
				<a href="login.jsp" class="float_right skip_login">已有账号，去登录></a>
			</div>
			<div id="register_fall" class="login_fall"></div>
		</div>
		<div class="register_success">
			注册成功，<span>3</span>秒后自动登录
		</div>
	</div>
	<!-- <div class="fixed" style="float: right;">
		<img alt="erds" src="./img/weixin.jpg" style="width: 200px;height: 200px;">
	</div> -->
</body>
</html>
