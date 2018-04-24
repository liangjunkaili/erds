<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta content="webkit" name="renderer">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>点播课</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
	<link rel="shortcut icon" type="image/x-icon" href="/images/ordosmskt.ico">
	<link type="text/css" rel="stylesheet" href="./video/global-min_93d8a1e2.css">
	<script type="text/javascript" id="bdshare_js" data="type=tools&amp;uid=6472089"></script>
	<link type="text/css" rel="stylesheet" href="./video/courseView-min_295b6136.css">
	<link rel="stylesheet" href="./video/share_style2_16.css">
	<link rel="stylesheet" href="./video/share_popup.css">
	<link rel="stylesheet" href="./video/select_share.css">
	<script src="js/jquery-1.11.3.min.js"></script>
		<!--ckplayer-->
	<script type="text/javascript" src="ckplayer/ckplayer.js" charset="utf-8"></script>
	<script type="text/javascript">
	Date.prototype.format = function(format){
		var o = {
		"M+" : this.getMonth()+1, //month
		"d+" : this.getDate(), //day
		"h+" : this.getHours(), //hour
		"m+" : this.getMinutes(), //minute
		"s+" : this.getSeconds(), //second
		"q+" : Math.floor((this.getMonth()+3)/3), //quarter
		"S" : this.getMilliseconds() //millisecond
		}

		if(/(y+)/.test(format)) {
		format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
		}

		for(var k in o) {
		if(new RegExp("("+ k +")").test(format)) {
		format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length));
		}
		}
		return format;
	}
	function getLocalTime(now) {     
		var   year=now.getFullYear();     
        var   month=now.getMonth()+1;     
        var   date=now.getDate();     
        var   hour=now.getHours();     
        var   minute=now.getMinutes();     
        var   second=now.getSeconds();     
        return   year+"-"+month+"-"+date+"   "+hour+":"+minute+":"+second;      
	}  
	var url = '<%=request.getParameter("url")%>';
	var sbid = '<%=request.getParameter("sbid")%>';
	var did = '<%=request.getParameter("did")%>';
	var nickname = '<%=request.getParameter("nickname")%>';
	var headimg = '<%=request.getSession().getAttribute("headimg")%>';
	var uid = '<%=request.getSession().getAttribute("uid")%>';
	var title="";
	function init(){
		$.ajax({
			 url: "/erds/findDemandById",
			 type: "POST",
			 data:"id="+did+"&sbid="+sbid+"&uid="+uid,
			 success: function(data){
				 if(data.code!=0){
					 var directories = data.demand.directories;
					 var accessory = data.demand.accessory;
					 if(accessory!=""){
						 var arr = accessory.split(",")
						 var downlist="";
						 for(var j=0;j<arr.length;j++){
							 downlist+= '<li><a id="donwload_allfile" class="u-btn down-all-btn" href="'+arr[j]+'">'+arr[j].substring(46)+'</a></li>';
						 }
						 $("#course_file").append(downlist);
					 }
					 $("#coverImg").attr("src",data.demand.coverImg);
					 $("#demand").attr("title",data.demand.title)
					 $("#demand").attr("href","kechen.jsp?cid="+data.demand.id)
					 $("#title").attr("title",data.demand.title)
					 $("#title").attr("href","kechen.jsp?cid="+data.demand.id)
					 $("#title").append(data.demand.title)
					 $("#tName").append(data.demand.tName)
					 $("#tName").attr("title",data.demand.tName)
					 $("#sbid").attr("value",sbid);
					 var subList='<li class="cvtb-MCK-course-content first">'+
					 	"<div class='cvtb-MCK-levelTop cvtb-MCK-overflow clearfix'><span class='cvtb-MCK-seqTitle' style='display:block;width:94%;'>" 
						+ data.demand.title + 
						"</span> <a href='javascript:;' class='cvtb-toggle'></a></div>";
					 for (var i = 0; i < data.subSize; i++) {
						 if(sbid==data.subList[i].id){
							 subList +="<a style='color:red;' href='enterDemands?roomId="+data.demand.roomId+"&did="+data.demand.id+"&uid="+uid
								+ "&username=&apos;" + nickname
								+ "&apos;&title=" + data.subList[i].title
								+ "&isfree=" + data.demand.isfree + "&url="
								+ data.subList[i].videoUrl + "&sbid="+data.subList[i].id+"'>" + 
								'<div class="cvtb-MCK-content-wrap">'+
								"<div class='cvtb-MCK-hour-item' data-seqtitle=" 
								+ data.subList[i].title + 
								"data-lessontype='1' data-id=" 
								+ data.subList[i].title + 
								"id='J_cvtb_course_content_'" 
								+ data.subList[i].title + 
								"title=" + data.subList[i].title + 
								"><div class='clearfix ml'><b class='cvtb-view-status progress'></b><b class='cvtb-MCK-ico cvtb-MCK-ico-com cvtb-MCK-ico-1'></b><span class='cvtb-MCK-hour-seqTitle '>" 
								+ data.subList[i].title + 
								"</span></div></div></div></a>";
							 title=data.subList[i].title;
						 }else{
							subList +="<a href='enterDemands?roomId="+data.demand.roomId+"&did="+data.demand.id+"&uid="+uid
								+ "&username=&apos;" + nickname
								+ "&apos;&title=" + data.subList[i].title
								+ "&isfree=" + data.demand.isfree + "&url="
								+ data.subList[i].videoUrl + "&sbid="+data.subList[i].id+"'>" + 
								'<div class="cvtb-MCK-content-wrap">'+
								"<div class='cvtb-MCK-hour-item' data-seqtitle=" 
								+ data.subList[i].title + 
								"data-lessontype='1' data-id=" 
								+ data.subList[i].title + 
								"id='J_cvtb_course_content_'" 
								+ data.subList[i].title + 
								"title=" + data.subList[i].title + 
								"><div class='clearfix ml'><b class='cvtb-view-status progress'></b><b class='cvtb-MCK-ico cvtb-MCK-ico-com cvtb-MCK-ico-1'></b><span class='cvtb-MCK-hour-seqTitle '>" 
								+ data.subList[i].title + 
								"</span></div></div></div></a>";
						 }
					}
					 subList+="</li>";
					$(".cvtb-MCK-course-list").html(subList);
					var comments="";
					for(var j=0;j<data.commentssize;j++){
						var o = data.comments[j];
						var t = o.time.time;
						var d =new Date(t);  
						comments+='<li class="cvtb-MCA-list-item" data-id="ask128401" id="J_cvtb_ask_128401">'+
								'<div class="j-ask-show-wrap" style="font-size: 14px;">'+
								'<div class="clearfix" style="word-break:break-all;">'+
									'<a class="cvtb-username cvtb-floatleft" target="_blank" href="JavaScript:;">'+o.nickname+':</a>'+
									'<a href="JavaScript:;" target="_blank" class="cvtb-title">'+o.content+'</a>'+
								'</div>'+
								'<div class="clearfix">'+
									'<div class="cvtb-list-item-pubtime">'+getLocalTime(d)+'</div>'+
								'</div>'+
								'</div>'+
								'</li>';
					}
					$(".cvtb-MCA-list").html(comments);
					var noteList ="";
					for(var k=0;k<data.noteSize;k++){
						var o = data.note[k];
						var ss = Math.floor(o.time/60)+":"+((o.time%60)/100).toFixed(2).slice(-2) ;
						noteList+='<li class="cvtb-MCN-list-item" data-id="202037" id="J_cvtb_note_202037" data-list-type="my">'+
							'<div class="j-note-show-wrap">'+
							'<div class="clearfix">'+
								'<a class="cvtb-username cvtb-floatleft" target="_blank" href="ableskywx_k2vq3geb">梁军</a>'+
								'<div class="cvtb-MCN-timestamp cvtb-floatright j-note-show-timestamp">'+
									'<div class="cvtb-MCN-timestamp-rect">'+
									'<div class="cvtb-MCN-timestamp-rect-triangle"></div>'+
									'</div>'+
									'<div class="cvtb-MCN-timestamp-time" onclick="setTime('+o.time+')">'+ss+'</div>'+
								'</div>'+
							'</div>'+
							'<div class="j-top-ico cvtb-list-item-text " data-id="202037">'+o.content+'</div>'+
							'<div class="clearfix">'+
							'<div class="cvtb-list-item-pubtime">'+o.submitTime+'</div>'+
							'</div></div></li>';
					}
					$("#noteList").html(noteList);
				}
			}
		});
		
		
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
				 //if(data.code==200){
					 alert(data.message);
					 $("#content").val("");
					 init();
				// }
			 }
		});
		video.currentTime =69;
	}
	</script>
