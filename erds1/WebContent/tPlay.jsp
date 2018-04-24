<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>老师讲课界面</title>
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
	<script type="text/javascript" src="static/js/common/common.js"></script>
</head>
<body>
	<%@include file="top1.jsp" %>
	<div style="height: 600px;width: 1000px;margin: 0 auto;">
		<iframe id="play" src="<%=request.getSession().getAttribute("teacher_url") %>"  style="height: 100%;width: 100%;"></iframe>
	</div>
	<div class="div1">
		<%-- <%@include file="footer.jsp" %> --%>
	</div>
</body>
</html>