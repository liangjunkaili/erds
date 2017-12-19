<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>css3后台管理面板 </title>
	<script type="text/javascript" charset="UTF-8" src="js/prefixfree.min.js"></script>
	<link rel="stylesheet" type="text/css" href="css/base.css" media="all" />
	<style type="text/css">
		body {
			background-color: rgb(220,220,220);
			padding: 0;
			margin: 0;
			font-size: 16px;
			font-family: sans-serif;
		}
		.clearfix:after {
			content: "";
			display: block;
			height: 0;
			width: 0;
			clear: both;
		}
		.admin-panel {
			width: 990px;
			margin: 50px auto;
		}
		/*slidebar侧边栏*/
		.slidebar {
			width: 20%;
			min-height: 750px;
			float: left;
			border-right: 1px solid rgb(235,235,235);
			background-color: #59DDDD;
		}
		.slidebar .logo {
			height: 145px;
			border-bottom: 1px solid rgb(235,235,235);
		}
		.slidebar ul {
			padding: 0;
			margin:0;
		}
		.slidebar li {
			list-style-type: none;
			margin: 0;
			position: relative;
		}
		.slidebar li:before {
			content: "";
			font-family: 'icomoon';
			speak: none;
			font-weight: normal;
			font-variant: normal;
			text-transform: none;
			position: absolute;
			display: block;
			line-height: 40px;
			color: rgb(102,102,102);
			right: 20px;
			-webkit-font-smoothing: antialiased;
		}
		/*插入icon图标*/
		.slidebar li:nth-child(1):before {content: "\63";}
		.slidebar li:nth-child(2):before {content: "\64";}
		.slidebar li:nth-child(3):before {content: "\62";}
		.slidebar li:nth-child(4):before {content: "\65";}
		.slidebar li:nth-child(5):before {content: "\74";}
		.slidebar li:nth-child(6):before {content: "\66";}
		.slidebar li:nth-child(7):before {content: "\67";}
		.slidebar li:nth-child(8):before {content: "\68";}
		.slidebar li:nth-child(9):before {content: "\69";}
		.slidebar li:nth-child(10):before {content: "\6a";}
		.slidebar li:nth-child(11):before {content: "\75";}

		.slidebar ul a {
			color: rgb(140,140,140);
			text-decoration: none;
			font:16px/40px helvetica,verdana,sans-serif;
			box-sizing:border-box;
			border-bottom: 1px solid rgb(235,235,235);
			display: block;
			box-shadow:inset 0 1px 0 rgb(255,255,255);
			text-indent: 20px;
			text-transform: capitalize;
		}
		.slidebar li:hover a {
			background-color: rgb(255,255,255);
			box-shadow: 1px 0 0 rgb(255,255,255),inset 5px 0 0 -1px rgb(234,83,63);
		}
		/*main*/
		.main {
			float: left;
			width: 79%;
			height: 750px;
			background-color: rgb(255,255,255);
			position: relative;
			font-family: helvetica,verdana,sans-serif;
		}
		.main .topbar {
			border-bottom: 1px solid rgb(235,235,235);
			margin: 0;
			padding: 0;
		}
		/*topbar顶部按钮栏*/
		.topbar li {
			float: right;
			list-style: none;
		}
		.topbar li:first-child {float: left;}
		.topbar a {
			font-family: 'icomoon';
			display: block;
			line-height: 50px;
			width: 50px;
			text-align: center;
			text-decoration: none;
			color: rgb(102,102,102);
			border-left: 1px solid rgb(235,235,235);
		}
		.topbar a:hover {
			background-color: rgb(247,247,247);
		}
		.topbar li:first-child a {
			border: none;
			border-right: 1px solid rgb(235,235,235);
		}
		/*mainContent*/
		.mainContent h4 {
			line-height: 1;
			font-size: 18px;
			margin: 1.3em 0 1em;
			margin-left: 17px;
		}
		
		.mainContent>div {
			position: absolute;
			opacity: 0;
			-webkit-transition:opacity 200ms linear;
			-moz-transition:opacity 200ms linear;
			-ms-transition:opacity 200ms linear;
			transition:opacity 200ms linear;
		}
		/*通过opacity来切换不同的选项卡*/
		.mainContent>div:target {
			opacity: 1;
		}
		.mainContent h2 {
			margin:1em 30px;
			color: rgb(234,83,63);
			font-size: 20px;
		}
		.mainContent h2:before {
			font-family: 'icomoon';
			content: attr(data-icon);
			font-weight: normal;
			font-variant: normal;
			text-transform: none;
			line-height: 1;
			margin-right: 10px;
			-webkit-font-smoothing: antialiased;
		}
		.mainContent div:nth-child(1) h2:before {content: "\63";}
		.mainContent div:nth-child(2) h2:before {content: "\64";}
		.mainContent div:nth-child(3) h2:before {content: "\62";}
		.mainContent div:nth-child(4) h2:before {content: "\65";}
		.mainContent div:nth-child(5) h2:before {content: "\74";}
		.mainContent div:nth-child(6) h2:before {content: "\66";}
		.mainContent div:nth-child(7) h2:before {content: "\67";}
		.mainContent div:nth-child(8) h2:before {content: "\68";}
		.mainContent div:nth-child(9) h2:before {content: "\69";}
		.mainContent div:nth-child(10) h2:before {content: "\6a";}
		.mainContent div:nth-child(11) h2:before {content: "\75";}

		#dashboard>div {
			/* border: 1px solid rgb(235,235,235); */
			margin-left: 30px;
			float: left;
			/* border-radius: 5px; */
			min-width: 345px;
			/* height: 262px; */
			display: inline-block;
		}
		.monitor ul {
			float: left;
			padding: 0;
			margin: 0 31px 0 17px;
		}
		.monitor li {
			list-style:none;
			font: 600 14px/28px helvetica,verdana,sans-serif;
			color: rgb(102,102,102);
			text-transform: capitalize;
		}
		.monitor li a {
			color: rgb(102,102,102);
			text-transform: capitalize;
			text-decoration: none;
		}
		.monitor li:first-child {
			border-bottom: 1px dotted rgb(153,153,153);
		}
		.discussions .comments {color: rgb(27,106,173);}
		.discussions .approved {color: rgb(105,174,48);}
		.discussions .pending {color: rgb(246,129,15);}
		.discussions .spam {color: rgb(243,47,47);}
		.monitor .count {
			color: rgb(27,106,173);
			text-align: right;
			font-weight: 600;
			margin-right: 15px;
			min-width: 25px;
			display: inline-block;
		}
		.monitor p {
			color: rgb(128,128,128);
			margin: 28px 0 18px 17px;
			display: block;
			font-weight: 600;
			font-size: 12px;
		}
		.monitor p a {
			text-decoration: none;
			color:rgb(27,106,173);
		}
		.quick-press form {
			margin:0 20px 0 13px;
		}
		.quick-press input[type="text"] {
			display: block;
			width: 100%;
			-moz-box-sizing:border-box;
			box-sizing:border-box;
			height: 35px;
			line-height: 15px;
			padding: 10px 0;
			margin:0 0 7px 0;
			background-color: rgb(246,246,246);
			outline: none;
			border: none;
			text-indent: 10px;
		}
		/*统一各浏览器下placeholder内的字体样式*/
		.quick-press input[type="text"]::-webkit-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]:-moz-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]::-moz-input-placeholder {font-size: 14px;}
		.quick-press input[type="text"]:-ms-input-placeholder {font-size: 14px;}

		.quick-press button {
			margin-top: 13px;
			border-radius: 5px;
			text-align: center;
			line-height: 30px;
			padding: 0;
		}
		.quick-press .save, .quick-press .delet {
			font-family: 'icomoon';
			width: 37px;
			background: -webkit-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: -moz-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: -ms-linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			background: linear-gradient(top,rgb(246,246,240),rgb(232,232,232));
			border: 1px solid rgb(229,229,229);	
			color: rgb(102,102,102);				
			float: left;
			margin-right: 5px;
		}
		.quick-press .save:hover, .quick-press .delet:hover {
			background: -webkit-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: -moz-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: -ms-linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
			background: linear-gradient(top,rgb(232,232,232),rgb(246,246,240));
		}
		.quick-press .save:active, .quick-press .delet:active {
			background: -webkit-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: -moz-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: -ms-linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
			background: linear-gradient(top,rgb(228,228,228),rgb(210,210,210));
		}
		.quick-press .submit {
			float: right;
			width: 70px;
			border: 1px solid rgb(238,85,64);
			color: #fff;
			font-size: 16px;
			background: -webkit-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: -moz-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: -ms-linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
			background: linear-gradient(top,rgb(245,101,82),rgb(234,83,63));
		}
		.quick-press .submit:hover {
			background: -webkit-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: -moz-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: -ms-linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
			background: linear-gradient(top,rgb(220,85,70),rgb(210,65,53));
		}
		/*statusbar底部功能按钮*/
		.statusbar {
			position: absolute;
			bottom: 0;
			border-top: 1px solid rgb(235,235,235);
			width: 100%;
			padding: 0;
			margin: 0;
		}
		.statusbar li {
			list-style: none;
		}
		.statusbar a {
			color: rgb(102,102,102);
			text-decoration: none;
			text-align: center;
			display: block;
		}
		.statusbar a:hover {
			background-color: rgb(247,247,247);
		}
		.statusbar .profiles-setting, .statusbar .logout {
			float: right;
		}
		.statusbar .profiles-setting a, .statusbar .logout a {
			font-family: 'icomoon';
			width: 49px;
			height: 49px;
			line-height: 50px;
			border-left: 1px solid rgb(235,235,235);
		}
		@font-face {
			font-family: 'icomoon';
			src:url('fonts/icomoon.eot');
			src:url('fonts/icomoon.eot?#iefix') format('embedded-opentype'),
				url('fonts/icomoon.woff') format('woff'),
				url('fonts/icomoon.ttf') format('truetype'),
				url('fonts/icomoon.svg#icomoon') format('svg');
			font-weight: normal;
			font-style: normal;
		}
	</style>
		<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
	<script type="text/javascript">
	var teacherList = "";
	var data = "{}";
	function init(){
		
		$.ajax({
			url : "queryTeacher",
			type : "POST",
			data : 'data=' + data,
			success : function(data) {
				if (data.code == 200) {
					for (var i = 0; i < data.size; i++) {
						var obj = data.list[i];
						teacherList+="<option value='"+obj.tid+"'>"+obj.tName+"</option>";
					}
					$("#teacherList").append(teacherList);
				}
			},
			dataType : "json"
		});
	
	}
	</script>
