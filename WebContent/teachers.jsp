<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>更多老师</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link rel="stylesheet" type="text/css" href="./css/teachers.css">

    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/org-navbar-white_3f549bfd.css">
    <link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css">
    <!-- Bootstrap CSS -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="http://code.jquery.com/jquery.js"></script>
    <!-- Bootstrap JavaScript -->
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script type="text/javascript">
    var list = "[";
    var json="";
    function listteacher() {
    	var teacherList = "";
    	$.ajax({
    			url : "/erds/queryTeacher",
    			type : "POST",
    			data : 'data={}',
    			success : function(data) {
    				if (data.code == 200) {
    					var teacher = data.list;
    					for(var l=0;l<data.size;l++){
    						var lbt = "{'img':'"+teacher[l].headimg+"','href':'details.jsp?tid="+teacher[l].tid+"','tName':'"+teacher[l].tName+"'},";
    						list+=lbt;
    					}
    					list=list.substring(0,list.length-1);
    					list=list+"]";
    					json = eval('(' + list + ')');
    				}
    				$.each(json,function(name,value) {
    					var add = '<div class="col-xs-6 col-sm-6 col-md-3 col-lg-3 detail">\<a href="'+value.href+'">\<div class="teacher">\<div class="teacher-img">\<img src="'+value.img+'" data-src="#" alt="">\</div>\<div class="teacher-f clearfix">\<p class="teacher-name pull-left">'+value.tName+'</p>\</div>\</div>\</a>\</div>';
    					$("#data-list").append(add);
    				});
    			},
    			dataType : "json"
    		});

    }
    </script>
</head>
<body onload="listteacher()">
   <%@include file="header.jsp" %>
    <div class="container">
        <ul class="t-ct">
            <div class="row" id="data-list">
			
            </div>
        </ul>
    </div>
  <%@include file="footer.jsp" %>
</body>
</html>