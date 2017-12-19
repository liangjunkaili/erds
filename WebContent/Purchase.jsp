<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>支付页面</title>
</head>
<%!
String getMessageDigest(String s) {
    char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};
    try {
        byte[] buffer = s.getBytes("UTF-8");
        //获得MD5摘要算法的 MessageDigest 对象
        MessageDigest mdTemp = MessageDigest.getInstance("MD5");
        //使用指定的字节更新摘要
        mdTemp.update(buffer);
        //获得密文
        byte[] md = mdTemp.digest();
        //把密文转换成十六进制的字符串形式
        int j = md.length;
        char str[] = new char[j * 2];
        int k = 0;
        for (int i = 0; i < j; i++) {
            byte byte0 = md[i];
            str[k++] = hexDigits[byte0 >>> 4 & 0xf];
            str[k++] = hexDigits[byte0 & 0xf];
        }
        return new String(str);
    } catch (Exception e) {
        return null;
    }
}
%>
<!--添加控制台活的的script标签-->
<script id='spay-script' src='https://jspay.beecloud.cn/1/pay/jsbutton/returnscripts?appId=2fc29555-49b7-415e-80f0-c5d06f5e799d'></script>
<body>
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
<a href="javascript:;" style="font-size: 24px;" id="test">确认支付</a>
</div>
	<div align="center"><img width="130px" src="img/说明文字.png"/></div>
	</div>
	<div class="div1">
		<%@include file="footer.jsp" %>
	</div>
<%
        String app_id = "2fc29555-49b7-415e-80f0-c5d06f5e799d";
        String app_secret = "ccb86190-c3c0-43ba-a4c9-29371c00a651";
        String title = request.getParameter("title");
        String amount = request.getParameter("fee"); //单位分
        String cid = request.getParameter("cid");
        String did = request.getParameter("did");
        String uid = request.getParameter("uid"); 
       /*  String title = "title";
        String amount = "1"; //单位分
        String cid = "21";
        String did = "";
        String uid = "18550442795"; */
        String out_trade_no = "erds" + System.currentTimeMillis();
        //2.根据订单参数生成 订单签名 sign
        String sign = getMessageDigest(app_id + title + amount + out_trade_no + app_secret);
        String optional = "{'fee':'"+amount+"','uid':'"+uid+"','cid':'"+cid+"','did':'"+did+"','title':'"+title+"','billNo':'"+out_trade_no+"'}";
    %>

<script type="text/javascript">
    document.getElementById("test").onclick = function() {
        BC.err = function(data) {
            //注册错误信息接受
            alert(data["ERROR"]);
        }
        /**
        * 需要支付时调用BC.click接口传入参数
        */
        BC.click({
            "title":"<%=title%>", //商品名
            "amount":"<%=amount%>",  //总价（分）
            "out_trade_no":"<%=out_trade_no%>", //自定义订单号
            "sign":"<%=sign%>", //商品信息hash值，含义和生成方式见下文
            "return_url" : "http://5s-edu.com/paySucess.jsp", 
            //支付成功后跳转的商户页面,可选，默认为http://payservice.beecloud.cn/spay/result.php
            "optional" : <%=optional%>//可选，自定义webhook的optional回调参数
        });
        /**
        * click调用错误返回：默认行为console.log(err)
        */
        BC.err = function(err) {
            //err 为object, 例 ｛”ERROR“ : "xxxx"｝;
            console.log(err);
        }
    };
</script>
</body>
</html>