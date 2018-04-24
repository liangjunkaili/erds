<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
   <script src="js/jquery-1.9.1.min.js"></script>
   <script type="text/javascript">
   function init() {
		$.ajax({
			url : "getChart",
			type : "POST",
			success : function(data) {
				$("#imgurl").attr("src",data.url);
			},
			dataType : "json"
		});

	}
   </script>
   <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
    <script type="text/javascript">
        //if(!(/MicroMessenger/i.test(navigator.userAgent)))
        //{
        //    document.body.innerHTML="请在微信打开此链接";
        //}
        // 注意：所有的JS接口只能在公众号绑定的域名下调用，公众号开发者需要先登录<a href="https://www.baidu.com/s?wd=%E5%BE%AE%E4%BF%A1%E5%85%AC%E4%BC%97%E5%B9%B3%E5%8F%B0&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YzPWcLuHn4mWfdP1P-uy7-0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnH63n1f4PWfLn1f3P1csrj6vr0" target="_blank" class="baidu-highlight">微信公众平台</a>进入“公众号设置”的“功能设置”里填写“JS接口安全域名”。
        // 如果发现在 Android 不能分享自定义内容，请到官网下载最新的包覆盖安装，Android 自定义分享接口需升级至 6.0.2.58 版本及以上。
        // 完整 JS-SDK 文档地址：http://mp.weixin.qq.com/wiki/7/aaa137b55fb2e0456bf8dd9148dd613f.html
        wx.config({
            debug: false,
            appId: '微-信，公众号提供的AppId',
            timestamp: '这里是时间戳',
            nonceStr: 'GoodBlessYou',
            signature: '这里是签名',
            jsApiList: [
                'checkJsApi',
                'onMenuShareTimeline',
                'onMenuShareAppMessage'
            ]
        });
        wx.ready(function () {
            // 2.2 监听“分享到朋友圈”按钮点击、自定义分享内容及分享结果接口
            wx.onMenuShareTimeline({
                title: '标题',
                link: '分享链接',
                imgUrl: '分享的<a href="https://www.baidu.com/s?wd=%E5%9B%BE%E7%89%87%E9%93%BE%E6%8E%A5&tn=44039180_cpr&fenlei=mv6quAkxTZn0IZRqIHckPjm4nH00T1YzPWcLuHn4mWfdP1P-uy7-0ZwV5Hcvrjm3rH6sPfKWUMw85HfYnjn4nH6sgvPsT6KdThsqpZwYTjCEQLGCpyw9Uz4Bmy-bIi4WUvYETgN-TLwGUv3EnH63n1f4PWfLn1f3P1csrj6vr0" target="_blank" class="baidu-highlight">图片链接</a>',
                trigger: function (res) {
                    // alert("分享到朋友圈按钮点击");        
                },
                success: function (res) {
                },
                cancel: function (res) {
                    // alert('已取消');
                },
                fail: function (res) {
                    alert(JSON.stringify(res));
                }
            });
        });
    </script>
 </head>
  <body onload="init()">
	  <div  style="text-align:center">
		   jfreechart _3D柱状图 <br><br>
		 <img src=""  width=600 height=400  border=0  color=gray id="imgurl">
	  </div>
	  <a href="javascript:void(0);" onclick="window.open('http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?url='+encodeURIComponent(document.location.href));return false;" title="分享到QQ空间"><img src="http://qzonestyle.gtimg.cn/ac/qzone_v5/app/app_share/qz_logo.png" alt="分享到QQ空间" /></a>
  <a class="lqq" target="_blank" href="javascript:void(0);" onclick="window.open('http://connect.qq.com/widget/shareqq/index.html?url=' + encodeURIComponent(document.location.href) + '&desc=邀请详情&title=标题&summary=简介&pics=&flash=&site=邀请人或网站&callback="  title="QQ登录">qq</a>
  <script type="text/javascript" src="http://s.shareto.com.cn/js/shareto_float.js#color=0&align=right&move=1" charset="utf-8"></script>
  </body>
</html>