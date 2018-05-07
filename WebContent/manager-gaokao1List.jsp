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
			<div>
				<div class="table-responsive show-ke" id="content0"
					style="margin-left: 300px; margin-top: 30px;">
					<c:if test="${not empty account }">
							<table class="table table-striped">
								<tr>
									<td><label>批次</label></td>
									<td>
									<select name="pici" id="pici">
										<option value="本科提前A">本科提前A</option>
										<option value="本科提前B">本科提前B</option>
										<option value="本科一批">本科一批</option>
										<option value="本科一批B">本科一批B</option>
										<option value="本科二批">本科二批</option>
										<option value="本科二批B">本科二批B</option>
										<option value="专科提前">专科提前</option>
									</select></td>
									<td><label>科类</label></td>
									<td>
									<select id="kelei">
										<option value="普通文科">普通文科</option>
										<option value="普通理科">普通理科</option>
									</select></td>
								</tr>
								<tr>
									<td><label>专业</label></td>
									<td>
										<input type="text" id="zymc"/>
									</td>
								</tr>
								<tr>
									<td><label>最低分位次</label></td>
									<td>
										<input type="text" id="min_precedence"/>
									</td>
								</tr>
								<tr>
									<td><label>分差</label></td>
									<td>
										<input type="text" id="min"/>
									</td>
									<td>
										<button id="chaxun">查询</button>
									</td>
								</tr>
							</table>
							<table class="table table-striped" >
								<tr>
									<td>批次</td>
									<td>科类</td>
									<td>院校</td>
									<td>专业代号</td>
									<td>专业名称</td>
									<td>最高分</td>
									<td>最低分</td>
									<td>最低分位次</td>
									<td>录取人数</td>
									<td>计划性质</td>
								</tr>
								<tbody id="courseList"></tbody>
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
	</div>
<script type="text/javascript">
	function init(a,b,c,d) {
	var courseList = "";
		$(".show-ke").show();
		$(".hide-ke").hide();
		$.ajax({
			url : "getSchoolDetails",
			type : "POST",
			data : "pici="+a+"&kelei="+b+"&min_precedence="+c+"&min="+d,
			success : function(data) {
				if (data.code == 200) {
					for (var i = 0; i < data.size; i++) {
						var obj = data.list[i];
						courseList += "<tr><td>"+obj.pici+"</td><td>"+obj.kelei+"</td><td><a href='manager-zyDetail.jsp?zymc="+obj.major_name+"'>"+obj.yuanxiao+"</a></td><td>"+obj.major_code+
						"</td><td>"+obj.major_name+"</td><td>"+obj.max+"</td><td>"+obj.min+"</td><td>"+obj.min_precedence+
						"</td><td>"+obj.num+"</td><td>"+obj.nature+"</td></tr>";
					}
					$("#courseList").html(courseList);
				}
			},
			dataType : "json"
		});

	}
	$("#chaxun").on("click",function(){
		var pici = $("#pici option:selected").val(); 
		var kelei = $("#kelei option:selected").val();
		var min_precedence = $("#min_precedence").val();
		var min = $("#min").val();
		init(pici,kelei,min_precedence,min);
	})
	$(function(){
		$("#nav-gaokao1List").addClass("active");
		init();
	})
</script>

</body>
</html>
