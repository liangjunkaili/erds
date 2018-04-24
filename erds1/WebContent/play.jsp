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
<title>直播界面</title>
<meta name="keywords" content="" />
<meta name="description"
	content="" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
<style type="text/css">
/* .div1{position:absolute;bottom:0px;width:100%;} */
</style>
<script type="text/javascript">
	function init(){
		//init_a();
	}
</script>
</head>
<body onload="init()">
	<%@include file="header.jsp" %>
	<div style="height: 600px;width: 1000px;margin: 0 auto;padding-top: -50px;">
		<iframe id="play" src="<%=request.getSession().getAttribute("url") %>"  style="height: 100%;width: 100%;"></iframe>
	</div>
	<div class="div1">
	
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>
