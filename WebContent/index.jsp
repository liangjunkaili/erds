<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta property="qc:admins" content="1540271000612453316375">
<meta name="baidu-site-verification" content="y1cl5Vuri5">
<title>悟思教育</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge"> <meta name="format-detection" content="telephone=no">
<link rel="search" type="application/opensearchdescription+xml" title="悟思教育" href="">
<link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css">
<link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
<link type="text/css" rel="stylesheet" href="./css/index-2c_6e1001ff.css">
<link type="text/css" rel="stylesheet" href="./css/index.css">
<link type="image/x-icon" rel="shortcut icon" href="/images/ordosmskt.ico" />
<script src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function init(){
var lunbo="[";
var json1;
var tuijian ="[";
var json2;
var tongbu ="[";
var json3;
var zhibo ="[";
var json4;
var huifang ="[";
var json5;
var mingshi="[";
var json6;
var hezuo="[";
var json7;
var isCenter="[";
var json8;
var isCenter1="[";
var json9;
var professor="[";
var json10;
$.ajax({
	url : "/erds/getCourses",
	type : "POST",
	data : 'pageIndex=1&pageSize=1000',
	success : function(data) {
		if (data.code == 200) {
			//资讯
			var infos = data.infos;
			var info="";
			$("#why").attr("href",infos[0].href);
			$("#sideimg").attr("src",infos[0].img);
			$("#sideimg").attr("title",infos[0].title);
			if(data.infosSize>=6){
				data.infosSize=6;
			}
			for(var f=1;f<data.infosSize-1;f++){
				var title = infos[f].title;
				if(title.length>12){
					title=title.substring(0,12)+"...";
				}
				info+='<a href="'+infos[f].href+'" class="aa" target="_blank" >'+title+'</a><br>';
			}
			$("#infos").append(info);
			//轮播图
			var lunbotu = data.rollList;
			for(var l=0;l<data.rollListSize;l++){
				var lbt = "{'img':'"+lunbotu[l].coverimg+"','href':'"+lunbotu[l].href+"'},";
				lunbo+=lbt;
			}
			lunbo=lunbo.substring(0,lunbo.length-1);
			lunbo=lunbo+"]";
			json1 = eval('(' + lunbo + ')');
			
			//推荐课
			var tuijianke = data.demandc3List
			var tuijiankeSize = data.demandc3ListSize;
			if(tuijiankeSize>8){
				tuijiankeSize=8;
			}
			for(var t=0;t<tuijiankeSize;t++){
				var price = "免费";
				var totalNum="";
				var oprice="";
				if(tuijianke[t].price!=0){
					price = tuijianke[t].price;
					totalNum = "已购人数:"+tuijianke[t].totalNum;
					oprice = "原价:￥"+tuijianke[t].oprice;
				}
				var tjk = "";
				if(tuijianke[t].dd==1){
					tjk+="{'href':'kechen.jsp?cid="+tuijianke[t].id+"','img':'"+tuijianke[t].coverImg+"','title':'"+tuijianke[t].title+"','price':'¥"+price+"','tName':'"+tuijianke[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				}else{
					tjk+="{'href':'zhibo.jsp?cid="+tuijianke[t].id+"','img':'"+tuijianke[t].coverImg+"','title':'"+tuijianke[t].title+"','price':'¥"+price+"','tName':'"+tuijianke[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				}
				tuijian+=tjk;
			}
			tuijian=tuijian.substring(0,tuijian.length-1);
			tuijian=tuijian+"]";
			json2 = eval('(' + tuijian + ')');
			
			//同步课
			var tongbuke = data.demandList
			var tongbukeSize = data.demandListSize;
			if(tongbukeSize>8){
				tongbukeSize=8;
			}
			for(var t=0;t<tongbukeSize;t++){
				var price = "免费";
				var totalNum="";
				var oprice="";
				if(tongbuke[t].price!=0){
					price = tongbuke[t].price;
					totalNum = "已购人数:"+tongbuke[t].totalNum;
					oprice = "原价:￥"+tongbuke[t].oprice;
				}
				var tb = "{'href':'kechen.jsp?cid="+tongbuke[t].id+"','img':'"+tongbuke[t].coverImg+"','title':'"+tongbuke[t].title+"','price':'¥"+price+"','tName':'"+tongbuke[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				tongbu+=tb;
			}
			tongbu=tongbu.substring(0,tongbu.length-1);
			tongbu=tongbu+"]";
			json3 = eval('(' + tongbu + ')');
			
			//直播课
			var zhiboke = data.list
			var zhibokeSize = data.size;
			if(zhibokeSize>8){
				zhibokeSize=8;
			}
			for(var t=0;t<zhibokeSize;t++){
				var price = "免费";
				if(zhiboke[t].price!=0){
					price = zhiboke[t].price;
				}
				var zb = "{'href':'zhibo.jsp?cid="+zhiboke[t].id+"','img':'"+zhiboke[t].coverImg+"','title':'"+zhiboke[t].title+"','price':'¥"+price+"','tName':'"+zhiboke[t].tName+"','oprice':'原价:¥"+zhiboke[t].oprice+"','totalNum':'"+zhiboke[t].totalNum+"'},";
				zhibo+=zb;
			}
			zhibo=zhibo.substring(0,zhibo.length-1);
			zhibo=zhibo+"]";
			json4 = eval('(' + zhibo + ')');
			//专家课
			var zjk = data.professors;
			var zjkSize = data.professorsSize;
			if(zjkSize>8){
				zjkSize=8;
			}
			for(var g=0;g<zjkSize;g++){
				var price = "免费";
				if(zjk[g].price!=0){
					price = zjk[g].price;
				}
				var zb = "{'href':'professor.jsp?cid="+zjk[g].id+"','img':'"+zjk[g].coverImg+"','title':'"+zjk[g].title+"','price':'¥"+price+"','tName':'"+zjk[g].tName+"','oprice':'原价:¥"+zjk[g].oPrice+"','totalNum':'"+zjk[g].totalNum+"'},";
				professor+=zb;
			}
			professor=professor.substring(0,professor.length-1);
			professor=professor+"]";
			json10 = eval('(' + professor + ')')
			//直播回放
			var huifangke = data.demandc1List
			var huifangkeSize = data.demandc1ListSize;
			if(huifangkeSize>8){
				huifangkeSize=8;
			}
			for(var t=0;t<huifangkeSize;t++){
				var price = "免费";
				var totalNum="";
				var oprice="";
				if(huifangke[t].price!=0){
					price = huifangke[t].price;
					totalNum = "已购人数:"+huifangke[t].totalNum;
					oprice = "原价:￥"+huifangke[t].oprice;
				}
				var zb = "";
				if(huifangke[t].dd==1){
					zb+="{'href':'kechen.jsp?cid="+huifangke[t].id+"','img':'"+huifangke[t].coverImg+"','title':'"+huifangke[t].title+"','price':'¥"+price+"','tName':'"+huifangke[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				}else{
					zb+="{'href':'zhibo.jsp?cid="+huifangke[t].id+"','img':'"+huifangke[t].coverImg+"','title':'"+huifangke[t].title+"','price':'¥"+price+"','tName':'"+huifangke[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				}
				huifang+=zb;
			}
			huifang=huifang.substring(0,huifang.length-1);
			huifang=huifang+"]";
			json5 = eval('(' + huifang + ')');
			
			//报班中心-线上班
			var center = data.centerList
			var centerSize = data.centerListSize;
			if(centerSize>8){
				centerSize=8;
			}
			for(var t=0;t<centerSize;t++){
				var price = "免费";
				var totalNum="";
				var oprice="";
				if(center[t].price!=0){
					price = center[t].price;
					totalNum = "已购人数:"+center[t].totalNum;
					oprice = "原价:￥"+center[t].oprice;
				}
				var zb = "";
				//if(center[t].dd==1){
					zb+="{'href':'kechen.jsp?cid="+center[t].id+"','img':'"+center[t].coverImg+"','title':'"+center[t].title+"','price':'¥"+price+"','tName':'"+center[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				//}else{
				//	zb+="{'href':'zhibo.jsp?cid="+center[t].id+"','img':'"+center[t].coverImg+"','title':'"+center[t].title+"','price':'¥"+price+"','tName':'"+center[t].tName+"','totalNum':'"+totalNum+"','oprice':'"+oprice+"'},";
				//}
				isCenter+=zb;
			}
			if(centerSize>0){
				isCenter=isCenter.substring(0,isCenter.length-1);
				isCenter=isCenter+"]";
				json8 = eval('(' + isCenter + ')');
				$.each(json8,function(name,value) {
					var atui= '<div class="piece">\
						<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
						<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
						<div>\
							<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
							<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
								<span class="deg">'+value.totalNum+'</span>\
							</a>\
						</div>\
					</div>';
		            $("#data-baoban-tab1").append(atui);
		        });
			}
			//线下班
			var offline = data.offlines
			var offlineSize = data.offlinesSize;
			if(offlineSize>8){
				offlineSize=8;
			}
			for(var t=0;t<offlineSize;t++){
				var price = "免费";
				if(offline[t].price!=0){
					price = offline[t].price;
				}
				var zb = "";
				zb+="{'href':'offline.jsp?oid="+offline[t].id+"','img':'"+offline[t].cover+"','title':'"+offline[t].title+"','price':'¥"+price+"'},";
				isCenter1+=zb;
			}
			if(offlineSize>0){
				isCenter1=isCenter1.substring(0,isCenter1.length-1);
				isCenter1=isCenter1+"]";
				json9 = eval('(' + isCenter1 + ')');
			$.each(json9,function(name,value) {
				var atui= '<div class="piece">\
					<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
					<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
					<div>\
						<span class="cost free">定金:'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+''+'</span>\
						<a href="'+value.href+'" target="_blank"></a>\
					</div>\
				</div>';
				$("#data-baoban-tab2").append(atui);
	        });
			}
			//名师
			var mings = data.teacherList;
			var mingSize = data.teacherSize;
			if(mingSize>6){
				mingSize=6;
			}
			for(var l=0;l<mingSize;l++){
				var ms = "{'img':'"+mings[l].headimg+"','href':'details.jsp?tid="+mings[l].tid+"'},";
				mingshi+=ms;
			}
			mingshi=mingshi.substring(0,mingshi.length-1);
			mingshi=mingshi+"]";
			json6 = eval('(' + mingshi + ')');
			
			//合作机构
			var hez = data.partnersList;
			var hezSize = data.partnersListSize;
			if(hezSize>5){
				hezSize=5;
			}
			for(var l=0;l<hezSize;l++){
				var ms = "{'img':'"+hez[l].logo+"','href':'"+hez[l].selfUrl+"'},";
				hezuo+=ms;
			}
			hezuo=hezuo.substring(0,hezuo.length-1);
			hezuo=hezuo+"]";
			json7 = eval('(' + hezuo + ')');
		}
		$.each(json1,function(name,value) {
		    $("#data-lunbo").append('<li onclick="location.href=&apos;'+value.href+'&apos;"><img src="'+value.img+'"></li>');
		});
		$('.banner').terseBanner();
		$.each(json2,function(name,value) {
			var atui= '<div class="piece">\
							<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
							<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
							<div>\
								<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
								<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
									<span class="deg">'+value.totalNum+'</span>\
								</a>\
							</div>\
						</div>';
            $("#data-tuijian").append(atui);
        });
		$.each(json3,function(name,value) {
			var atui= '<div class="piece">\
				<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
				<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
				<div>\
					<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
					<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
						<span class="deg">'+value.totalNum+'</span>\
					</a>\
				</div>\
			</div>';
            $("#data-tongbu").append(atui);
        });
		/* $.each(json4,function(name,value) {
			var atui= '<div class="piece">\
				<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
				<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
				<div>\
					<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
					<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
						<span class="deg">已购人数:'+value.totalNum+'</span>\
					</a>\
				</div>\
			</div>';
            $("#data-zhibo").append(atui);
        }); */
		/* $.each(json5,function(name,value) {
			var atui= '<div class="piece">\
				<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
				<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
				<div>\
					<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
					<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
						<span class="deg">'+value.totalNum+'</span>\
					</a>\
				</div>\
			</div>';
            $("#data-huifang").append(atui);
        }); */
		$.each(json10,function(name,value) {
			var atui= '<div class="piece">\
				<div class="course-img"><a class="link-cl" href="'+value.href+'" target="_blank"><img src="'+value.img+'"></a></div>\
				<a href="" target="_blank"><span class="title">'+value.title+'</span><span class="introduce">'+value.title+'</span></a>\
				<div>\
					<span class="cost free">'+value.price+'</span><span class="cost free" style="text-decoration: line-through;margin-left:5px;">'+value.oprice+'</span>\
					<a href="'+value.href+'" target="_blank"><span class="org">'+value.tName+'</span>\
						<span class="deg">'+value.totalNum+'</span>\
					</a>\
				</div>\
			</div>';
            $("#data-professor").append(atui);
        });
		$.each(json6,function(name,value) {
            $("#data-mingshi").append('<a class="teacher-link-img" href="'+value.href+'"><img src="'+value.img+'"></a>');
        });
		$.each(json7,function(name,value) {
            $("#data-hezuo").append('<a class="hezuo-link" href="'+value.href+'"><img src="'+value.img+'"></a>');
        });
	},
	dataType : "json"
});
}
var url = window.location.href;
function logout() {
	$.ajax({
		url : "logout",
		type : "POST",
		success : function(data) {
			if (data.code == 200) {
				window.location.href = url;
			}
		},
		dataType : "json"
	});
}
</script>
</head>
<body onload="init()">
<header id="J_siteNav" class="site-nav ">
	<nav class="site-nav-bd clearfix">
	    	<div class="account ">
			<span class="account-text">你好,</span>
				<%
					if (request.getSession().getAttribute("username") == null) {
				%>
				 <a class="link account-login" href="login.jsp">请登录</a>
                <a class="link account-register" href="register.jsp" rel="nofollow">免费注册</a>
				<%
					} else {
				%>
				<a class="link account-login" href="account.jsp"><%=request.getSession().getAttribute("username")%></a>
                <a class="link account-register" href="" rel="nofollow" onclick="logout()">退出</a>
				<%
					}
				%>
			</div>
		<input type="hidden" name="username" value="GUEST">
		<ul class="site-nav-items">
			<li class="nav-item as-home"><a class="link nav-link" href="index.jsp">悟思教育首页</a></li>
		</ul>
	</nav>
</header>
<input type="hidden" name="isCustom" value="false">
<input type="hidden" name="organizationId" value="">
<div class="common-header-2c">
	<div class="ch-2c-main clearfix">
		<img class="header-logo" src="img/logo.gif" width="200px" height="67px">
		<img class="header-logo" src="img/kh.gif" width="200px" height="67px">
		<div class="search-wrap">
			<form action="search.jsp" class="search-from">
				<input type="hidden" name="searchScope" value="website">
				<input type="hidden" name="aft" value="Course">
				<div class="icos top"></div>
				<div class="middle">
					<input type="text" placeholder="你今天想学什么" class="ipt-search" autocomplete="off" name="title" accesskey="s" x-webkit-speech="" x-webkit-grammar="builtin:search">
					<button class="submit icos" type="submit">搜索</button>
					<div class="list-box"></div>
				</div>
				<div class="icos bottom"></div>
			</form>
		</div>
		<div class="wrap-right">
			<p>
				<a href="index.jsp" target="_blank"><span class="dredge">全部课程</span></a>
			</p>
		</div>
	</div>
	<ul class="ch-2c-main index-nav clearfix">
		<li><a class="all-course" href="javascript:;"><i></i><span>全部课程分类</span></a></li>
		<li><a class="" href="index.jsp">首页</a></li>
        <li><a class="" href="about.html">关于我们</a></li>
        <!-- <li><a class="" href="play3.jsp">宣传片</a></li> -->
        <li><a class="" href="http://5s-edu.com/zytb/">志愿填报</a></li>
	</ul>
</div>
<div class="content-wrap">
			<div class="banner">
				<style>
					.banner{width: 100%;height: 408px;}
					.banner ul li{background-size: 100%}
				</style>
				<div class="banner">
					<ul id="data-lunbo">
						
					</ul>
				</div>
				<script src="js/jquery.terseBanner.min.js"></script>

				<div class="code-wrap" >
					<!-- <a target="_blank" href="tencent://message/?uin=2738099389&Site=sc.chinaz.com&Menu=yes">
					<div class="code-back" >
						<img src="img/headPicOnline.png" style="margin-left:25px;margin-top:50px">
						<p style="text-align:center;margin-top:15px;font-size:15px;color:#0099FF;font-weight:bold">有什么可以帮到您!</p>
					</div>
					</a> -->
					<div id="auto-id-1488858679159" style="opacity:0.9;background-color: white;">
					    <a target="_blank" id="why" href="#" >
					        <img src="" alt="右侧推荐图" class="sideimg"  id="sideimg" style="width: 250px;height: 150px;" title="" >
					    </a>
					    <style>
						.aa{
							display: block;
							width: 220px;
							color: #666;
							font-size: 15px;
							margin-left: 30px;
							margin-bottom: -5px;
						}
						</style>
					    <div class="cnt f-f0 j-cnt" id="infos">
					    </div>
					    <a target="_blank" href="tencent://message/?uin=2738099389&Site=sc.chinaz.com&Menu=yes">
							<img src="img/zixun.jpg" style="width: 250px;height: 70px;margin-top: 3px;">
							<!-- <p style="text-align:center;margin-top:5px;font-size:15px;color:#0099FF;font-weight:bold">有什么可以帮到您!</p> -->
						</a>
					</div>
				</div>
			</div>
	</div>
			<div class="section">
				<div class="course-classify" style="top:-408px">
                    <div class="e-classify">
                        <h3><a href="javascript:;" target="_blank">高中</a><span></span></h3>
                        <div class="m-classify">
                            <a href="moretuijian.jsp?code=11" target="_blank">数学</a>
                            <a href="moretuijian.jsp?code=12" target="_blank">化学</a>
                            <a href="moretuijian.jsp?code=13" target="_blank">物理</a>
                            <a href="moretuijian.jsp?code=14" target="_blank" style="margin-right:0;">英语</a>
                        </div>
						<div class="s-classify">
							<a href="moretuijian.jsp?code=11" target="_blank" class="ungap">数学</a>
							<a href="moretuijian.jsp?code=12" target="_blank" class="ungap">化学</a>
							<a href="moretuijian.jsp?code=13" target="_blank" class="gap">物理</a>
							<a href="moretuijian.jsp?code=14" target="_blank" class="ungap">英语</a>
						</div>
					</div>
                    <div class="e-classify">
                        <h3><a href="javascript:;" target="_blank">初中</a><span></span></h3>
                        <div class="m-classify">
                            <a href="moretuijian.jsp?code=21" target="_blank">数学</a>
                            <a href="moretuijian.jsp?code=22" target="_blank">化学</a>
                            <a href="moretuijian.jsp?code=23" target="_blank">物理</a>
                            <a href="moretuijian.jsp?code=24" target="_blank" style="margin-right:0;">英语</a>
                        </div>
						<div class="s-classify">
							<a href="moretuijian.jsp?code=21" target="_blank" class="ungap">数学</a>
							<a href="moretuijian.jsp?code=22" target="_blank" class="ungap">化学</a>
							<a href="moretuijian.jsp?code=23" target="_blank" class="gap">物理</a>
							<a href="moretuijian.jsp?code=24" target="_blank" class="ungap">英语</a>
						</div>
                    </div>
                    <div class="e-classify">
                        <h3><a href="javascript:;" target="_blank">小学</a><span></span></h3>
                        <div class="m-classify">
                            <a href="moretuijian.jsp?code=41" target="_blank">数学</a>
                            <!-- <a href="moretuijian.jsp?code=42" target="_blank">化学</a>
                            <a href="moretuijian.jsp?code=43" target="_blank">物理</a> -->
                            <a href="moretuijian.jsp?code=44" target="_blank" style="margin-right:0;">英语</a>
                        </div>
						<div class="s-classify">
							<a href="moretuijian.jsp?code=41" target="_blank" class="ungap">数学</a>
							<!-- <a href="moretuijian.jsp?code=42" target="_blank" class="ungap">化学</a>
							<a href="moretuijian.jsp?code=43" target="_blank" class="gap">物理</a> -->
							<a href="moretuijian.jsp?code=44" target="_blank" class="ungap">英语</a>
						</div>
                    </div>
                    <div class="e-classify">
                        <h3><a href="morezhibo.jsp" target="_blank">直播课</a><span></span></h3>
                        <div class="m-classify">
                            <a href="morezhibo.jsp" target="_blank">数学</a>
                            <a href="morezhibo.jsp" target="_blank">化学</a>
                            <a href="morezhibo.jsp" target="_blank">物理</a>
                            <a href="morezhibo.jsp" target="_blank" style="margin-right:0;">英语</a>
                        </div>
						<div class="s-classify">
							<a href="morezhibo.jsp" target="_blank" class="ungap">数学</a>
							<a href="morezhibo.jsp" target="_blank" class="ungap">化学</a>
							<a href="morezhibo.jsp" target="_blank" class="gap">物理</a>
							<a href="morezhibo.jsp" target="_blank" class="ungap">英语</a>
						</div>
                    </div>
                    <div class="e-classify">
                        <h3><a href="moretuijian.jsp?type=c1" target="_blank">直播回放</a><span></span></h3>
                        <div class="m-classify">
                            <a href="moretuijian.jsp?type=c1" target="_blank">数学</a>
                            <a href="moretuijian.jsp?type=c1" target="_blank">化学</a>
                            <a href="moretuijian.jsp?type=c1" target="_blank">物理</a>
                            <a href="moretuijian.jsp?type=c1" target="_blank" style="margin-right:0;">英语</a>
                        </div>
						<div class="s-classify">
							<a href="moretuijian.jsp?type=c1" target="_blank" class="ungap">数学</a>
							<a href="moretuijian.jsp?type=c1" target="_blank" class="ungap">化学</a>
							<a href="moretuijian.jsp?type=c1" target="_blank" class="gap">物理</a>
							<a href="moretuijian.jsp?type=c1" target="_blank" class="ungap">英语</a>
						</div>
                    </div>
					<div class="e-classify">
                        <h3><a href="moretuijian.jsp?type=c1" target="_blank">报班中心</a><span></span></h3>
                        <div class="m-classify">
                            <a href="moretuijian.jsp?type=c1" target="_blank">网络班</a>
                            <a href="moretuijian.jsp?type=c1" target="_blank" style="margin-right:0;">线下班</a>
                        </div>
						<div class="s-classify">
							<a href="moretuijian.jsp?type=c1" target="_blank" class="ungap">网络班</a>
							<a href="moretuijian.jsp?type=c1" target="_blank" class="ungap">线下班</a>
						</div>
                    </div>
                </div>
				<div class="course-wrap clearfix">
					<!--推荐课 -->
					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>推荐课</h3></a>
						<div class="page">
							<a href="moretuijian.jsp?type=c3" target="_blank">
							<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-tuijian" class="course-list clearfix">
					</div>

					<!-- 同步课 -->
					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>同步课</h3></a>
						<div class="page">
							<a href="moredianbo.jsp" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-tongbu" class="course-list clearfix">
					</div>

					<!-- 直播课-->
					<!-- <div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>直播课</h3></a>
						<div class="page">
							<a href="morezhibo.jsp" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-zhibo" class="course-list clearfix">
						
					</div> -->

					<!-- 直播回放 -->
					<!-- <div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>直播回放</h3></a>
						<div class="page">
							<a href="moretuijian.jsp?type=c1" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-huifang" class="course-list clearfix">
					</div> -->
					<!-- 专家课 -->
					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>专家课</h3></a>
						<div class="page">
							<a href="moretuijian.jsp?type=c1" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-professor" class="course-list clearfix">
					</div>
					<!-- 报班中心 -->
					<!-- <div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>报班中心</h3></a>
						<div class="page">
							<a href="moretuijian.jsp?type=c1" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-baoban" class="course-list clearfix">
					</div> -->

					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank">
							<h3>报班中心</h3>
						</a>
						<div class="change" id="class_course">
							<span class="on" id="tab2">线下班</span>
							<span class="" id="tab1">网络班</span>
						</div>
						<div class="page">
							<a href="moretuijian.jsp?type=c1" target="_blank">
								<span class="more">更多 <span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-baoban-tab1" class="course-list clearfix baoban"style="display:none">
					</div>
					<div id="data-baoban-tab2" class="course-list clearfix baoban" >
					</div>
					<!-- 名师风采 -->
					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="#" target="_blank"><h3>名师风采</h3></a>
						<div class="page">
							<a href="teachers.jsp" target="_blank">
								<span class="more">更多<span style="font-family:&#39;宋体&#39;">&gt;&gt;</span></span>
							</a>
						</div>
					</div>
					<div id="data-mingshi" class="course-list clearfix" style="text-align: center">
						
					</div>

					<!--合作机构 -->
					<div class="course-head hot-course section-hot" id="section-hot">
						<a href="javascript:;" target="_blank"><h3>合作机构</h3></a>
					</div>
					<div id="data-hezuo" class="course-list clearfix" style="text-align: center">
						
					</div>

			</div>
		</div>
		<footer class="as-footer main-section clearfix">
	<section class="site-map clearfix">
		<nav>
			<a class="item" href="about.html" target="_blank" rel="nofollow">关于我们</a>
			<span>|</span>
			<a class="item" href="login_parent.jsp" target="_blank">家长入口</a>
			<span>|</span>
			<a class="item" href="login_teacher.jsp" target="_blank" rel="nofollow">教师入口</a>
			<span>|</span>
			<a class="item" href="help.html" target="_blank" rel="nofollow">声明</a>
			<span>|</span>
			<a class="item" href="http://oev6hl3jh.bkt.clouddn.com/%E5%BD%95%E5%BE%AE%E8%AF%BE%E8%BD%AF%E4%BB%B6%E5%90%AB%E6%96%B9%E6%B3%95.rar" target="_blank" rel="nofollow">录微课</a>
		</nav>
		<p class="copyright">
			© Copyright  悟思教育 版权所有</p>
		<p class="copyright">
			<a href="javascript:;" target="_blank">蒙ICP备16003311号</a>
		</p>
	</section>
</footer>
<ul id="22-1">
</ul>
		<ul class="index-fixed-box">
			<li class="ico-ewm">
				<img src="img/qrcode.jpg">
			</li>
			<li class="ico-upheader"></li>
		</ul>
		<script>
			$(document).ready(function(){
				$(".ico-upheader").click(function(){
					$(window).scrollTop(0)
				})
			})
			$("#class_course span").click(function(){
			var tid = $(this).attr("id");
			var cid = "data-baoban-"+tid;
			$("#class_course").find(".on").removeClass("on");
			$(this).addClass("on");
			
			$(".baoban").css("display","none");
			$("#"+cid).css("display","block");
		});
		</script>
</body>
</html>