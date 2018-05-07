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
						<form action="addCourse" method="post"
							enctype="multipart/form-data">
							<table class="table table-striped">
								<tr>
									<td><label>老&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;师</label></td>
									<td><select name="teacherName" id="teacherList">
									</select></td>
								</tr>
								<tr>
									<td><label>原&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;价</label></td>
									<td><input type="text" name="oprice" placeholder="0.00" /></td>
								</tr>
								<tr>
									<td><label>价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;格</label></td>
									<td><input type="text" name="price" placeholder="0.00" /></td>
								</tr>
								<tr>
									<td><label>开始时间</label></td>
									<td><input type="datetime-local" name="beginTime"
										value="2016-09-24T13:59:59" /></td>
								</tr>
								<tr>
									<td><label>上课日期</label></td>
									<td>
									<input type="hidden" name="weeks" value="" id="weeks">
										<div class="col-sm-10">
									        <label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w1"> 周一
											</label>
											<label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w2"> 周二
											</label>
											<label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w3"> 周三
											</label>
									        <label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w4"> 周四
											</label>
											<label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w5"> 周五
											</label>
											<label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w6"> 周六
											</label>
											<label class="checkbox-inline">
											  <input type="checkbox" name="week" value="w7"> 周日
											</label>
									    </div>
									    <script type="text/javascript">
									    $('input[type=checkbox]').change(function(){
										    $('#weeks').val($('input[type=checkbox]:checked').map(function(){return this.value}).get().join(','))
										})
									    </script>
									</td>
								</tr>
								<tr>
									<td><label>课&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时</label></td>
									<td><input type="text" name="count" placeholder="20课时" /></td>
								</tr>
								<tr>
									<td><label>持续时间</label></td>
									<td><input type="text" name="duration"
										placeholder="输入多少个小时" /></td>
								</tr>
								<tr>
									<td><label>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label></td>
									<td><input type="text" name="title" placeholder="例：物理强化课" /></td>
								</tr>
								<tr>
									<td><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label></td>
									<td><select name="bigType">
											<option value="b1">高中</option>
											<option value="b2">初中</option>
											<option value="b4">小学</option>
									</select></td>
								</tr>
								<tr>
									<td><label>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目</label></td>
									<td><select name="smallType">
											<option value="s1">数学</option>
											<option value="s2">化学</option>
											<option value="s3">物理</option>
											<option value="s4">英语</option>
											<option value="s6">语文</option>
									</select></td>
								</tr>
								<tr>
									<td><label>封
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</label></td>
									<td><input type="file" name="cover"
										placeholder="上传图片大小推荐：255*144" /></td>
								</tr>
								<tr>
									<td><label>试听视频</label></td>
									<td><input type="file" name="video"
										placeholder="上传大小最好为几分钟" /></td>
								</tr>
								<tr>
									<td><label>类
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label></td>
									<td><select name="type">
											<option value="c1">直播回放</option>
											<option value="c2">直播课程</option>
											<option value="c3">推荐课</option>
									</select></td>
								</tr>
								<tr>
									<td><label>已购人数</label></td>
									<td><input type="text" name="totalNum" placeholder="500" /></td>
								</tr>
								<tr>
									<td><label>课程介绍</label></td>
									<td>
										<textarea rows="5" cols="30" name="provide1" placeholder="课程的详细介绍"></textarea> 
										<input type="file" name="provide" />
										<input type="file" name="provide" />
										<input type="file" name="provide" />
									</td>
								</tr>
								<tr>
									<td><label>课程目录</label></td>
									<td><textarea rows="5" cols="30" name="directories" contenteditable="true"
											placeholder="1.第一课<br>2.第二课<br>3.第三课<br>"></textarea></td>
								</tr>
								<tr>
									<td><label>听课须知</label></td>
									<td><textarea rows="5" cols="30" name="announcement"
											placeholder="听课需要的准备"></textarea></td>
								</tr>
								<tr>
									<td><input type="reset" name="" value="重置" /></td>
									<td><input type="submit" name="" value="发布" /></td>
								</tr>
							</table>
						</form>
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
	var teacherList = "";
	var data = "{}";
	function init() {
		$(".show-ke").show();
		$(".hide-ke").hide();
		$.ajax({
			url : "queryTeacher",
			type : "POST",
			data : 'data=' + data,
			success : function(data) {
				if (data.code == 200) {
					for (var i = 0; i < data.size; i++) {
						var obj = data.list[i];
						teacherList += "<option value='"+obj.tid+"'>"
								+ obj.tName + "</option>";
					}
					$("#teacherList").append(teacherList);
					$("#teacherList1").append(teacherList);
				}
			},
			dataType : "json"
		});

	}
$(function(){
	$("#nav-addCourses").addClass("active");
	init();
})
</script>
</body>
</html>
