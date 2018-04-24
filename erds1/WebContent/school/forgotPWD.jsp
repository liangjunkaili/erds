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
<title>忘记密码</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript">

	
</script>
<style type="text/css">
.div1 {
	position: absolute;
	bottom: 0px;
	width: 100%;
}

.content {
	width: 800px;
	margin: 0 auto;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	border-left: 1px solid #888;
	border-top: 1px solid #888;
	background: #efefef;
}

th, td {
	border-right: 1px solid #888;
	border-bottom: 1px solid #888;
	padding: 5px 15px;
}

th {
	font-weight: bold;
	background: #ccc;
}
</style>
<script type="text/javascript">
function init(){
	//init_a();
}
function check(){
	var uid=document.getElementById("uid").value;
	var t=/^1[0-9]{10}$/;
	if(!t.test(uid)){
		alert('账号不正确');
		return ;
	}
	var email = $("#email").val();
	if(!CheckMail(email)){
		return;
	};
	var data="{'uid':'"+uid+"'}";
	$.ajax({
		 url: "checkUid",
		 type: "POST",
		 data:'uid='+uid,
		 success: function(data){
			 if(data.code!=0){
				 var size = data.size;
				 if(size>0){
					 $('#form').submit();
				 }else{
					 alert('账号不存在');
				 }
				 
		 		}
			},
			dataType : "json"
			});
}
</script>
</head>
<body onload=init()>
	<%@include file="top1.jsp"%>

	<div class="content container list_main clearfix">
		<h1>重置你的密码</h1>
		<form action="sendEmail" id="form" method="post">
			<table>
				<tr>
					<td>手机号：</td>
					<td><input type="text" name="uid" id="uid"></td>
				</tr>
				<tr>
					<td>请输入你的邮箱：</td>
					<td><input type="text" name="email" id="email"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="button" value="提交" onclick="check();"/></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="div1">
		<%@include file="footer.jsp"%>
	</div>
</body>
</html>
