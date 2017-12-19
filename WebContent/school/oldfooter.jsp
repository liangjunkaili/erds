<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>页面尾部</title>
<style type="text/css">
	.sm{
		display: none;
	}
</style>
</head>
<body>
	<div id="foot_bottom">
		<div class="foot_bottom_con container">
			<div class="float_left ">
				<a href="javascript:;" class="float_left">微信公众号:鄂尔多斯名师课堂</a> 
				<a href="javascript:;" class="float_left">客服QQ号&nbsp; 2738099389</a>
				<a href="javascript:;" class="float_left">提分热线:0477-2238359</a>
				<a href="javascript:;" class="float_left uc-2vm-pop" onmousemove="move()" onmouseout="out()">声明</a>
				<a href="login_parent.jsp" class="float_left">家长入口</a>
				<a href="login_teacher.jsp" class="float_left">教师入口</a>
			</div>
			<div class="float_right">
				<span>Copyright 鄂尔多斯名师课堂</span> <span>备案号:蒙ICP备16003311号</span>
			</div>
		</div>
	</div>
		<div style="text-align: center;" class="dd sm">
			<label style="font-size: 16px;">本网站部分资源摘自网络，如有侵权，请与小编联系。我们会尽快处理。</label>
		</div>
		<script type="text/javascript">
		/* $(function(){
			$('.uc-2vm-pop').mousemove(function(){
				$('.sm').removeClass('sm');
			});
			$('.uc-2vm-pop').mouseout(function(){
				$('.sm').addClass('sm');
			});
		}) */
		function move(){
			$('.dd').removeClass('sm');
		}
		function out(){
			$('.dd').addClass('sm');
		}
		</script>
</body>
</html>