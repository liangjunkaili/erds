<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="shortcut icon" type="image/x-icon" href="">
           <%@include file="res.jsp" %>
   <link type="text/css" rel="stylesheet" href="./kecheng/global-min_93d8a1e2.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/jquery.fileupload-ui_799a92f7.css">

    <link type="text/css" rel="stylesheet" href="./kecheng/guide-index_3e961da.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/headTemplate_2685fd74.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/colpick_1675f31c.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/support_3e733f46.css">
    <style>
        body {
            padding-top: 0px !important;
        }

       /*  .site-nav {
            display: none;
        } */
    </style>
    <link type="text/css" rel="stylesheet" href="./kecheng/common_33d20238.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/questionModule_5590d75c.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/grid-frame_12c65863.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/user-detail_4f8061d9.css">
    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/index.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <style id="poshytip-css-poshytip" type="text/css">div.poshytip {
        visibility: hidden;
        position: absolute;
        top: 0;
        left: 0;
    }

    div.poshytip table, div.poshytip td {
        margin: 0;
        font-family: inherit;
        font-size: inherit;
        font-weight: inherit;
        font-style: inherit;
        font-variant: inherit;
    }

    div.poshytip td.tip-bg-image span {
        display: block;
        font: 1px/1px sans-serif;
        height: 10px;
        width: 10px;
        overflow: hidden;
    }

    div.poshytip td.tip-right {
        background-position: 100% 0;
    }

    div.poshytip td.tip-bottom {
        background-position: 100% 100%;
    }

    div.poshytip td.tip-left {
        background-position: 0 100%;
    }

    div.poshytip div.tip-inner {
        background-position: -10px -10px;
    }

    div.poshytip div.tip-arrow {
        visibility: hidden;
        position: absolute;
        overflow: hidden;
        font: 1px/1px sans-serif;
    }</style>
    <style id="poshytip-css-poshytip-left" type="text/css">div.poshytip-left {
        visibility: hidden;
        position: absolute;
        top: 0;
        left: 0;
    }

    div.poshytip-left table, div.poshytip-left td {
        margin: 0;
        font-family: inherit;
        font-size: inherit;
        font-weight: inherit;
        font-style: inherit;
        font-variant: inherit;
    }

    div.poshytip-left td.tip-bg-image span {
        display: block;
        font: 1px/1px sans-serif;
        height: 10px;
        width: 10px;
        overflow: hidden;
    }

    div.poshytip-left td.tip-right {
        background-position: 100% 0;
    }

    div.poshytip-left td.tip-bottom {
        background-position: 100% 100%;
    }

    div.poshytip-left td.tip-left {
        background-position: 0 100%;
    }

    div.poshytip-left div.tip-inner {
        background-position: -10px -10px;
    }

    div.poshytip-left div.tip-arrow {
        visibility: hidden;
        position: absolute;
        overflow: hidden;
        font: 1px/1px sans-serif;
    }</style>
    <style id="poshytip-css-poshytip-right" type="text/css">div.poshytip-right {
        visibility: hidden;
        position: absolute;
        top: 0;
        left: 0;
    }

    div.poshytip-right table, div.poshytip-right td {
        margin: 0;
        font-family: inherit;
        font-size: inherit;
        font-weight: inherit;
        font-style: inherit;
        font-variant: inherit;
    }

    div.poshytip-right td.tip-bg-image span {
        display: block;
        font: 1px/1px sans-serif;
        height: 10px;
        width: 10px;
        overflow: hidden;
    }

    div.poshytip-right td.tip-right {
        background-position: 100% 0;
    }

    div.poshytip-right td.tip-bottom {
        background-position: 100% 100%;
    }

    div.poshytip-right td.tip-left {
        background-position: 0 100%;
    }

    div.poshytip-right div.tip-inner {
        background-position: -10px -10px;
    }

    div.poshytip-right div.tip-arrow {
        visibility: hidden;
        position: absolute;
        overflow: hidden;
        font: 1px/1px sans-serif;
    }</style>
    <script type="text/javascript" src="static/js/common/common.js"></script>
    <link rel="stylesheet" href="./kecheng/share_style0_24.css">
    <script type="text/javascript">
    function GetQueryString(name)
    {
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
    var cid = GetQueryString("cid");
    var former = window.location.href;
    function init(){
    	var uid = <%=request.getSession().getAttribute("uid")%>;
    	var nickname = encodeURIComponent('<%=request.getSession().getAttribute("username")%>');
    	var courseList = "";
    	var teachername="";
    	$.ajax({
    		 url: "/erds/findCourseById",
    		 type: "POST",
    		 data:'cid='+cid+'&uid='+uid,
    		 success: function(data){
    			 if(data.code!=0){
    				$("#J_videoImg").attr("src",data.course.coverImg);
    				$("#title").attr("title",data.course.title);
    				$("#title").append(data.course.title);
    				$("#price").append(data.course.price+"RMB");
    				$("#t_img").attr("src",data.teacher.headimg);
    				$("#tName").append(data.teacher.tName);
    				$("#tSign").append(data.teacher.sign);
    				$("#t_content").append(data.teacher.describle);
    				$("#myvideo").attr("src",data.course.videourl);
    				$("#j-timetable").append(data.course.directories);
    				$("#tab1").append(data.course.title);
    				var newTime = new Date(data.course.beginTime.time);
    				$("#beginTime").append("开课时间:"+newTime.pattern("yyyy-MM-dd hh:mm:ss"));
    				var cTime=subDate(data.course.beginTime);
    				$("#endTime").append(cTime);
    				var provide = data.course.provide;
    				var provideImg="";
    				var provideContent=provide.split("|")[0];
    				var arr = provide.split("|")[1].split(",");
    				for(var i=0;i<arr.length;i++){
    					provideImg +="<img alt='' src='"+arr[i]+"'>";
    				}
    				$("#provide").append(provideImg);
					$("#provideContent").append(provideContent);
					$("#announcement").append(data.course.announcement);
					if(data.parRecord<=0){
						$("#J_buynow").attr("href","payForCourse?paytype=WX_NATIVE&fee="+data.course.price+"&title="+data.course.title+"&roomid="+data.course.roomId+"&cid="+data.course.series+"&uid="+uid+"&former="+former);
						$("#J_buynow").append("立即抢购");
					}else{
						$("#J_buynow").attr("href","enterCourse?roomId="+data.course.roomId+"&cid="+data.course.id+"&uid="+uid+"&username='"+nickname+"'"+"&former="+former);
						$("#J_buynow").append("进入课堂");
					}
    			 }
    						
    		},
    		dataType : "json"
    		});
    	}
    </script>
</head>
<body onload="init()">
<%@include file="header.jsp" %>
<div class="wrapper userDetailWrap">
    <!-- header start -->
    <div class="detail-header">
        <section class="clearfix">
            <div id="J_videoWrap" class="preview left canBroadcast">
                <img id="J_videoImg" src="" alt="" >
            </div>
            <div class="left info">
                <div class="title">
                    <h1 title="" id="title"></h1>
                </div>
                <div class="clearfix" style="font-size: 24px;">
	               <span id="beginTime"></span><br>
	               <span id="endTime"></span>
                </div>
				<div class="mb20 price-wrap ">
                    <div class="clearfix">
                        <div class="price left clearfix">
                            <span class="fs30" id="price"></span>
						</div>
                    </div>
                </div>
                <div class="action-wrap clearfix" style="">
                    <a id="J_buynow" href="" class="buynowbtn all-orange fs20"></a>
                </div>
            </div>
        </section>
    </div>
    <!-- header end -->
    <!-- main start -->
    <div class="detail-main clearfix">
        <!-- mainleft start  -->
        <div class="main-left">
            <div class="mainLeftNav">
                <a href="#tab1"  style="width:227px;" class="active">课程目录</a>
                <a href="#tab2"  style="width:227px;" class="">课程介绍</a>
                <a href="#tab3"  style="width:228px;" >听课须知</a>
                <a href="#tab4"  style="width:228px;" class="">学生评价</a>
            </div>

            <div class="bgwhite clist" data-name="lessonList">
                <h3 id="tab1"></h3>
                <div class="course-list txt">
                	<p id="j-timetable"></p>
                </div>
            </div>
            <div class="bgwhite couserDes clist" data-name="courseDesc">
                <h3 id="tab2">课程介绍</h3>
                <div class="txt" id="provide">
					<p id="provideContent" class="txt"></p>
				</div>
            </div>
            <div class="message-wrap bgwhite clist" data-name="courseQuestion">
                <h3 id="tab3">听课须知</h3>
                <div class="content study-interflow" style="padding: 10px" id="announcement"></div>
            </div>
            <!-- 学员评价 -->
            <div class="clist bgwhite" data-name="studentevaluation" id="J_evaluation_wrap">
                <h3 id="tab4">学员评价</h3>
                <div class="content">
                    <div id="commentList" class="data-list data-tpl" style="padding-left:20px;">
                        <div class="content-box row">
                            <div class="data-box row">
								在购买后在课表页进行评价
                            </div>
                        </div>
                        <!-- <div class="content study-interflow">
                            <form class="answer-form row">
                                <div class="answer-filed" id="jAnswer">
                                    <div><textarea  class="origin-color" maxlength="300" placeholder="评价"></textarea></div>
                                </div>
                                <a class="submitBtn submit-btn" id="askQesBtn">发布</a></form>
                        </div> -->
                    </div>
                </div>
            </div>
            <div>
            </div>
        </div>
        <!-- mainleft end -->
        <!--asideright start -->
        <div class="main-right">
            <div class="teacher-show bgwhite">
                <h3>授课教师</h3>
                <ul>
                    <li class="teacher-list  fs14 fcz">
                        <dl class="clearfix mb20">
                            <dt>
                                <img src="" id="t_img">
                            </dt>
                            <dd class="teacher-name fs18" id="tName"></dd>
                            <dd><span class="fcc" id="tSign"></span></dd>
                        </dl>
                        <div class="teacher-detail">
                            <div class="fcc lh3" >
                            <pre id="t_content"></pre>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
		<!-- 	<div class="teacher_page_enter_hd">
						<a class="teacher_page_enter_btn" href="" id="enterRoom" style="padding:10px;border:1px solid black;margin-left:20%">
						<span class="teacher_page_icon"></span>
						<span class="teacher_page_enter_word_hd">进入课堂</span>
						</a>
					</div> -->
					<div>
						<video id="myvideo" width="280px" height="167px" style="margin-top:15px"
						src=""   poster="" preload controls ></video>
					</div>
        </div>
        <!--asideright end -->
    </div>
</div>
<!--通用底部  -->
<%@include file="footer.jsp" %>
</body>
</html>