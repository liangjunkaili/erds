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
			<div class="table-responsive show-ke" id="content0" style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account }">
	<div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>用户名</th><th>答案</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
	</div>
	</c:if>
	
	 <c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
			</div>
		</div>
	</div>

<script type="text/javascript">
function init(){
	
	var courseList1 = "";
	var data = "{}";
	$.ajax({
			url : "queryAnswer",
			type : "POST",
			data : "data="+data,
			success : function(data) {
				if (data.code == 200) {
					var l = data.size;
					for (var i = 0; i < l; i++) {
						var obj = data.list[i];
						var name =obj.option;
						var arr=name.split(",");
						var str="";
						for(j in arr){
							str+=arr[j];
							//如果i+1是5的倍数，则添加,
							if((parseInt(j)+1)%5==0){
							str+="||";
							}
						}
						courseList1+="<tr><td>"+obj.uid+"</td><td>"+str+"</td></tr>";
					}
				}
				$("#list").append(courseList1);
			},
			dataType : "json"
		});

}
$(function(){
	$("#nav-answer").addClass("active");
	init();
})
</script>
</body>
</html>
