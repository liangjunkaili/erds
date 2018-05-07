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
<link href="css/city-picker.css" rel="stylesheet">
<script src="js/jquery.js"></script>
 <script src="js/bootstrap.js"></script> 
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
<script src="js/main.js"></script>
<link href="bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/re.css">
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
	<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
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
function getAddress(address){
	document.getElementById("city-picker3").value=address;
}
function getMyInfo(){
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
					document.getElementById("grade")[2].selected=true;
					if(data.info.grade==1){
						$("#gaoyi").attr("selected","selected");
					 }else if(data.info.grade==2){
						$("#gaoer").attr("selected",true);
					}else{
						$("#gaosan").attr("selected",true);
					}
					if(data.info.sex==0){
						$("#nv").attr("checked",true);
					}else{
						$("#nan").attr("checked",true);
					}
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
		<form class="form-horizontal" action="updateMyInfo" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label">电 话：</label>
            <div class="col-sm-4">
                <input type="text" name="uid" id="uid" disabled="disabled" class="form-control">
                <input type="hidden" name="uid1" id="uid1" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="teacherName" class="col-sm-3 control-label">昵 称：</label>
            <div class="col-sm-4">
                <input type="text" name="teacherName" id="teacherName" value="" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="sex" class="col-sm-3 control-label">性 别：</label>
            <div class="col-sm-4">
                <input id="nv" name="sex" type="radio" value="0">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input id="nan" name="sex" type="radio" value="1">男
            </div>
        </div>
        <div class="form-group">
            <label for="address" class="col-sm-3 control-label">地 址：</label>
            <div class="col-sm-4">
            <div style="position: relative;">
                <input type="text"  id="city-picker3" name="address" readonly type="text" value="" data-toggle="city-picker">
             </div><div>
                    <script type='text/javascript'>
                        getAddress('<%=request.getSession().getAttribute("address")%>')
                    </script>
                </div>
            </div>
        </div>
        <div class="form-group">
            <label for="grade" class="col-sm-3 control-label">年 级：</label>
            <div class="col-sm-4">
                <select id="grade" name="grade" class="form-control">
                    <option id="gaoyi" value="1">高中</option>
                    <option id="gaoer" value="2">初中</option>
                    <option id="gaosan" value="3">小学</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label for="headImg" class="col-sm-3 control-label">头 像：</label>
            <div class="col-sm-4">
                <img alt="" src="" style="width: 150px;height: 120px;" id="headImg">
            </div>
            <div class="col-sm-2">
                <a href="#" class="file">上传头像 <input type="file"  value="上传头像" name="headImg" ></a>
            </div>
        </div>
        <div class="form-group">
            <label for="save" class="col-sm-3 control-label"></label>
            <div class="col-sm-4">
                <button class="btn btn-primary btn-sm">&nbsp;&nbsp;&nbsp;提&nbsp;&nbsp;交&nbsp;&nbsp;&nbsp;</button>
            </div>
            <div class="col-sm-3 changePass"> <a href="updateStuInfo.jsp">修改密码>></a></div>
        </div>
    </form>
    <script src="bootstrap/dist/js/bootstrap.min.js"></script>
		</div>
</div>
</body>
</html>