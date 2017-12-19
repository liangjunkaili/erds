<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>后台管理</title>
</head>
<body>
	<%@include file="common.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<%@include file="top.jsp" %>
			<div class="table-responsive show-ke" id="content0"
				style="margin-left: 300px; margin-top: 30px;">
				<c:if test="${not empty account }">
						<table class="table table-striped">
							<tr>
								<td width="100px;"><label>专业名称</label></td>
								<td><p id="zymc"></p></td>
							</tr>
							<tr>
									<td><label>学制</label></td>
									<td><p id="xz"></p></td>
								</tr>
							<tr>
								<td><label>授予学位</label></td>
								<td><p id="syxw"></p></td>
							</tr>
							<tr>
								<td><label>主要课程</label></td>
								<td><p id="zykc"></p></td>
							</tr>
							<tr>
								<td><label>专业概述</label></td>
								<td><p id="zygs"></p></td>
							</tr>
							<tr>
								<td><label>就业方向</label></td>
								<td><p id="jyfx"></p></td>
							</tr>
							<tr>
								<td><label>行业分析</label></td>
								<td><p id="hyfx"></p></td>
							</tr>
							<tr>
								<td><label>易混专业</label></td>
								<td><p id="yhzy"></p></td>
							</tr>
							<tr>
								<td><label>王牌院校</label></td>
								<td>
									<ul>
										<li>1北京大学</li>
										<li>2南京大学</li>
										<li>3中山大学</li>
										<li>4武汉大学</li>
									</ul>
								</td>
							</tr>
						</table>
				</c:if>

				<c:if test="${empty account }">
					<h1 align="center">
						请<a href="login_manager.jsp">登录</a>
					</h1>
				</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
var zymc = '<%=request.getParameter("zymc") %>'
	function init() {
		$.ajax({
			url : "getZyDetails",
			type : "POST",
			data : 'zymc='+zymc,
			success : function(data) {
				if (data.code == 200) {
					$("#zymc").html(data.list[0].zymc);
					$("#xz").html(data.list[0].xz);
					$("#syxw").html(data.list[0].xw);
					$("#zykc").html(data.list[0].zykc);
					$("#zygs").html(data.list[0].zygs);
					$("#jyfx").html(data.list[0].jyfx);
					$("#hyfx").html(data.list[0].hyfx);
					$("#yhzy").html(data.list[0].yhzy);
				}
			},
			dataType : "json"
		});

	}
	$(function(){
		$("#nav-gaokao1List").addClass("active");
		init();
	})
</script>

</body>
</html>
