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
    <script id='spay-script' src='https://jspay.beecloud.cn/1/pay/jsbutton/returnscripts?appId=2fc29555-49b7-415e-80f0-c5d06f5e799d'></script>
    <script type="text/javascript">
    function GetQueryString(name)
    {
         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
         var r = window.location.search.substr(1).match(reg);
         if(r!=null)return  unescape(r[2]); return null;
    }
    var id = GetQueryString("oid");
    var uid = <%=request.getSession().getAttribute("uid")%>;
    var title="";
    var price="";
    var oid = "";
    function init(pageIndex,pageSize){
    	$.ajax({
   		 url: "/erds/getMoreOffline",
   		 type: "POST",
   		 data:'id='+id+'&pageIndex='+pageIndex+"&pageSize="+pageSize+"&sid="+uid,
   		 success: function(data){
   			 if(data.code==200){
				var provide = data.list[0].describe;
				title = data.list[0].title;
				price = data.list[0].price;
				oid = data.list[0].id;
				var address = data.list[0].address;
				var provideImg="";
				var provideContent=provide.split("|")[0];
				var arr = provide.split("|")[1].split(",");
				for(var i=0;i<arr.length;i++){
					provideImg +="<img alt='' src='"+arr[i]+"'>";
				}
				$("#J_videoImg").attr("src",data.list[0].cover);
				$("#title").attr("title",title);
				$("#title").append(title);
				$("#address").append("辅导地址:"+address);
				$("#sTitle").append(title);
				if(price==0){
					price="免费";
				}
				//$("#J_buynow").attr("href","payOffline?oid="+data.list[0].id+"&sid="+uid+"&otitle="+title);
				if(data.rsize>0){
					$("#test").html("报名成功");
					$('#test').removeAttr('onclick');
					//$("#J_buynow").attr("href","");
				}
				$("#price").append("定金:"+price);
				$("#provide").append(provideImg);
				$("#provideContent").append(provideContent);
   			 }
   		 }
    	});
    }
    </script>
</head>

<body onload="init(1,10)">
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
								<span class="" id="address"></span>
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

                <div class="action-wrap clearfix" style="display: inline;" id="J_buynow_div">
                    <!-- <a id="J_buynow" href=""class="buynowbtn all-orange fs20">立即报名</a> -->
                    <a id="test" href="javascript:;"class="buynowbtn all-orange fs20">立即报名</a>
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
                <!-- <a href="#tab1"  style="width:227px;" class="active">目录</a> -->
                <a href="#tab2"  style="width:303px;" class="">简介</a>
                <a href="#tab3"  style="width:303px;" >听课需知</a>
                <a href="#tab4"  style="width:304px;" class="">学生评价</a>
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
                                <img src="http://oev6hl3jh.bkt.clouddn.com/1480992995410名师风采.jpg" id="headImg">
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
<script type="text/javascript">
document.getElementById("test").onclick = function() {
	var amount = price*100;
	var uid =<%=request.getSession().getAttribute("uid")%>;	
	
	if(uid=="null"||uid==null){
		alert("请登录")
		return;
	}
	$.ajax({
		url:"/erds/getSignForPay",
		data:"aprice="+amount+"&oid="+oid+"&uid="+uid,
		type:"post",
        success:function(result){
        	if(result.code==200){
        		 BC.err = function(data) {
        	            //注册错误信息接受
        	            alert(data["ERROR"]);
        	        }
        	        /**
        	        * 需要支付时调用BC.click接口传入参数
        	        */
        	        BC.click({
        	            "title":"悟思教育", //商品名
        	            "amount":amount,  //总价（分）
        	            "out_trade_no":result.out_trade_no, //自定义订单号
        	            "sign":result.sign, //商品信息hash值，含义和生成方式见下文
        	            "return_url" : "http://payservice.beecloud.cn/spay/result.php", //支付成功后跳转的商户页面,可选，默认为http://payservice.beecloud.cn/spay/result.php
        	            "optional" : result.optional//可选，自定义webhook的optional回调参数
        	        });
        	        /**
        	        * click调用错误返回：默认行为console.log(err)
        	        */
        	        BC.err = function(err) {
        	            //err 为object, 例 ｛”ERROR“ : "xxxx"｝;
        	            console.log(err);
        	        }
        	}
        },
        dataType:"json"
	})
};
</script>
<!--通用底部  -->
<%@include file="footer.jsp" %>
</body>
</html>