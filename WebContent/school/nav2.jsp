<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员界面</title>
<script type="text/javascript">

function logout(){
	$.ajax({
		url : "logout",
		type : "POST",
		success : function(data) {
			if (data.code == 200) {
				window.location.href="index.jsp";
			}
		},
		dataType : "json"
	});
}
</script>
<style type="text/css">
.category_tab_ul li{
		list-style: none;
		display: inline-block;
	}
</style>
</head>
<body>
	<div id="nav_head">
		<div class="nav_head_con container">
			<h1 id="logo">
				<a href="index.jsp" class="nav_head_logo j-head-live-link" title=""><img
					src="img/logo.jpg" alt="" width="150px" height="70px"></a>
			</h1>
			<div class="nav_head_course float_right">
				<ul class="course_list">
					<li class="" ><a id="j-all-course-btn" href="addCourse.jsp">新增直播课</a>
					</li>
					<li class="cet" ><a href="addDemand2.jsp" >新增点播课</a>
					</li>
					<li class="ky" ><a href="checkComments.jsp" >审核评论</a>
					</li>
					<li class="ky"><a href="more_manager.jsp">系列课显示</a></li>
					<li class="my" ><a href="addTeacher.jsp" >新增老师</a>
					</li>
					<li class="my" ><a href="addpartners.jsp" >新增合作机构</a>
					</li>
					<li class="my" ><a href="updateTotalNum.jsp" >修改已购人数</a>
					</li>
					<li class="my" ><a href="more_manager3.jsp" >老师信息</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="line" style="height: 40px;">
	
	</div>
</body>
</html>