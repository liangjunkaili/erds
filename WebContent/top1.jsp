<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="author" content="Script Tutorials" />
<title>导航栏</title>
<link href="css/main1.css" rel="stylesheet" type="text/css" />
</head>
<script type="text/javascript">
var browserEvent = function (obj, url, title) {  
    var e = window.event || arguments.callee.caller.arguments[0];  
    var B = {  
        IE : /MSIE/.test(window.navigator.userAgent) && !window.opera  
        , FF : /Firefox/.test(window.navigator.userAgent)  
        , OP : !!window.opera  
    };  
    obj.onmousedown = null;  
    if (B.IE) {  
        obj.attachEvent("onmouseup", function () {  
            try {  
                window.external.AddFavorite(url, title);  
                window.event.returnValue = false;  
            } catch (exp) {}  
        });  
    } else {  
        if (B.FF || obj.nodeName.toLowerCase() == "a") {  
            obj.setAttribute("rel", "sidebar"), obj.title = title, obj.href = url;  
        } else if (B.OP) {  
            var a = document.createElement("a");  
            a.rel = "sidebar", a.title = title, a.href = url;  
            obj.parentNode.insertBefore(a, obj);  
            a.appendChild(obj);  
            a = null;  
        }  
    }  
};  
	var url = window.location.href;
	function logout() {
		$.ajax({
			url : "logout",
			type : "POST",
			success : function(data) {
				if (data.code == 200) {
					deleteCookie('username');
					deleteCookie('uid');
					deleteCookie('headimg');
					window.location.href = url;
				}
			},
			dataType : "json"
		});
	}
	
	function mySubmit() {
		//jQuery提交
		$("#myform").submit();
	}
</script>
<body>
	<div id="header">
		<!-- logo -->
		<img src="img/logo.gif" width="234px" height="89px" >
		<img src="img/kh.gif" width="234px" height="89px" style="margin-left: -10px;">
		<div id="links">
			<!-- <a href="about.html">关于我们</a> -->
			<a href="javascript:void(0);" onMouseDown="browserEvent(this, 'http://5s-edu.com/','悟思教育')">加入收藏</a>
			<%
				if (request.getSession().getAttribute("username") == null) {
			%>
			<a href="login.jsp" id="kc_login" class="bb">登录</a><a href="register.jsp"
				id="kc_register" class="bb">注册</a>
			<%
				} else {
			%>
			<a href="studentInfo.jsp" class="cc"><label id="username"></label><%=request.getSession().getAttribute("username")%></a><a
				href="#" id="logout" onclick="logout()" class="cc">退出</a>
			<%
				}
			%>
		</div>

		<!-- navigation menu -->
		<div id="navmenu">
			<nav id="menu">
				<ul>
					<li class="active"><a href="index.jsp">主页</a></li>
					<li><a href="#">高中</a>
						<ul>
							<li><a href="more.jsp?code=11"><span class="icon elem0"></span>数学</a></li>
							<li><a href="more.jsp?code=12"><span class="icon elem0"></span>化学</a></li>
							<li><a href="more.jsp?code=13"><span class="icon elem0"></span>物理</a></li>
							<li><a href="more.jsp?code=14"><span class="icon elem0"></span>英语</a></li>
						</ul></li>
					<li><a href="#">初中</a>
						<ul>
							<li><a href="more.jsp?code=21"><span class="icon elem0"></span>数学</a></li>
							<li><a href="more.jsp?code=22"><span class="icon elem0"></span>化学</a></li>
							<li><a href="more.jsp?code=23"><span class="icon elem0"></span>物理</a></li>
							<li><a href="more.jsp?code=24"><span class="icon elem0"></span>英语</a></li>
						</ul></li>
					<!-- <li><a href="#">小学</a>
						<ul>
							<li><a href="more.jsp?code=41"><span class="icon elem0"></span>数学</a></li>
							<li><a href="more.jsp?code=42"><span class="icon elem0"></span>化学</a></li>
							<li><a href="more.jsp?code=43"><span class="icon elem0"></span>物理</a></li>
							<li><a href="more.jsp?code=44"><span class="icon elem0"></span>英语</a></li>
						</ul></li> -->
					<li><a href="live_more.jsp?type=c2">直播课</a>
					</li>
					<li><a href="more.jsp?type=c1">直播回放</a>
					</li>
					<li><a href="about.html">关于我们</a>
					</li>
					<li><a href="play3.jsp">宣传片</a>
					</li>
				</ul>
			</nav>

			<!-- search form -->
			<div id="search">
				<form role="search" method="get" action="search.jsp" target="_blank" id="myform">
					<!-- <select name="search_type" style="margin-left: -250px;">
							<option value="st1">高中</option>
							<option value="st2">初中</option>
							<option value="st3">小学</option>
							<option value="st4">推荐课</option>
							<option value="st5">资格类培训</option>
							<option value="st6">直播课</option>
							<option value="st7">同步课</option>
					</select> -->
					<input type="text" placeholder="搜索课程..." name="title" value=""
						autocomplete="off" />
				</form>
			</div>
		</div>
	</div>

	<div style="text-align: center; clear: both"></div>

</body>
</html>