</head>

<body class="courseView" onload="init()">
<div style="height: 100px;position: absolute; top: 0px; bottom: 38px; left: 0; right: 337px;background-color: #e7e7e7;">
		<img src="img/logo.gif" width="234px" height="89px" >
		<img src="img/kh.gif" width="234px" height="89px" >
</div>
	<div class="course-box clearfix" id="J_coursePlayBox">
		<div id="a1" style="position: absolute; top: 100px; bottom: 38px; left: 0; right: 0;">
		</div>
	</div>
	<div class="course-box-toolbar-wrap clearfix">
		<div class="course-view-toolbar clearfix">
			<div class="cvtb-top">
				<a class="link" href="" target="_blank" title="" id="demand"><img class="cvtb-top-img" alt="" src="" id="coverImg"></a>
				<ul class="cvtb-floatleft">
					<li class="cvtb-top-list-item"><a href="index.jsp">返回首页</a></li>
					<li class="cvtb-top-list-item"><a class="cvtb-top-link cvtb-text-ellipsis" href="" target="_blank" title="" id="title"></a></li>
					<li class="cvtb-top-list-item">老师:<span class="cvtb-top-from cvtb-text-ellipsis" title="" id="tName"></span></li>
				</ul>
			</div>
			<div class="cvtb-main cvtb-absolute has-data" id="cvtbMain">
				<!-- main tab start -->
				<ul id="toolbar_tab" class="cvtb-main-tab clearfix hasfile">
					<li class="course current" data-content=".cvtb-main-content-kecheng">目录</li>
					<li class="file" data-content=".cvtb-main-content-file">附件</li>
					<li class="note" data-content=".cvtb-main-content-note">笔记</li>
					<li class="ask last" data-content=".cvtb-main-content-ask">评论</li>
				</ul>
				<!-- end. main tab -->

				<!-- content for tab.course start -->
				<div class="cvtb-main-content-kecheng cvtb-absolute" id="cvtbMainContent">
					<ul class="cvtb-MCK-course-list cvtb-scroll-y cvtb-absolute">
					</ul>
				</div>
				<!-- end. content for tab.course -->
				
				<div id="course_file_con" class="cvtb-main-content-file cvtb-absolute course-file-con" style="display: none;">
					<!-- <p id="file_down_all" class="u-down-all show">
						<a id="donwload_allfile" class="u-btn down-all-btn" href="">附件下载</a>
						<a id="donwload_allfile" class="u-btn down-all-btn" href="">附件下载</a>
						<a id="donwload_allfile" class="u-btn down-all-btn" href="">附件下载</a>
					</p> -->
					<ul id="course_file" class="m-file-list" style="height: 336px;">
					</ul>
				</div>

				<!-- content for tab.note start -->
				<div class="cvtb-main-content-note cvtb-absolute" style="display: none;">
					<!-- note tab start -->
					<ul class="cvtb-MCN-tab clearfix">
						<li class="cvtb-tab-item my" data-content=".cvtb-MCN-my">我的笔记</li>
						<li class="cvtb-tab-item public" data-content=".cvtb-MCN-public">所有笔记</li>
					</ul>
					<!-- end. note tab -->

					<!-- my note start -->
					<div class="cvtb-MCN-my cvtb-absolute">
						<div class="cvtb-MCN-add-note">
							<div class="cvtb-editor">
								<textarea class="cvtb-editor-textarea j-add-note-ta" placeholder="请记录自己的问题..." id="bj_content"></textarea>
								<div class="cvtb-editor-char-counter"><span class="j-used">0</span>/<span class="j-max-allowed">1000</span></div>
							</div>
							<div class="clearfix">
								<span class="u-btn cvtb-floatright j-note-submit-add" onclick="bj()">提交</span>
								<!-- <label class="cvtb-MCN-AN-label"><input type="checkbox" class="cvtb-MCN-AN-privacy-checkbox"><span class="cvtb-MCN-AN-label-span">私密</span></label> -->
								<label class="cvtb-MCN-AN-label"><input type="checkbox" class="cvtb-MCN-AN-Tmstp-checbox" checked="checked"><span class="cvtb-MCN-AN-label-span">记住现在的播放时间</span></label>
									<div class="cvtb-MCN-timestamp-time" id="current_time">00:00:00</div>
							</div>
							<!-- <div class="cvtb-error cvtb-floatleft">è¯·è¾å¥ç¬è®°åå®¹</div> -->
						</div>
						<!-- <div class="cvtb-nodata">æ¨è¿æ²¡ææ·»å ç¬è®°!</div> -->
						<ul class="cvtb-MCN-list cvtb-scroll-y cvtb-absolute j-note-list-my" id="noteList">
						</ul>
					</div>
					<!-- end. my note -->

					<!-- public note start -->
					<!-- <div class="cvtb-MCN-public cvtb-absolute">
						<div class="cvtb-nodata">ææ å¬å¼ç¬è®°!</div>
						<ul class="cvtb-MCN-list cvtb-scroll-y cvtb-absolute j-note-list-public"></ul>
						<div style="display: none;" class="cvtb-absolute cvtb-node-top-info" id="J_cvtb_node_top_info"></div>
					</div> -->
					<!-- end. all note -->
				</div>
				<!-- end. content for tab.note -->

				<!-- content for tab.ask -->
				<div class="cvtb-main-content-ask cvtb-absolute" style="display: none;">
					<!-- submit new ask -->
					<div class="cvtb-MCA-add-ask">
						<h3 class="cvtb-MCA-AA-title">有什么问题赶紧提问吧</h3>
						<div class="cvtb-editor cvtb-MCA-editor">
							<input id="sbid" type="hidden" value="" name="sbid"/>
							<textarea class="cvtb-editor-textarea j-add-ask-ta" id="content"></textarea>
							<div class="cvtb-editor-char-counter"><span class="j-used">0</span>/<span class="j-max-allowed">300</span></div>
						</div>
						<div class="clearfix j-operations">
							<a href="javascript:void(0);" class="j-ask-submit-add u-btn" onclick="pl()">提交评论</a>
							<div class="cvtb-error"></div>
						</div>
					</div>
					<!--end. submit new ask -->

					<!-- ask tab -->
					<ul class="cvtb-MCA-tab">
						<li class="cvtb-tab-item all" style="cursor: pointer;" data-content=".cvtb-MCA-all">所有评论</li>
						<!-- <li class="cvtb-tab-item mine" style="cursor: pointer;" data-content=".cvtb-MCA-mine">我的回答</li> -->
					</ul>
					<!--end. ask tab -->

					<div class="cvtb-MCA-all cvtb-absolute">
						<div class="cvtb-nodata">è¿æ²¡æä»»ä½æé®å¦!</div>
						<ul class="cvtb-MCA-list cvtb-scroll-y cvtb-absolute j-ask-list-all">
						</ul>
					</div>
					<!-- end. all ask -->


					<!-- my ask list start -->
					<div class="cvtb-MCA-mine cvtb-absolute">
						<div class="cvtb-nodata">æ¨è¿æ²¡æåè¡¨ä»»ä½æé®å¦!</div>
						<ul class="cvtb-MCA-list cvtb-scroll-y cvtb-absolute j-ask-list-mine"></ul>
					</div>
					<!-- end of my ask -->
				</div>
				<!-- End. content for tab.ask -->
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$("#toolbar_tab li").click(function () {
		$(this).parent().find("li").removeClass("current")
		$(this).addClass("current");
	})
	$(".course").click(function () {
		$("#cvtbMainContent").show();
		$("#course_file_con").hide();
		$(".cvtb-main-content-note").hide();
		$(".cvtb-main-content-ask").hide();
	})
	$(".file").click(function () {
		$("#cvtbMainContent").hide();
		$("#course_file_con").show();
		$(".cvtb-main-content-note").hide();
		$(".cvtb-main-content-ask").hide();
	})
	$(".note").click(function () {
		$("#cvtbMainContent").hide();
		$("#course_file_con").hide();
		$(".cvtb-main-content-note").show();
		$(".cvtb-main-content-ask").hide();
	})
	$(".ask").click(function () {
		$("#cvtbMainContent").hide();
		$("#course_file_con").hide();
		$(".cvtb-main-content-note").hide();
		$(".cvtb-main-content-ask").show();
	})
	//æ­æ¾å¨è®¾ç½®
	var flashvars = {
		f: url,
		p: 1,
		h: 3
	};
	var params = {
		bgcolor: '#FFF',
		allowFullScreen: true,
		allowScriptAccess: 'always',
		wmode: 'transparent'
	};
	var v=[url+'->video/mp4'];
	var bool = true;
	if(url.match('swf')=='swf'){
		bool = false;
	}
	CKobject.embed(url, 'a1', 'ckplayer_a1', '100%', '100%', bool, flashvars, v, params);
	$("body").bind('contextmenu',function(){
		return false;
	})
	var video = document.getElementById("ckplayer_a1");
	video.poster="images/123.gif";
	function bj(){
		var bj_content = $("#bj_content").val();
		var currentTime = video.currentTime;
		var ss = Math.floor(currentTime/60)+":"+((currentTime%60)/100).toFixed(2).slice(-2) ;
		$("#current_time").html(ss);
		$.ajax({
			 url: "addNote",
			 type: "POST",
			 data:'sbid='+sbid+"&content="+bj_content+"&time="+currentTime+"&url="+url+"&did="+did+"&title="+title,
			 success: function(data){
				 //if(data.code==200){
					 alert(data.message);
					 $("#bj_content").val("");
					 init();
				 //}
			 }
		})
	}
	function setTime(i){
		video.currentTime =i;
	}
	</script>
</body>
</html>