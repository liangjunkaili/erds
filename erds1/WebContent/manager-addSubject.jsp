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
<script src="static/js/common/plupload/moxie.js"></script>
<script src="static/js/common/plupload/plupload.dev.js"></script>
<script src="static/js/common/qiniu.min.js"></script>
</head>
<body>
<%@include file="common.jsp" %>
	<div class="container-fluid">
		<div class="row">
			<%@include file="top.jsp" %>
			<div class="table-responsive show-ke" id="content0" style="margin-left: 300px;margin-top: 30px;">
				<c:if test="${not empty account}">
				
				 <div id="container" style="position: relative;">
                            <a class="btn btn-default btn-lg " id="pickfiles" href="#" style="position: relative; z-index: 1;">
                                <i class="glyphicon glyphicon-plus"></i>
                                <span>选择文件</span>
                            </a>
                   <div id="html5_1b3mjk9aartb3pdcuvdp65f33_container" class="moxie-shim moxie-shim-html5" style="position: absolute; top: 0px; left: 0px; width: 171px; height: 46px; overflow: hidden; z-index: 0;"><input id="html5_1b3mjk9aartb3pdcuvdp65f33" style="font-size: 999px; opacity: 0; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;" multiple="" accept="" type="file"></div></div>
                    <div class="progress">
					  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
					    <label id="progressValue"></label>
					  </div>
					</div>
	<div class="content container list_main clearfix">
		<form action="addSubject" method="post" enctype="multipart/form-data">
		<input type="hidden" name="did" id="did" value="">
		<label>当前点播课为:</label><input type="text" name="title1" id="title" value="">
		<table class="table table-striped">
			<tr>
				<td><label>视 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;频</label></td>
				<td><input type="text" name="video" id="video" value=""></td>
			</tr>
			<tr>
				<td><label>主&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题</label></td>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
					<td><label>是否免费</label></td>
					<td><select name="free" >
							<option value="none">-选择-</option>
							<option value="免费">免费</option>
							<option value="不免费">不免费</option>
					</select></td>
				</tr>
			<tr>
				<td><input type="reset" name="" value="重置"/></td>
				<td><input type="submit" name="" value="发布"/></td>
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
function init(){
	var did = <%=request.getParameter("did")%>;
	var title = '<%=request.getParameter("title1")%>';
	$("#did").attr("value",did);
	$("#title").attr("value",title);
}
$(function() {
	$("#nav-DemandList").addClass("active");
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
});
</script>
<script type="text/javascript" src="static/js/common/dist/ui.js"></script>
<script type="text/javascript" src="static/js/common/dist/qiniu.js"></script>
<script type="text/javascript" src="static/js/common/dist/highlight.js"></script>
<script type="text/javascript">hljs.initHighlightingOnLoad();</script>
</body>
</html>
