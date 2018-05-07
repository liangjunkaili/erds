<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>个人信息</title>
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
	<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
 <script src="bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- <script src="bootstrap/js/jquery.min.js"></script> -->
		<link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/re.css">
<script type="text/javascript" src="static/js/common/common.js"></script>
	<style type="text/css">

	
.left_nav {
	float: left;
	width: 160px;
	box-sizing: border-box;
	border-bottom: 0;
	background-color: #fff;
	box-shadow: 0 0 2px #e8e8e8;
	border-radius: 4px
}

.left_nav li {
	width: 100%;
	height: 60px;
	box-sizing: border-box;
	font-size: 14px;
	font-weight: 700;
	position: relative;
	text-align: center;
	line-height: 60px
}

.left_nav li a {
	display: inline-block;
	width: 160px;
	line-height: 38px;
	color: #35291e;
	text-align: center;
	font-weight: 400;
	box-sizing: border-box
}

.left_nav .select a {
	background-color: #f4f4f3;
	border-left: 6px solid #fec231;
	padding-right: 6px;
	color: #fec231
}

.left_nav li a:hover {
	background-color: #fec231;
	background-color: #f4f4f3;
	border-left: 6px solid #fec231;
	padding-right: 6px
}
.div1{position:absolute;bottom:0px;width:100%;}
/* table{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#efefef;}
th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
th{font-weight:bold;background:#ccc;} */
.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}

</style>
<script type="text/javascript">
function check(){
	var pwd = $("#password").val();
	var repwd = $("#repassword").val();
	if(pwd!=repwd){
		alert("两次输入的密码不一致!")
		return;
	}
	var r = confirm("确定要修改密码么\n");
	if(r==true){
		$("#form").submit();
		alert("密码修改成功！");
	}else{
		alert("取消修改密码！")
	}
}
function getMyInfo(){
	//init_a();
	var data = "{'uid':'"+<%=request.getSession().getAttribute("uid")%>+"'}"
	$.ajax({
			url : "getMyInfo",
			type : "POST",
			data : 'data='+data,
			success : function(data) {
				if (data.code == 200) {
					var nickName=data.info.nickName;
					$("#teacherName").attr("value",nickName); 
					$("#password").attr("value",data.info.password); 
					$("#uid").attr("value",data.info.uid); 
					$("#uid1").attr("value",data.info.uid); 
					$("#sex").attr("value",data.info.sex); 
					$("#address").attr("value",data.info.address); 
					if(data.info.headimg!=null && data.info.headimg!=''){
						$("#headImg").attr("src",data.info.headimg);
					}
				}
			},
			dataType : "json"
		});
	}
</script>
</head>
 <body onload="getMyInfo()"> 
<%@include file="top1.jsp" %>
 <div class="content" style="width: 980px;height: 450px;margin: 0 auto;"> 
	<div class="left" style="float: left;width: 30%;height: 100%;">
			<ul class="left_nav" id="j-left-nav" style="margin-left: 20px;">
				<li id="j-today-lesson-leftnav" class="select"><a
					href="studentInfo.jsp">个人资料</a></li>
				<li id="j-my-course-leftnav"><a
					href="myCourse.jsp">我的课程</a></li>
			</ul>
	</div>
	<div class="right" style="float: left;width: 70%;height: 100%;">
	<form class="form-horizontal" action="updateMyPassword" id="form" method="post" enctype="multipart/form-data">
			
			<div class="form-group">
				<label class="col-sm-3 control-label">电 话:</label><div class="col-sm-4">
				<input class="form-control" type="text" name="uid" id="uid" disabled="disabled"/>
				<input class="form-control" type="hidden" name="uid1" id="uid1" />
			</div></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">密 码:</label><div class="col-sm-4">
			<input class="form-control" type="password" name="password" id="password"/>
			</div></div>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">确认密码:</label><div class="col-sm-4">
				<input class="form-control" type="password" name="repassword" id="repassword"/>
			</div></div>
			
				
				<div class="form-group"><label class="col-sm-3 control-label"></label><div class="col-sm-4"><button class="btn btn-primary btn-sm" onclick="check()">&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;</button>
			</div></div>
		
		</form>
		</div>
</div>
 
	<%-- <%@include file="footer.jsp" %>  --%>

</body>
</html>