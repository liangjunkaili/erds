<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.beecloud.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<title>课程详情</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet"
	href="./static/css/common/public_2347803.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/detail/detailpc_d14fbe7.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/payment/pay_1f4a5f5.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/components/sidebar_d58d76f.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="./static/css/web/account/account_bb3c9f3.css~v=1.2.0.css" />
<script type="text/javascript"
	src="./static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="./static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
<script type="text/javascript" src="static/js/common/common.js"></script>
<script type="text/javascript" id="bdshare_js" data="type=slide&img=0&pos=right&uid=11824" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
var bds_config = {"bdTop":155};
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + new Date().getHours();
</script>
<script type="text/javascript">

function paySwitch(that) {
    var li = that.parentNode.children;
    for (var i = 0; i < li.length; i++) {
        li[i].className = "";
        li[i].childNodes[1].removeAttribute("checked");
    }
    console.log(li);
    that.className = "clicked";
    that.childNodes[1].setAttribute("checked", "checked");
}

function comment() {
	
	var tid = $("#tid").val();
	var c = $("#content").val();
	if(c==''){
		window.alert("评论不能为空!")
		return false;
	}
	var sid = encodeURIComponent("<%=request.getSession().getAttribute("uid")%>");
	var nickname = encodeURIComponent("<%=request.getSession().getAttribute("username")%>");
	var headimg = encodeURIComponent("<%=request.getSession().getAttribute("headimg")%>");
	if(sid==""||sid==null||sid=="undefined"){
		alert("请先登录!")
		return;
	}
	var data = "{'content':'"+c+"','tid':'"+tid+"','sid':'"+sid+"','nickname':'"+nickname+"','headimg':'"+headimg+"'}";	
	$.ajax({
		 url: "addComment",
		 type: "POST",
		 data:'data='+data,
	});
	location.reload();
}

