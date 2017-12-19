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
					<form action="updateDemandN" method="post"
						enctype="multipart/form-data">
						<table class="table table-striped">
							<tr>
							<input type="text" name="id" hidden="true"/>
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
								<td><label>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label></td>
								<td><input type="text" name="title" /></td>
							</tr>
							<tr>
								<td><label>知&nbsp;&nbsp;&nbsp;识&nbsp;&nbsp;&nbsp;点</label></td>
								<td><input type="text" name="knowledgePoint" /></td>
							</tr>
							<tr>
								<td><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label></td>
								<td><select name="bigType">
										<option value="b1">高中</option>
										<option value="b2">初中</option>
										<!-- <option value="b3">高三年级</option> -->
										<option value="b4">小学</option>
										<!-- <option value="b5">一对一辅导</option> -->
								</select></td>
							</tr>
							<tr>
								<td><label>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目</label></td>
								<td><select name="smallType">
										<option value="s1">数学</option>
										<option value="s2">化学</option>
										<option value="s3">物理</option>
										<option value="s4">英语</option>
										<option value="s5">其他</option>
								</select></td>
							</tr>
							<tr>
								<td><label>封
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</label></td>
								<td><input type="file" name="cover"
									placeholder="上传图片大小推荐：255*144" /></td>
							</tr>
							<tr>
								<td><label>类
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label></td>
								<td><select name="type">
										<option value="c1">直播回放</option>
										<option value="c4">同步课程</option>
										<option value="c3">推荐课</option>
										<!-- <option value="c2">直播课程</option> -->
								</select></td>
							</tr>
							<tr>
								<td><label>报班中心</label></td>
								<td><select name="isCenter">
										<option value="1">是</option>
										<option value="0">不是</option>
								</select></td>
							</tr>
							<tr>
								<td><label>已购人数</label></td>
								<td><input placeholder="500" type="text" name="totalNum" /></td>
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
								<td><textarea rows="5" cols="30" name="directories"></textarea>
								</td>
							</tr>
							<tr>
								<td><label>听课须知</label></td>
								<td><textarea placeholder="听课需要的准备" rows="5" cols="30"
										name="announcement"></textarea></td>
							</tr>
							<tr>
								<td><label>附件</label></td>
								<td id="accessory">
									<ul id="readyaccessory">
									
									</ul>
									<input type="file" name="accessory" />
								</td>
								<td><a style="font-size: 24px;"  id="addaccessory">+</a></td>
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
<script type="text/javascript">
	var teacherList = "";
	var id = '<%=request.getParameter("id") %>';
	function init() {
		$.ajax({
			url : "findDemandByDid",
			type : "POST",
			data : 'id=' + id,
			success : function(data) {
				if (data.code == 200) {
					for (var i = 0; i < data.size; i++) {
						var obj = data.teachers[i];
						teacherList += "<option value='"+obj.tid+","+obj.tName+"'>"
								+ obj.tName + "</option>";
					}
					$("#teacherList").append(teacherList);
					var demand = data.demand;
					$(":input[name=id]").val(demand.id);
					$(":input[name=teacherName]").val(demand.tid+","+demand.tName);
					$(":input[name=price]").val(demand.price);
					$(":input[name=oprice]").val(demand.oprice);
					$(":input[name=title]").val(demand.title);
					$(":input[name=knowledgePoint]").val(demand.knowledgePoint);
					$(":input[name=bigType]").val(demand.bigType);
					$(":input[name=smallType]").val(demand.smallType);
					$(":input[name=cover]").val(demand.cover);
					$(":input[name=type]").val(demand.type);
					$(":input[name=isCenter]").val(demand.isCenter);
					$(":input[name=totalNum]").val(demand.totalNum);
					$(":input[name=provide1]").val(demand.provide1);
					//$(":input[name=provide]").val(demand.provide);
					$(":input[name=directories]").val(demand.directories);
					$(":input[name=announcement]").val(demand.announcement);
					var arr = demand.accessory.split(",");
					var accessoryList = '';
					if(arr.length>0){
						for(var i=0;i<arr.length;i++){
							accessoryList+="<li>"+arr[i]+"</li>";
						}
					$("#readyaccessory").append(accessoryList);
					}
					
				}
			},
			dataType : "json"
		});

	}
	$(function(){
		$("#nav-addDemand").addClass("active");
		init();
	})
	$("#addaccessory").click(function(){
		$("#accessory").append('<input type="file" name="accessory"/>');
	})
</script>

</body>
</html>
