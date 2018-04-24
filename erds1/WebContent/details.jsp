<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>老师详情</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/details.css">

    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/org-navbar-white_3f549bfd.css">
    <link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css">
    <!-- Bootstrap CSS -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
     <!-- jQuery -->
    <script src="js/jquery-1.11.3.min.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script>
    function GetQueryString(name)
    {
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
    var tid = GetQueryString("tid");
    function init(){
    	/* var url = window.location.href;
    	var param = url.split("?")[1];
    	var tid = param.split("=")[1]; */
    	var courseList = "";
    	$.ajax({
    		 url: "/erds/findTeacherById",
    		 type: "POST",
    		 data:'tid='+tid,
    		 success: function(data){
    			 if(data.code!=0){
    				var tname = data.teacher.tName;
    				var sign = data.teacher.sign;
    				var describle = data.teacher.describle;
    						$("#pic").attr("src",data.teacher.headimg);
    						$("#name").html(tname);
    						$("#word").html(sign);
    						$("#con").html(describle);
    			  }
    		},
    		dataType : "json"
    	});
}
</script>
</head>
<body onload="init()">
    <%@include file="header.jsp" %>

    <div class="container-fluid teacher-bg">
        <div class="teacher-main">
            <div class="teacher-img">
                <img src="" id="pic" alt="">
            </div>
            <div class="teacher-detail">
                <h3 class="teacher-name" id="name"></h3>
                <p class="teacher-word" id="word"></p>
            </div>
        </div>
    </div>

    <div class="teacher-intro">
        <h3 class="tilte">
        </h3>
        <p class="words" id="con">
        </p>
    </div>
<%@include file="footer.jsp" %>
</body>
</html>