function init(){
	
	var url = window.location.href;
	var param = url.split("?")[1];
	var code = param.split("=")[1];
	var uid = <%=request.getSession().getAttribute("uid")%>;
	//var data = "{'cid':'"+code+"','uid':'"+uid+"'}";	
	var courseList = "";
	var teachername="";
	$.ajax({
		 url: "findCourseById",
		 type: "POST",
		 data:'cid='+code+'&uid='+uid,
		 success: function(data){
			 if(data.code!=0){
				//data.size+"--"+data.list[0].tName+data.list[0].bigType
				var newTime = new Date(data.course.beginTime.time);
				var cTime=subDate(data.course.beginTime);
				var nickname = encodeURIComponent('<%=request.getSession().getAttribute("username")%>');
				var tname = data.teacher.tName;
				var sign = data.teacher.sign;
				var describle = data.teacher.describle;
				var provide = data.course.provide;
				var directories = data.course.directories;
				var announcement = data.course.announcement;
				var provideImg="";
				var provideContent=provide.split("|")[0];
				$("#enterRoom").attr("href","enterCourse?roomId="+data.course.roomId+"&cid="+data.course.id+"&uid="+<%=request.getSession().getAttribute("uid")%>+"&username='"+nickname+"'");
				$("#headimg").attr("src",data.teacher.headimg);
				$("#tid").attr("value",data.teacher.tid);
				$("#myvideo").attr("src",data.course.videourl);
				var arr = provide.split("|")[1].split(",");
				for(var i=0;i<arr.length;i++){
					provideImg +="<img alt='' src='"+arr[i]+"'>";
				}
				if(data.parRecord<=0){
					courseList +="<div class='container clearfix'>"+
					"<div class='detail_intro_left'>"+
						"<div class='lesson_bgpic' style='background-image: url("+data.course.coverImg+")'>"+
						"</div>"+
					"</div>"+
					"<div class='detail_intro_right'>"+
						"<div class='detail_title_hd'>"+
							"<h2 class='font_dark'>"+data.course.title+"</h2>"+
					"	</div>"+
						"<div class='detail_time_hd font_mid_grey'>"+
							"<span>开课时间:</span> <span class='detail_time'>"+newTime.pattern("yyyy-MM-dd hh:mm:ss")+"</span> <span class='detail_lesson_num'>"+data.course.duration+"课时</span>"+
						"</div>"+
						"<div class='detail_price_hd font_price'>"+
							"<span class='rmb font_price'>RMB</span> <span class='detail_price font_price'>"+data.course.price+"</span> "+
							"</span>"+
						"</div>"+
						"<div class='detail_btn_hd'>"+
						"<a href='payForCourse?paytype=WX_NATIVE&fee="+data.course.price+"&title="+data.course.title+"&roomid="+data.course.roomId+"&cid="+data.course.id+"&uid="+<%=request.getSession().getAttribute("uid")%>
						+ "' id='j-buy' class='j_btn_control btn_normal_orange'>立即抢购</a>"
										+ "</div>"
										+ "<div class='detail_quota_cd_hd'>"
										+ "<span class='quota_hd font_mid_grey'> 购买人数: <em>"
										+ data.course.totalNum
										+ "人</em>"
										+ "</span> <span id='j-cd' class='cd_hd font_mid_grey'>"
										+ "<div id='j-sellEnd-time' data-sellend='1469894340000' style='display: none'></div>"
										+ "<div id='j-sellStart-time' data-sellstart='1466254800000' style='display: none'></div> <span></span> "
										+ cTime
										+ "</span>"
										+ "</div>"
										+ "</div>"
										+ "</div>";
				}else{
					courseList +="<div class='container clearfix'>"+
					"<div class='detail_intro_left'>"+
						"<div class='lesson_bgpic' style='background-image: url("+data.course.coverImg+")'>"+
						"</div>"+
					"</div>"+
					"<div class='detail_intro_right'>"+
						"<div class='detail_title_hd'>"+
							"<h2 class='font_dark'>"+data.course.title+"</h2>"+
					"	</div>"+
						"<div class='detail_time_hd font_mid_grey'>"+
							"<span>开课时间:</span> <span class='detail_time'>"+newTime.pattern("yyyy-MM-dd hh:mm:ss")+"</span> <span class='detail_lesson_num'>"+data.course.duration+"课时</span>"+
						"</div>"+
						"<div class='detail_price_hd font_price'>"+
							"<span class='rmb font_price'>RMB</span> <span class='detail_price font_price'>"+data.course.price+"</span> "+
							"</span>"+
						"</div>"+
						"<div class='detail_btn_hd' font-size='20px'>"+
							"<b>已购买</b>"
										+ "</div>"
										+ "<div class='detail_quota_cd_hd'>"
										+ "<span class='quota_hd font_mid_grey'> 购买人数: <em>"
										+ data.course.totalNum
										+ "人</em>"
										+ "</span> <span id='j-cd' class='cd_hd font_mid_grey'>"
										+ "<div id='j-sellEnd-time' data-sellend='1469894340000' style='display: none'></div>"
										+ "<div id='j-sellStart-time' data-sellstart='1466254800000' style='display: none'></div> <span>距离结束</span> "
										+ cTime
										+ "</span>"
										+ "</div>"
										+ "</div>"
										+ "</div>";
				}
				
				
					teachername+=tname;
			 				}
						$("#detail_intro_pc").append(courseList);
						$("#tname").append(teachername);
						var s = sign;//要展示的字符串
						if(sign.length>12){
						  s=sign.substring(0,12)+"...";
						}
						$("#sign").append(sign);
						$("#describle").append(describle);
						$("#j-timetable").append(directories);
						$("#provide").append(provideImg);
						$("#provideContent").append(provideContent);
						$("#announcement").append(announcement);
					},
					dataType : "json"
				});
	}
