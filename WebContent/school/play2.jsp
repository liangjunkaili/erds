<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE >
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<title>点播界面</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<link href="video/video-js.css" rel="stylesheet" type="text/css">
<script src="video/video.js"></script>
<!-- <script src="http://siteapp.baidu.com/static/webappservice/uaredirect.js" type="text/javascript"></script>
    <script type="text/javascript">
           uaredirect("direct.html");//这里的网址请改为你手机站的网址
    </script> -->
<script>
   videojs.options.flash.swf = "video/video-js.swf";
 </script>
<script type="text/javascript">
	function init(){
		//init_a();
		var url = '<%=request.getParameter("url")%>';
		var sbid = '<%=request.getParameter("sbid")%>';
		var did = '<%=request.getParameter("did")%>';
		var nickname = '<%=request.getParameter("nickname")%>';
		var headimg = '<%=request.getSession().getAttribute("headimg")%>';
		var data = "{'id':'"+did+"','sbid':'"+sbid+"'}";
		var catalog = "";
		var subList = "";
		var commentsList = "";
		$.ajax({
			 url: "findDemandById",
			 type: "POST",
			 data:'data='+data,
			 success: function(data){
				 if(data.code!=0){
					 var directories = data.demand.directories;
					 
					 for (var i = 0; i < data.commentssize; i++) {
							var o = data.comments[i];
							commentsList += "<li style='margin: 50px;display: block;'><div style='float: left;'><img style='border-radius:25px;' alt='qwe' src='"+o.headimg+"' width='50px' height='50px'/></div>"
							+"<div style=' position: relative;left: 15px;'>"
							+"<h3>"+o.nickname+"</h3><br/>"
							+o.content
							+"</div></li>";
							
						}
					 $("#comments").append(commentsList);
					 
					 for(var i =0;i<data.subSize;i++){
						if(sbid==data.subList[i].id){
							subList += "  <a align='left' style='color:blue;' href='enterDemands?roomId="+data.demand.roomId+"&did="+data.demand.id+"&uid="+<%=request.getSession().getAttribute("uid")%>
							+ "&username=&apos;" + nickname
														+ "&apos;&title=" + data.subList[i].title
														+ "&isfree=" + data.demand.isfree + "&url="
														+ data.subList[i].videoUrl + "&sbid="+data.subList[i].id+"'>" + "课时"
														+ (i + 1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.subList[i].title
														+ "</a>";
						}else{
							subList += "  <a align='left' href='enterDemands?roomId="+data.demand.roomId+"&did="+data.demand.id+"&uid="+<%=request.getSession().getAttribute("uid")%>
							+ "&username=&apos;" + nickname
														+ "&apos;&title=" + data.subList[i].title
														+ "&isfree=" + data.demand.isfree + "&url="
														+ data.subList[i].videoUrl + "&sbid="+data.subList[i].id+"'>" + "课时"
														+ (i + 1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + data.subList[i].title
														+ "</a>";
						}	
					}
				}

				$("#ml").append(subList);
			}

		});
		//var res = "<source src='"+url+"' type='video/mp4'>";
		//$("#my_video_1").append(res);
		$("#my_video_1").attr("src", url);
		$("#tx").attr("src",headimg);
		$("#sbid").attr("value",sbid);
		
		
		
	}
	
	function pl() {
		var content = $("#content").val();
		if(content == null || content == "" || content == undefined){
			alert("评论不能为空！");
			return;
		}
		var sbid = $("#sbid").val();
		var data = "{'content':'"+content+"','sbid':'"+sbid+"'}";
		$.ajax({
			 url: "addComment",
			 type: "POST",
			 data:'data='+data,
			 success: function(data){
				 if(data.code==200){
					 alert(data.message);
					 $("#content").val("");
				 }
			 }
		});

	}
	
</script>
<style type="text/css">
#catalog {
	float: right;
}


#ml a {
	float:none;
	font-size : 14px;
	color: #222222;
	text-decoration: none;
	display: block;
	padding: 6px 10px 4px;
	margin: 2px;
	font-size: 14px;
}

#ml a:HOVER {
	font-size: 18px;
}

#title {
	float: left;
	padding: 6px 10px 4px;
	margin: 2px;
}

</style>

</head>
<body>
	<%@include file="top1.jsp"%>
	<div style="height: 564px; width: 1000px; margin: 0 auto;">
		<video id="my_video_1" src="" controls="controls" preload="auto" poster="images/123.gif"
			width="1000px" height="564px"></video>
	</div>
	<div style="width: 1000px;margin: 0 auto;">
		<div style="width: 70%;height: 300px;float: left;">
			<div align="center">
			<h2>评论</h2>
				<table>
				<tr>
						<td><img style="margin-left: 5px;border-radius:23px;margin-bottom: 10px;" id="tx" alt="头像" src="" width="50px" height="50px"></td>
				</tr>
					<tr>
						<td>&nbsp;<textarea style="resize: none;" id="content" rows="6" cols="70" name="content"></textarea></td>
					</tr>
					<tr>
					<input id="sbid" type="hidden" value="" name="sbid"/>
						<br/><td colspan="2" align="right"><a href="javascript:;" onclick="pl();">评论</a></td>
					</tr>
				</table>
				<div >
				
				</div>
			</div>
			<div id="commentslist">
				<ul id="comments">
				</ul>
			</div>
		</div>
		<div id="ml" style="width: 30%;height: 300px;float: left;">
			<h1 align="center">目&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;录</h1><br/>
		</div>
	</div>
	<%-- <div class="div1">
		<%@include file="footer.jsp"%>
	</div> --%>
	<script type="text/javascript">
	window.onload = function(){
		init();
	    //去掉默认的contextmenu事件，否则会和右键事件同时出现。
	    document.oncontextmenu = function(e){
	        e.preventDefault();
	    };
	    document.getElementById("my_video_1").onmousedown = function(e){
	        if(e.button ==2){
	        	console.log("你点了右键");
	        }else if(e.button ==0){
	        	console.log("你点了左键");
	        }else if(e.button ==1){
	        	console.log("你点了滚轮");
	        }
	    }
	}
	</script>
</body>
</html>
