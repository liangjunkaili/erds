<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>MagicABC课程直播页面</title>
    <meta name="description" content="MagicABC">
    <meta name="keywords" content="MagicABC">
  
    <link rel="stylesheet" href="css/base1.css">
    <link rel="stylesheet" href="css/video-js.min.css">
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/utils.js"></script>
   <!--  <script>
        var cid = $.url('?courseKey');
        var clear_timeout;
        if (!cid) {
            urlGoTo('3');
        } 
        if ($.browser.msie && $.browser.versionNumber < 11) {
            urlGoTo('1');
        } 
        if ($.browser.mobile && !$.browser.ipad) {
            window.location.href = 'http://www.eeo.cn/webcast_m.php?'+$.url('query');
        } 
    </script> -->
</head>

<body>
    <!-- <div id="header-wrapper">
        <header class="cf">
            <div id="logo" class="fl"><img src="http://www.eeo.cn/upload/images/20161012/5663f400ae886d279653_260.png" width="174" height="60"></div>
            <div id="download" class="fr"><a href="http://www.eeo.cn/"><img src="/images/webcast/download.png"></a></div>
        </header>
    </div> -->
    <%@include file="top1.jsp"%>
    <div id="body-wrapper">
        <!-- <div id="course-name" class="cf">
            <i></i>
            <h1 class="fl">EEO在线课程</h1>
            <div id="share">
                <h4>分享</h4>
                <div id="share-wrapper">
                    <div class="tip-arrow"></div>
                    <div id="bdshare-wrapper" class="cf">
                        <div id="bdshare" class="fl">
                            <h3>呼唤小伙伴们前来听课吧！</h3>
                            <div class="bdsharebuttonbox" data-tag="share_1">
                                <a class="bds_tsina" data-cmd="tsina"></a>
                                <a class="bds_sqq" data-cmd="sqq"></a>
                                <a class="bds_qzone" data-cmd="qzone"></a>
                            </div>
                        </div>
                        <div class="share-weixin fr">
                            <div class="qrcode"><img src="/images/webcast/qrcode.png" width="72px" height="72px"/></div>
                            <p>微信扫码分享</p>
                        </div>  
                    </div>
                    <div id="url-copy">
                        <h4>视频链接<span id="copytips"></span></h4>
                        <div class="cf">
                            <input type="text" id="share-url" name="share-url" value="" readonly />
                            <button class="url-copy-btn fr" data-clipboard-target="#share-url">复制链接</button>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile">
                <h4>手机观看</h4>
                <div id="mobile-wrapper">
                    <div class="tip-arrow"></div>
                    <div id="qrcode-wrapper">
                        <h4>扫描二维码手机观看</h4>
                        <div class="qrcode"><img src="/images/webcast/qrcode.png" width="138px" height="138px" /></div>
                        <p>用ClassIn或微信app扫码在手机观看</p>
                        <p>扫描后可分享给好友</p>
                    </div>    
                </div>
            </div>
        </div> -->
        <div id="player-wrapper" class="cf">
            <div id="player-section" class="fl">
                <div id="lesson-name-wrapper" class="cf">
                    <div id="lesson-name" class="fl">
                        <h4><span class="lesson-num"></span><span class="lesson-name"></span><span class="lesson-date"></span><span class="lesson-start"></span><span class="lesson-duration"></span></h4>
                    </div>
                    <!-- <div id="play-count" class="fr">158次播放</div> -->
                </div>
                <div id="player">
                    <video id="video-play" width="890" height="501" class="video-js vjs-default-skin vjs-big-play-centered" controls data-setup='{"language":"zh"}' src="http://200023252.vod.myqcloud.com/200023252_be2623886de14fceb529a8db4d2a3352.f0.mp4">
                    </video>
                </div>
                <div id="show-btn">课程目录</div>        
            </div>     
            <div id="player-list" class="fr">
                <div id="hide-btn"></div>
                <div id="player-list-title">
                    <h3>课程目录</h3>        
                </div>
                <div id="player-list-wrap">
                    <ul id="player-lesson-list">
                    </ul>
                    <div id="list-loading">数据加载中...</div>
                </div>
            </div> 
        </div>
        <div id="course-wrapper" class="cf">
            <div id="course-col" class="fl">
                <div class="col-title"><h2>课程目录</h2></div>
                <div id="course-progress-wrapper" class="cf">
                    <div class="course-time fl">
                        <p>开课时间</p>
                        <div class="course-startdate fz12">2016-00-00</div>
                    </div>
                    <div class="course-progress fl">
                        <p>课程进度</p>
                        <div id="course-progress">
                            <div id="progress-bar"></div>
                        </div>
                    </div>
                    <div class="course-time fr">
                        <p>结课时间</p>
                        <div class="course-enddate fz12">2016-00-00</div>
                    </div>
                </div>
                <ul id="lesson-list">
                    
                </ul>
            </div>
            <div id="teacher-col" class="fr">
                <div class="col-title"><h2>教师介绍</h2></div>
                <ul>
                    <li><div class="teacher-avatar"><img src="http://www.eeo.cn/upload/images/20161111/fef17320ce8472fc3647_180.jpg" width="110" height="110"></div></li>
                    <li class="teacher-name"><h2></h2></li>
                    <li class="teacher-bio"><p></p></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- <div id="footer-wrapper">
        <footer>
            <p>
                <a href="/help.php">用户帮助</a>
                <span>|</span>
                <a href="/help_info.php?pkind_id=69&kind_id=85">如何使用EEOS教室</a>
                <span>|</span>
                <a href="/help_info.php?pkind_id=1&kind_id=27">我要开学校</a>
                <span>&nbsp;&nbsp;</span>
                <span>邮箱地址：contact@eeoa.com</span>
            </p>
            <p>Copyright &copy; 2014 EEOA - All rights reserved.</p>
            <p><a href="http://www.miibeian.gov.cn">京ICP备15010553号</a>. 京公网安备11010802017685</p>
        </footer>
    </div> -->
    <script src="js/scrollbar.min.js"></script>
    <script src="js/ajax.js"></script>  
    <!-- custom scroll style -->
    
    <script src="js/clipboard.min.js"></script> 
    <!-- video play -->
    <script src="js/video.min.js"></script> 
    <script src="js/videojs-contrib-hls.min.js"></script>
    <script src="js/videojs-playlist.min.js"></script>

    <script src="js/videoplay.js"></script> 
    <!-- <script src="js/bdshare.js"></script>  -->
</body>
</html>
