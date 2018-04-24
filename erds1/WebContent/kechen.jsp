<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="cn.beecloud.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="shortcut icon" type="image/x-icon" href="">
    <link rel="search" type="application/opensearchdescription+xml" title=""
          href="#">
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

        /* .site-nav {
            display: none;
        } */
    </style>
    <link type="text/css" rel="stylesheet" href="./kecheng/common_33d20238.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/questionModule_5590d75c.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/grid-frame_12c65863.css">
    <link type="text/css" rel="stylesheet" href="./kecheng/user-detail_4f8061d9.css">
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
    <link rel="stylesheet" href="./kecheng/share_style0_24.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/js/common/common.js"></script>
    <script type="text/javascript">
    function GetQueryString(name)
    {
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
    var id = GetQueryString("cid");
    var uid = <%=request.getSession().getAttribute("uid")%>;
    var url = window.location.href;
	var former = url.substr(url.lastIndexOf('/')+1);
    var subList="";
    function init(){
    	$.ajax({
   		 url: "/erds/findDemandById",
   		 type: "POST",
   		 data:'id='+id+'&uid='+uid,
   		 success: function(data){
   			 if(data.code!=0){
   				var nickname = encodeURIComponent('<%=request.getSession().getAttribute("username")%>');
   				var tname = data.teacher.tName;
				var sign = data.teacher.sign;
				var describle = data.teacher.describle;
				var provide = data.demand.provide;
				var directories = data.demand.directories;
				var announcement = data.demand.announcement;
				var provideImg="";
				var provideContent=provide.split("|")[0];
				var pp =provide.split("|")[1];
				if(pp!=undefined){
					var arr = pp.split(",");
					for(var i=0;i<arr.length;i++){
						provideImg +="<img alt='' src='"+arr[i]+"'>";
					}
					$("#provide").append(provideImg);
				}
				$("#J_videoImg").attr("src",data.demand.coverImg);
				$("#title").attr("title",data.demand.title);
				$("#title").append(data.demand.title);
				$("#sTitle").append(data.demand.title);
				$("#duration").append(data.demand.duration);
				$("#type").append(courseName(data.demand.bigType,data.demand.smallType));
				var price=data.demand.price;
				if(price==0){
					price="免费";
				}else{
					$("#J_buynow_div").css("display","inline");
					$("#J_buynow").attr("href","payForCourse?paytype=WX_NATIVE&fee="+data.demand.price+"&title="+data.demand.title+"&did="+data.demand.id+"&uid="+uid);
				}
				$("#price").append(price);
				$("#tName").append(tname);
				$("#tSign").append(sign);
				$("#tDescribe").append(describle);
				$("#headImg").attr("src",data.teacher.headimg);
				for(var i =0;i<data.subSize;i++){
					subList+="<dd class='module-item clearfix'>"+
					"<dl class='module-list course-hour-item'>"+
					"<dd class='module-item clearfix'>"+
						"<div class='course-tit-info'>"+
						   "<a href='enterDemands?roomId="+data.demand.roomId+"&did="+data.demand.id+"&uid="+<%=request.getSession().getAttribute("uid")%>+"&username=&apos;"+nickname+"&apos;&title="+data.subList[i].title+"&isfree="+data.demand.isfree+"&url="+data.subList[i].videoUrl+"&sbid="+data.subList[i].id+"&former="+former+"'> <span class='course-tit' style='background-position: 0 11px;'>课时"+(i+1)+" : "+data.subList[i].title+"</span></a>"+
						"</div>"+
					"</dd>"+
					"</dl>"+
					"</dd>";
				}
				subList+="<dd class='module-item clearfix'>"+
				"<dl class='module-list course-hour-item'>"+
				"<dd class='module-item clearfix'>"+
					"<div class='course-tit-info'>"+
					   "<a href='exam.jsp?knowledgePoint="+data.demand.knowledgePoint+"'> <span class='course-tit' style='background-position: 0 11px;'>课时"+(data.subSize+1)+" : 专题训练</span></a>"+
					"</div>"+
				"</dd>"+
				"</dl>"+
				"</dd>";
				$("#subList").append(subList);
				$("#provideContent").append(provideContent);
				$("#announcement").append(announcement);
   			 }
   		 }
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
                <img id="J_videoImg" src="" alt="">
            </div>
            <div class="left info">
                <div class="title">
                    <h1 title="" id="title"></h1>
                </div>
                <div class="course-concern clearfix">
                   
                </div>
                <div class="course-detail clearfix fcz" style="padding:10px 0;line-height:26px;">
                   
                    <div class="left">
                      <!-- <span class=""></span> -->
								<span class="" id="type"></span>
                    </div>
					<div class="left">
                        <span class="" id="duration"></span>
                    </div>
                </div>
                <div class="mb20 price-wrap ">
                    <div class="clearfix">
                        <div class="price left clearfix">
                            <span class="fs30" id="price"></span>
                            <!-- <span class="original">原价：¥3899.00</span> -->
							</div>
                        
                    </div>
                </div>

                <div class="action-wrap clearfix" style="display: none;" id="J_buynow_div">
                    <a id="J_buynow" href=""class="buynowbtn all-orange fs20">立即购买</a>
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
                <a href="#tab1"  style="width:227px;" class="active">目录</a>
                <a href="#tab2"  style="width:227px;" class="">简介</a>
                <a href="#tab3"  style="width:228px;" >听课需知</a>
                <a href="#tab4"  style="width:228px;" class="">学生评价</a>
            </div>

            <div class="bgwhite clist" data-name="lessonList">
                <h3 id="tab1">课程目录</h3>
                <div class="course-list">
                    <ul>
                        <li class="course-item clearfix">
                            <dl class="module-list course-hour-item" id="subList">
                                <h4 id="sTitle"></h4>
                            </dl>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="bgwhite couserDes clist" data-name="courseDesc">
                <h3 id="tab2">课程简介</h3>
                <div class="txt" id="provide">
				</div>
				<p id="provideContent" class="txt"></p>
            </div>
            <div class="message-wrap bgwhite clist" data-name="courseQuestion">
                <h3 id="tab3">听课需知</h3>
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
                                <img src="" id="headImg">
                            </dt>
                            <dd class="teacher-name fs18" id="tName"></dd>
                            <dd><span class="fcc" id="tSign"></span></dd>
                        </dl>
                        <div class="teacher-detail">
                            <div class="fcc lh3" >
                            <pre id="tDescribe"></pre>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
           
        </div>
        <!--asideright end -->
    </div>

</div>
<!--通用底部  -->
<%@include file="footer.jsp" %>
</body>
</html>