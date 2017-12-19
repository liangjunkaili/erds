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
<body >
<%@include file="common.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<%@include file="top.jsp" %>
			<div class="table-responsive show-ke" id="content0" style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account}">
	<div class="content container list_main clearfix">
		<form action="saveExam" method="post" enctype="multipart/form-data">
		<table class="table table-striped">
			<tr>
				<td><label>年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级</label></td>
				<td><select name="grade">
						<option value="c1">初一</option>
						<option value="c2">初二</option>
						<option value="c3">初三</option>
						<option value="g1">高一</option>
						<option value="g2">高二</option>
						<option value="g3">高三</option>
					</select>
				 </td>
			</tr>
			<tr>
				<td><label>学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;科</label></td>
				<td><select name="subject">
						<option value="wl">物理</option>
						<option value="sx">数学</option>
						<option value="hx">化学</option>
						<option value="yy">英语</option>
						<option value="yw">语文</option>
					</select>
				 </td>
			</tr>
			<tr>
				<td><label>难&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;度</label></td>
				<td><select name="difficulty">
						<option value="D">不限</option>
						<option value="A">偏难</option>
						<option value="B">中等</option>
						<option value="C">一般</option>
					</select>
				 </td>
			</tr>
			<tr>
				<td><label>题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型</label></td>
				<td><select name="questions">
						<option value="a">单选</option>
						<option value="b">多选</option>
						<option value="c">判断</option>
					</select>
				 </td>
			</tr>
			<tr>
				<td>题&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;目</td>
				<td>
				<textarea name="title" rows="5" cols="50" placeholder="Sorry, I am too busy now. If I ____ time, I would certainly go for an outing with you."></textarea>
				</td>
			</tr>
			<tr>
				<td><label>知&nbsp;&nbsp;&nbsp;识&nbsp;&nbsp;&nbsp;点</label></td>
				<td><input type="text" name="knowledgePoint" /></td>
			</tr>
			<tr>
				<td>选&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;&nbsp;A</td>
				<td>
				<input type="text" name="optiona"  placeholder="have had">
				</td>
			</tr><tr>
				<td>选&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;&nbsp;B</td>
				<td>
				<input type="text" name="optionb"  placeholder="had had">
				</td>
			</tr><tr>
				<td>选&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;&nbsp;C</td>
				<td>
				<input type="text" name="optionc"  placeholder="have">
				</td>
			</tr><tr>
				<td>选&nbsp;&nbsp;&nbsp;项&nbsp;&nbsp;&nbsp;D</td>
				<td>
				<input type="text" name="optiond"  placeholder="had">
				</td>
			</tr><tr>
				<td>答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案</td>
				<td>
				<input type="text" name="answer"  placeholder="had">
				</td>
			</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="添加"/></td>
			</tr>
		</table>
		</form>
	</div>
	</c:if>
	<c:if test="${empty account }">
		<h1 align="center">请<a href="login_manager.jsp">登录</a></h1>
	</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
$(function(){
	$("#nav-addExam").addClass("active");
})
</script>

</body>
</html>
