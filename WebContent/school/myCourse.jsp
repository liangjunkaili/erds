<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>我的课程</title>
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

.t1
        {
            clear: both;
            border: 1px solid #c9dae4;
        }
        .t1 tr th
        {
            color: #0d487b;
            line-height: 28px;
            border-bottom: 1px solid #9cb6cf;
            border-top: 1px solid #e9edf3;
            font-weight: normal;
            text-shadow: #e6ecf3 1px 1px 0px;
            padding-left: 5px;
            padding-right: 5px;
        }
        .t1 tr td
        {
            border-bottom: 1px solid #e9e9e9;
            padding-bottom: 5px;
            padding-top: 5px;
            color: #444;
            border-top: 1px solid #FFFFFF;
            padding-left: 5px;
            padding-right: 5px;
            word-break: break-all;
        }
        /* white-space:nowrap; text-overflow:ellipsis; */
        tr.alt td
        {
            background: #ecf6fc; /*这行将给所有的tr加上背景色*/
        }
        tr.over td
        {
            background: #bcd4ec; /*这个将是鼠标高亮行的背景色*/
        }
        td a{
        color: red;
        }
</style>
<script type="text/javascript">
function getMyInfo(){
	//init_a();
	var courseList;
	var data = "{'uid':'"+<%=request.getSession().getAttribute("uid")%>+"'}";	 
	$.ajax({
			url : "getMyCourse",
			type : "POST",
			data : 'data='+data,
			success : function(data) {
				if (data.code == 200) {
					var size = data.size;
					for(var i=0;i<size;i++){
						var obj = data.list[i];
						if(obj.dd==1){
						courseList+="<tr align='center'><td>"+obj.id+"</td><td><a href='detail.jsp?cid="+obj.id+"'>"+obj.title+"</a></td><td>"+obj.price+"</td><td>"+obj.tName+"</td><td>"+obj.provide+"</td></tr>";
						}else if(obj.dd==2){
						courseList+="<tr align='center'><td>"+obj.id+"</td><td><a href='detail2.jsp?cid="+obj.id+"'>"+obj.title+"</a></td><td>"+obj.price+"</td><td>"+obj.tName+"</td><td>"+obj.provide+"</td></tr>";
						}
					}
					$("#list").append(courseList);
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
				<li id="j-today-lesson-leftnav" ><a
					href="studentInfo.jsp">个人资料</a></li>
				<li id="j-my-course-leftnav" class="select"><a
					href="myCourse.jsp">我的课程</a></li>
			</ul>
	</div>
	<div class="right" style="float: left;width: 70%;height: 100%;">
		<table width="100%" id="ListArea" border="0" class="t1" align="center" cellpadding="0"
        cellspacing="0">
			<thead>
				<tr>
					<th>编号</th><th>课程名称</th><th>开课时间</th><th>主讲人</th><th>课程时长</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
	</div>
</div>

</body>
</html>