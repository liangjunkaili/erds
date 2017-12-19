<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>家长监控系统</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
var classList="";
var sid = '<%=request.getSession().getAttribute("child")%>';
	function init(){
		$.ajax({
			url : "querySSRecord",
			type : "POST",
			data:"sid="+sid,
			success : function(data) {
				if (data.code == 200) {
					var size = data.size;
					for(var i=0;i<size;i++){
						var obj = data.list[i];
						classList+="<tr><td>"+(i+1)+"</td><td>"+obj.sid+"</td><td>"+obj.sName+"</td><td>"+obj.studyTime+"</td>"+
						"<td>"+obj.content+"</td></tr>";
					}
				}
				$("#classList").append(classList);
			},
			dataType : "json"
		});
	}
</script>
</head>
<body onload="init()">
	<%@include file="top_parent.jsp"%>
	<div style="width:990px;margin: 0 auto;">			
        <div class="row">
			<table class="table table-hover">
			  <thead>
			    <tr>
			      <th>编号</th>
			      <th>用户名</th>
			      <th>昵称</th>
			      <th>学习时间</th>
			      <th>学习内容</th>
			    </tr>
			  </thead>
			  <tbody id="classList">
			  </tbody>
			</table>
        </div>
	</div>	<!--/.main-->
<%@include file="footer.jsp"%>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script>

		$(window).on('resize', function () {
		  if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
		})
		$(window).on('resize', function () {
		  if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
		})
	</script>	
</body>

</html>
