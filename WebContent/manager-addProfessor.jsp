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
<link href="bootstrap/dist/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
					<div id="container" style="position: relative;">
                            <a class="btn btn-default btn-lg " id="pickfiles" href="#" style="position: relative; z-index: 1;">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>选择文件</span>
                            </a>
                   	<div id="html5_1b3mjk9aartb3pdcuvdp65f33_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 171px; height: 46px; overflow: hidden; z-index: 0;">
                   		<input id="html5_1b3mjk9aartb3pdcuvdp65f33" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept="" type="file">
                   	</div>
                   </div>
                    <div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
					    <label id="progressValue"></label>
					  </div>
					</div>
						<form action="saveProfessor" method="post"
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
									<td>
									<div class="input-group date form_datetime col-md-5" data-date="1979-09-16T05:25:07Z" data-date-format="yyyy-mm-ddThh:ii:ss" data-link-field="dtp_input1">
							                    <input class="form-control" size="16" type="text" value="" readonly>
							                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
												<span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
							                </div>
											<input type="hidden" id="dtp_input1" value="" name="beginTime"/><br/>
									</td>
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
									</select></td>
								</tr>
								<tr>
									<td><label>封
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;面</label></td>
									<td><input type="file" name="cover"
										placeholder="上传图片大小推荐：255*144" /></td>
								</tr>
								<tr>
									<td><label>视频</label></td>
									<td><input type="text" name="video" id="video" value=""></td>
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
	<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="static/js/common/plupload/moxie.js"></script>
<script src="static/js/common/plupload/plupload.dev.js"></script>
<script src="static/js/common/qiniu.min.js"></script>
	<script type="text/javascript">
	$('.form_datetime').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		forceParse: 0,
        showMeridian: 1
    });
	
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
	$("#nav-addProfessor").addClass("active");
	init();
	 var uploader = Qiniu.uploader({
	        runtimes: 'html5,flash,html4',
	        browse_button: 'pickfiles',
	        container: 'container',
	        drop_element: 'container',
	        max_file_size: '1000mb',
	        flash_swf_url: 'static/js/common/plupload/Moxie.swf',
	        dragdrop: true,
	        chunk_size: '4mb',
	        multi_selection: !(mOxie.Env.OS.toLowerCase()==="ios"),
	        uptoken_url: 'uploadToken',
	        domain: 'http://oev6hl3jh.bkt.clouddn.com/',
	        get_new_uptoken: false,
	        auto_start: true,
	        log_level: 5,
	        init: {
	            'FilesAdded': function(up, files) {
	            },
	            'BeforeUpload': function(up, file) {
	            },
	            'UploadProgress': function(up, file) {
	            	$(".progress-bar").width(file.percent+"%")
	            	$("#progressValue").html(file.percent+"%");
	            },
	            'UploadComplete': function() {
	            },
	            'FileUploaded': function(up, file, info) {
	            	var domain = up.getOption('domain');
	            	var obj = JSON.parse(info)
	                var sourceLink = domain + obj.key; 
	                $("#video").attr("value",sourceLink);
	            },
	            'Error': function(up, err, errTip) {
	            }
	        }
	    });
})
</script>
<script type="text/javascript" src="static/js/common/dist/ui.js"></script>
<script type="text/javascript" src="static/js/common/dist/qiniu.js"></script>
<script type="text/javascript" src="static/js/common/dist/highlight.js"></script>
<script type="text/javascript">hljs.initHighlightingOnLoad();</script>
</body>
</html>
