<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- <!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>悟思教育</title>-->
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <link type="text/css" rel="stylesheet" href="./css/common-header-2c_44ba6b0a.css">
    <link type="text/css" rel="stylesheet" href="./css/org-navbar-white_3f549bfd.css">
    <link type="text/css" rel="stylesheet" href="./css/global-min_93d8a1e2.css"> 
    <!-- Bootstrap CSS -->
    <script type="text/javascript">
    var url = window.location.href;
    function logout() {
		$.ajax({
			url : "logout",
			type : "POST",
			success : function(data) {
				if (data.code == 200) {
					$(".account").html('<span class="account-text">你好，</span>'+
					 '<a class="link account-login" href="login.jsp">请登录</a>'
	                +'<a class="link account-register" href="register.jsp" rel="nofollow">免费注册</a>'
					);
				}
			},
			dataType : "json"
		});
	}
    </script>
    <style>
<!--
.org-navbar li:hover ul{
    z-index: 10000;
}
-->
</style>
<!-- </head>
<body> -->
    <header id="J_siteNav" class="site-nav ">
        <nav class="site-nav-bd clearfix">
            <div class="account ">
                <span class="account-text">你好，</span>
                <%
					if (request.getSession().getAttribute("username") == null) {
				%>
				 <a class="link account-login" href="login.jsp">请登录</a>
                <a class="link account-register" href="register.jsp" rel="nofollow">免费注册</a>
				<%
					} else {
				%>
				<a class="link account-login" href="account.jsp"><%=request.getSession().getAttribute("username")%></a>
                <a class="link account-register" href="javascript:;" rel="nofollow" onclick="logout()">退出</a>
				<%
					}
				%>
            </div>
            <ul class="site-nav-items">
                <li class="nav-item as-home"><a class="link nav-link" href="index.jsp">悟思教育首页</a></li>
            </ul>
        </nav>
    </header>
    <div class="common-header-2c">
        <div class="ch-2c-main clearfix">
            <img class="header-logo" src="./img/logo.gif">
            <div class="search-wrap">
                <form action="search.jsp" class="search-from">
                    <input type="hidden" name="searchScope" value="website">
                    <input type="hidden" name="aft" value="Course">
                    <div class="icos top"></div>
                    <div class="middle">
                        <input type="text" placeholder="你今天想学什么" class="ipt-search" autocomplete="off" name="title" accesskey="s" x-webkit-speech=""
                            x-webkit-grammar="builtin:search">
                        <button class="submit icos" type="submit">搜索</button>
                        <div class="list-box"></div>
                    </div>
                    <div class="icos bottom"></div>
                </form>
            </div>
            <div class="wrap-right">
                <p>
                    <!--<a href="" target="_blank"><span>15612</span></a>
                关于我们-->
                    <a href="index.jsp" target="_blank"><span class="dredge">全部课程</span></a>
                </p>
            </div>
        </div>
    </div>
    <!-- 通用头区域-->
    <input type="hidden" name="organizationId" value="13052" />
    <div class="org-header-wrap org-headerdefault-wrap" style="margin-top: 30px">
        <div class="org-navbar-wrap">
            <ul class="org-navbar clearfix">
                <li class="list">
                    <a class="text" href="index.jsp">首页</a>
                </li>
                <li class="list">
                    <a class="text" href="javascript:;">高中</a>
                    <ul>
                        	<li><a href="moretuijian.jsp?code=11"><span class="icon elem0"></span>数学</a></li>
							<li><a href="moretuijian.jsp?code=12"><span class="icon elem0"></span>化学</a></li>
							<li><a href="moretuijian.jsp?code=13"><span class="icon elem0"></span>物理</a></li>
							<li><a href="moretuijian.jsp?code=14"><span class="icon elem0"></span>英语</a></li>
                    </ul>
                </li>
                <li class="list">
                    <a class="text" href="javascript:;">初中</a>
                    <ul>
                        <li><a href="moretuijian.jsp?code=21"><span class="icon elem0"></span>数学</a></li>
                        <li><a href="moretuijian.jsp?code=22"><span class="icon elem0"></span>化学</a></li>
                        <li><a href="moretuijian.jsp?code=23"><span class="icon elem0"></span>物理</a></li>
                        <li><a href="moretuijian.jsp?code=24"><span class="icon elem0"></span>英语</a></li>
                    </ul>
                </li>
                <li class="list">
                    <a class="text" href="javascript:;">小学</a>
                    	<ul>
							<li><a href="moretuijian.jsp?code=41"><span class="icon elem0"></span>数学</a></li>
							<!-- <li><a href="moretuijian.jsp?code=42"><span class="icon elem0"></span>化学</a></li>
							<li><a href="moretuijian.jsp?code=43"><span class="icon elem0"></span>物理</a></li> -->
							<li><a href="moretuijian.jsp?code=44"><span class="icon elem0"></span>英语</a></li>
						</ul>
                </li>
                <li class="list">
                    <a class="text" href="morezhibo.jsp">直播课</a>
                </li>
                <li class="list">
                    <a class="text" href="moretuijian.jsp?type=c1">直播回放</a>
                </li>
            </ul>
        </div>
    </div>
<!-- </body>
</html> -->