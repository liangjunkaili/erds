<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="cn.beecloud.bean.*"%>
<%@ page import="cn.beecloud.*"%>
<%@ page import="cn.beecloud.BCEumeration.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.Properties" %>
<%@ page import="net.sf.json.JSONObject" %>
<%@ page import="org.apache.log4j.Logger" %>
<%@ page import="java.lang.Thread" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="erds.com.controller.StudentController" %>
<%@ include file="loadProperty.jsp" %>
<%
   /*
	   功能：用户支付
	   版本：1.0
	   日期：2015-11-21
	   说明： 支付处理页面， 用于发起比可网络支付系统的请求，包括支付宝、微信、银联、易宝、京东、百度、快钱等渠道以及境外支付渠道PAYPAL
	   以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
	   该代码仅供学习和研究使用，只是提供一个参考。
	
	//***********页面功能说明***********
		 该页面可以在本机电脑测试。
	//********************************
	*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; UTF-8">
    <title>pay</title>
    <link rel="stylesheet"
	href="static/css/common/normalize_dd5983a.css~v=1.2.0.css" />
<link rel="stylesheet"
	href="static/css/common/public_2347803.css~v=1.2.0.css" />
	<script type="text/javascript"
	src="static/js/common/jquery-1.11.3.min_6163309.js~v=1.2.0"></script>
<script type="text/javascript"
	src="static/js/common/jquery.cookie_a5283b2.js~v=1.2.0"></script>
    <script src="js/qrcode.js"></script>
    <script type="text/javascript" src="static/js/common/common.js"></script>
<style type="text/css">
.div1{position:absolute;bottom:0px;width:100%;}

 
</style>
<script type="text/javascript">
function init(){
	var url = window.location.href;
	var roomid = '<%=request.getParameter("roomid")%>';	
	var cid = '<%=request.getParameter("cid")%>';	
	var uid =<%=request.getSession().getAttribute("uid")%>;	
	var username = '<%=request.getSession().getAttribute("username")%>';
	$("#price").append('<%=request.getParameter("fee")%>');
	$("#enterRoom").attr("href","enterCourse?roomId="+roomid+"&cid="+cid+"&uid="+uid+"&username='"+username+"'");

}
function query(){
	var billNo = '<%=request.getSession().getAttribute("billNo")%>';
	data = "{'billNo':'"+billNo+"'}";
	$.ajax({
		 url: "queryPayByBillNo",
		 type: "POST",
		 data:'data='+data,
		 success: function(data){
			 if(data.code==200){
				 window.location.href="paySucess.jsp";
				 window.clearInterval(c);
			 }
		 },
		 dataType: "json"
	});
}

$(document).ready(function(){
    c = setInterval(query,5000);//每5秒执行一次checkIsExist方法
});
</script>
</head>
<body onload="init()">
<%@include file="header.jsp" %>
<div style="margin-left: 30%;margin-right: 30%;padding: 10,10,10;">
<div>
<h1>&nbsp;&nbsp;收银台</h1>
<div style="margin: 20,20,20;background-color: #999" >
<br/>
<div align="right"><h3 style="display: inline;">实付金额：</h3><p style="color: orange;display: inline;font-size: 20px;" id="price">￥</p>
</div>
<br/>
</div>
<img src="img/WePayLogo.png" width="130px"/>
</div>
<div align="center" id="qrcode">

</div>
<div align="center"><img width="130px" src="img/说明文字.png"/></div>
</div>
<div class="div1">
		
		<%@include file="footer.jsp" %>
	</div>
</body>

<script type="text/javascript">
    function makeqrcode() {
        var qr = qrcode(10, 'L');
        qr.addData(codeUrl);
        qr.make();
        var wording = document.createElement('p');
        /* wording.innerHTML = "扫我，付款"; */
        var code = document.createElement('DIV');
        code.innerHTML = qr.createImgTag();
        var element = document.getElementById("qrcode");
        element.appendChild(wording);
        element.appendChild(code);
    }
    var type = 'WX_NATIVE';
    var codeUrl;
    var success = '<%=request.getSession().getAttribute("success")%>'
    if (type == 'WX_NATIVE') {
        codeUrl = '<%=request.getSession().getAttribute("codeUrl")%>';
    }
    if (type == 'WX_NATIVE' || 'true' == success) {
        makeqrcode();
    }
</script>
</html>