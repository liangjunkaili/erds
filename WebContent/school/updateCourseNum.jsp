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
<title>鄂尔多斯名师讲堂_修改课程已购数目</title>
<meta name="keywords" content="" />
<meta name="description"
	content="" />
<link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
	<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript">
	
</script>
<style type="text/css">
.div1{position:absolute;bottom:0px;width:100%;}
.content{width:800px;margin: 0 auto;}

table{border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#efefef;}
th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
th{font-weight:bold;background:#ccc;}
</style>
<script type="text/javascript">

</script>
</head>
<body >
	<%@include file="nav2.jsp"%>
	<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String num = request.getParameter("num");

%>
	<div class="content container list_main clearfix">
		<form action="updateCourseNum" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label>课程名称</label></td>
				<td><input type="text" name="name" value="<%=name %>" placeholder=""/>
				<input type ="hidden" name="id" value="<%=id %>"/>
			</tr>
			<tr>
				<td><label>数目</label></td>
				<td><input type="text" name="num" value="<%=num%>"/></td>
			</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="提交" onclick="update()"/></td>
			</tr>
		</table>
		</form>
	</div>
	<div class="div1">
		<%-- <%@include file="footer.jsp" %> --%>
	</div>
</body>
</html>