</script>
</head>
<body onload="init()">
	<%
		/*  BeeCloud.registerApp("e2458dd2-d339-4a4e-848f-2067443fc7fe", "a0c3a157-3417-4eae-8a33-895cd44e8c44", null, null);
		BeeCloud.setSandbox(true); */

		BeeCloud.registerApp("2fc29555-49b7-415e-80f0-c5d06f5e799d", null, "ccb86190-c3c0-43ba-a4c9-29371c00a651",
				"3db27c52-220d-41f5-ba05-bf398febb5c0");
	%>
	<%@include file="top1.jsp"%>
	<div class="detail_intro_pc" id="detail_intro_pc"></div>
	<div class="detail_main_hd">
		<div class="container clearfix">
			<div class="main_left">
				<div class="main_content_hd">
					<div class="tab_hd">
						<ul id="detail_tab" class="tabs clearfix">
							<li><a class="tab active" href="#intro">课程介绍</a></li>
							<li><a class="tab" href="#catelog">课表目录</a></li>
							<li><a class="tab" href="#attention">听课须知</a></li>
							<li class="last-one"><a class="tab " href="#comment">
									学生评价 <em class="j-comment-num font_red">(--)</em>
							</a></li>
						</ul>
					</div>
					<div class="course_content_section">
						<div id="intro" class="anchor"></div>
						<div class="content_node font_mid_grey">课程介绍</div>
						<div class="content_data_hd" id="provide">
							<p id="provideContent"></p>
						</div>
						<div class="exp_time_hd_detail"></div>
					</div>
					<div class="course_content_section">
						<div id="catelog" class="anchor"></div>
						<div class="content_node font_mid_grey">课程目录</div>
						<div class="content_data_hd">
							<p id="j-timetable">
							</p>
						</div>
						<div class="exp_time_hd_detail"></div>
					</div>
					<div class="course_content_section course_class_notes">
						<div id="attention" class="anchor"></div>
						<div class="content_node font_mid_grey">听课须知</div>
						<div id="announcement" class="content_data_hd"></div>
						<div class="exp_time_hd_detail"></div>
					</div>
				</div>
				<div class="comment_hd">
					<div id="comment" class="anchor"></div>
					<div class="comment_t font_mid_grey">
						学生评价<em class="j-comment-num">（--）</em>
						<div class="remind float_right font_mid_grey">在购买后在课表页进行评价</div>
					</div>
					<ul id="j-comment-ul" class="commnet_ul">
					</ul>
					<div class="more_comment_hd">
						<div class="cm_btn_hd">
							<a id="j-cm-btn" class="font_mid_grey"
								href="commentsList.jsp">查看更多评论</a>
						</div>
						<div class="cm_btn_hd">
							<textarea rows="5" cols="50" id="content" class="contents" onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"></textarea>
							<input type="hidden" id="tid" value="" />
							<a href="javascript:;" onclick="comment()">提交</a>
						</div>
					</div>
				</div>
			</div>
			<div class="main_right">
				<div class="teacher_info_wrap">
					<div class="detail_block_hd no_border_bottom">
						<div class="teacher_info_hd clearfix">
							<img id="headimg" src="" alt="" />
							<div class="detail_teacher_info">
								<div id="tname" class="detail_teacher_name font_dark"></div>
								<div id="sign" class="detail_teacher_title font_mid_grey"></div>
							</div>
						</div>
						<div  class="detail_teacher_intro font_mid_grey">
						<pre id="describle"></pre>
						</div>
					</div>
					<div class="teacher_page_enter_hd">
						<a class="teacher_page_enter_btn" href="" id="enterRoom"> <span
							class="teacher_page_icon"></span> <span
							class="teacher_page_enter_word_hd">已经付费，进入课堂</span>
						</a>
					</div>
					<div>
						<video id="myvideo" width="310px" height="167px" src=""   
						poster="" preload controls >
						</video>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <%@include file="footer.jsp"%> --%>
</body>
</html>