</head>
<body onload="init()">
	<div class="page">
		<section class="demo">
			<div class="admin-panel clearfix">
				<div class="slidebar">
					<div class="logo">
						<a href=""><img alt="" src="img/logo.jpg" width="198px;" height="146px;"></a>
					</div>
					<ul>
						<li><a href="#dashboard" id="targeted">新增直播课</a></li>
						<li><a href="#posts">新增点播课</a></li>
						<li><a href="#media">审核评论</a></li>
						<li><a href="#pages">系列课显示</a></li>
						<li><a href="#links">新增老师</a></li>
						<li><a href="#comments">新增合作机构</a></li>
						<li><a href="#widgets">修改已购人数</a></li>
					</ul>
				</div>
				<div class="main">
					<ul class="topbar clearfix">
						<li><a href="#">q</a></li>
						<li><a href="#">p</a></li>
						<li><a href="#">o</a></li>
						<li><a href="#">f</a></li>
						<li><a href="#">n</a></li>
					</ul>
					<div class="mainContent clearfix">
						<div id="dashboard">
							<c:if test="${not empty account}">
	<div class="content container list_main clearfix">
		<form action="addCourse" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label>老&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师</label></td>
				<td>
					<select name="teacherName" id="teacherList">
					</select>
				</td>
			</tr>
			<tr>
				<td><label>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</label></td>
				<td><input type="text" name="price" placeholder="0.00"/></td>
			</tr>
			<tr>
				<td><label>开始时间</label></td>
				<td><input type="datetime-local" name="beginTime" value="2016-09-24T13:59:59"/></td>
			</tr>
			<tr>
				<td><label>持续时间</label></td>
				<td><input type="text" name="duration" placeholder="输入多少个小时"/></td>
			</tr>
			<tr>
				<td><label>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label></td>
				<td><input type="text" name="title" placeholder="例：物理强化课"/></td>
			</tr>
			<tr>
				<td><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label></td>
				<td>
					<select name="bigType">
						<option value="b1">高中</option>
						<option value="b2">初中</option>
						<!-- <option value="b3">高三年级</option> -->
						<option value="b4">小学</option>
						<!-- <option value="b5">一对一辅导</option> -->
					</select>
				</td>
			</tr>
			<tr>
				<td><label>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目</label></td>
				<td>
					<select name="smallType">
						<option value="s1">数学</option>
						<option value="s2">化学</option>
						<option value="s3">物理</option>
						<option value="s4">英语</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><label>封 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</label></td>
				<td><input type="file" name="cover" placeholder="上传图片大小推荐：255*144"/></td>
			</tr>
			<tr>
				<td><label>类 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label></td>
				<td>
					<select name="type">
						<option value="c1">资格证培训</option>
						<option value="c2">直播课程</option>
						<option value="c3">推荐课</option>
						<!-- <option value="c4">免费课程</option> -->
					</select>
				</td>
			</tr>
			<tr>
				<td><label>已购人数</label></td>
				<td><input type="text" name="totalNum" placeholder="500"/></td>
			</tr>
			<tr>
				<td><label>课程介绍</label></td>
				<td>
					<textarea rows="5" cols="30" name="provide" placeholder="课程的详细介绍"></textarea>
				</td>
			</tr>
			<tr>
				<td><label>课程目录</label></td>
				<td>
					<textarea rows="5" cols="30" name="directories" placeholder=""></textarea>
				</td>
			</tr>
			<tr>
				<td><label>听课须知</label></td>
				<td>
					<textarea rows="5" cols="30" name="announcement" placeholder="听课需要的准备"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="发布"/></td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
	<c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
						</div>
					</div>
					<ul class="statusbar">
						<li><a href=""></a></li>
						<li><a href=""></a></li>
						<li class="profiles-setting"><a href="">s</a></li>
						<li class="logout"><a href="">k</a></li>
					</ul>
				</div>
			</div>
			<script type="text/javascript">
				(function() {
					var initTarget = document.getElementById("targeted");
					initTarget.click();
				})();
			</script>
		</section>

	</div>
<div style="text-align:center;clear:both">

</div>	
</body>
</html>