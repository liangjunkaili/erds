var scrollBar = new ScrollBar({
        scrollWindow:'#player-list-wrap',
        scrollContent:'#player-lesson-list',
        scrollStart:'right,top',
        mousewheel:true,
        // byTransform:true,
        touchDrag:true,
    })
// play list hide & show
var playlistToggle = function(){
    $('#hide-btn').click(function(){
        $(this).hide();
        $('#player-section').width(1200);
        $('#player-list').hide();
        $('#show-btn').css("display","block");
    });
    $('#show-btn').click(function(){
        $('#player-section').width(890);
        $('#player-list').show();
        $('#hide-btn').show();
        $('#show-btn').css("display","none");
    });
}

var videoPlay = function(sources,autoplay){
    player.ready(function () {
        var _this = this;
        _this.src(sources);
        _this.load();
        if(autoplay){
            _this.play();
        }
    });
}

// 生成二维码
var setQRCode = function(){
    var qrUrl = $('#share-url').val();
    var query = $.url('query',qrUrl);

    var url = 'http://www.eeo.cn/import/code/qrimg.php?tourl=http://www.eeo.cn/webcast_m.php?'+ query;
    $(".qrcode img").attr("src",url);
}


// 设置分享链接 和 二维码地址
var setShareUrl = function(lid) {  // lid: lesson id
    var shareUrl;
    var url = 'http://www.eeo.cn/webcast.php?courseKey=';
    var cid = $.url('?courseKey') || '';
    if(lid){
        shareUrl = url+cid+'&lessonid='+lid;
    } else {
        shareUrl = $.url(); 
    }

    $("#share-url").attr("value",shareUrl);
    setQRCode();
}

// 复制分享链接
var copyShareUrl = function(){
    var clipboard = new Clipboard('.url-copy-btn');
    clipboard.on('success', function(e) {
        $('#copytips').text('链接复制成功，请按Ctrl+V粘贴');

        e.clearSelection();
    });

    clipboard.on('error', function(e) {
        console.error('Action:', e.action);
        console.error('Trigger:', e.trigger);
    });
}

// 设置直播课提示信息
var setPoster = function(lid){
    var i = $(lid).data('title');
    var html = '<div id="poster"><p><span class="lesson-name">'+ i.tName +'</span></p><p><span class="lesson-date">'+ i.tDate +'</span><span class="lesson-start">'+ i.tStart +'</span><span class="lesson-duration">'+ '('+ i.tDuration + '分钟)' + '</span></p></div>'
    $('#player').empty().html(html);

}

var setDefaultPlayError = function() {
    var html = '<div id="default-play-err"><img src="images/webcast/error.png"><p>没有可以播放的视频</p></div>'
    $('#player').empty().html(html);
}

// 根据请求url设置默认视频播放
var setDefaultVideoPlay = function(cid) { 
    var id = $.url('?lessonid') || '';
    var liveid = $('.lesson-btn-live').data('lessonid');
    var defaultid = $('.lesson-btn-play').first().data('lessonid');
    var unliveid = $('.lesson-btn-unlive').first().data('lessonid');
    var tInfo,lid;

    var _setDefault = function(){
        tInfo = $(lid).data('tInfo');
        setTeacherInfo(tInfo);
        $(lid).addClass('lesson-playing');
    }

    if(id) {  // 优先播放url中请求的lessonid
        getVideoSource(id,cid);
        setVideoTitle(id);
        lid = '.lesson-'+id;
        _setDefault();
    } else if(liveid) {  // 其次：如果当前有直播则自动播放
        getVideoSource(liveid,cid,true);
        setVideoTitle(liveid);
        lid = '.lesson-'+ liveid;
        _setDefault();
    } else if(defaultid){ // 播放列表第一条可回放视频
        getVideoSource(defaultid,cid);
        setVideoTitle(defaultid);
        lid = '.lesson-'+ defaultid;
        _setDefault();
    } else if(unliveid){ // 以上三种情况都没有，加载直播课第一条信息
        lid = '.lesson-'+unliveid;
        setVideoTitle(unliveid);
        setPoster(lid);
        _setDefault();
    } 
    else {
        setDefaultPlayError();
    }
}

var setDefaultPosition = function() {
    var isPlaying = $('#player-lesson-list li').hasClass('lesson-playing')
    if(isPlaying) {
        var y = $('.lesson-playing').position().top;
        if ( y > 400) {
            var y = 400 - y;
            scrollBar.contentScrollY(y);
        }
    }
}
// 设置课程进度和名称
var setCourseInfo = function(cid) {
	$.ajax({
            url: '/ajax/webcast.ajax.php?action=getCourseInfo',
            type: 'post',
            dataType: 'json',
            data: {courseKey: cid},
        })
        .done(function(data) {
            if(data.code == '1'){
                var i = data.courseInfo;
                if(i.schoolLogo != ""){
                    $("#logo img").attr("src", i.schoolLogo)
                }
                $('title').text(i.courseName);
                $('#course-name h1').text(i.courseName);
                $('.course-startdate').text(i.startDate);
                $('.course-enddate').text(i.endDate);
                $('.course-progress p').text('课程进度：'+i.courseEnd+'/'+i.courseSum+'(共'+i.courseSum+'节课)');
                if(i.progress != 0){
                    $('#progress-bar').css('width',i.progress);
                }
            
            } 
            else {
                urlGoTo('ci');
            }
        });     	
}

// 转换button对应的状态
var transCode = function(c) {  // c : code
    var btn;
    switch(c.lessonStatus)
    {
        case '0':
        case '2':
            btn = '<button class="lesson-btn"  disabled>非公开</button>';
            break;
        case '1':
            btn = '<button class="lesson-btn lesson-btn-play" data-lessonid="'+ c.lessonId+'"></button>';
            break;
        case '10':
            btn = '<button class="lesson-btn lesson-btn-unlive" data-lessonid="'+ c.lessonId+'" disabled>直播课</button>';
            break;
        case '20':
            btn = '<button class="lesson-btn" disabled>录播课</button>';
            break;
        case '30':
            btn = '<button class="lesson-btn" disabled>非公开</button>';
            break;
        case '11':
            btn = '<button class="lesson-btn lesson-btn-live" data-lessonid="'+ c.lessonId+'">直播中</button>';
            break;
        case '21':
            btn = '<button class="lesson-btn" disabled>上课中</button>';
            break;
        case '31':
            btn = '<button class="lesson-btn" disabled>非公开</button>';
            break;
    }
    return btn;
}

// 加载课程列表
var setLessonList = function(cid) {
    $.ajax({
        url: 'getSubject',
        type: 'post',
        dataType: 'json',
        data: "did="+cid,
    })
    .done(function(data) {
        $('#list-loading').hide();
        if(data.code ==200){
            $.each(data.list, function(i, v){
                var lesson_list_li = '<li class="lesson-'+ v.id +'"><div class="lesson-info cf"><div class="fl"> <span class="lesson-num">'+ v.id +'</span> <span class="lesson-name"><h3  title="'+ v.title +'">'+ trimStr(v.title, 56) +'</h3></span></div><div class="fr">'+ '<button class="lesson-btn" disabled>录播课</button>' +'</div> </div> </li>'

                $(lesson_list_li).appendTo('#lesson-list');

                var player_list_li = '<li class="lesson-'+ v.id +'"><div class="lesson-info cf"> <div class="fl"><span class="lesson-num">'+ v.id +'</span></div> <div class="fl"> <h3 class="lesson-name" title="'+ v.title +'">'+ trimStr(v.title, 22) +'</h3> </div> <div class="fr">'+ '<button class="lesson-btn" disabled>录播课</button>' +'</div> </div> <div class="sub-lesson-list cf"></div><div class="bd-bottom"></div></li>'

                $(player_list_li).appendTo('#player-lesson-list');

                var ls = v.lessonStatus;
                 
                if (ls == '1' || ls == '11' || ls == '10') {
                    $('.lesson-'+v.lessonId).data({
                        tInfo: {
                            tAvatar:    v.teacherAvatar, 
                            tName:      v.teacherName, 
                            tBio:       v.teacherBio,
                        },
                        title: {
                            tNum:       v.lessonSortNum, 
                            tName:      v.lessonName, 
                            tDate:      v.lessonDate, 
                            tStart:     v.lessonStarttime, 
                            tDuration:  v.lessonDuration,
                            tStatus:    v.lessonStatus
                        }
                    });
                }    
            });
            //setDefaultVideoPlay(cid);
            scrollBar.resize();
            setDefaultPosition();
            $('.lesson-btn-play,.lesson-btn-live').parents('li').children(".lesson-info").addClass('can-play');
        } 
        else {
            urlGoTo('ll');
        }
    });
    
}
var setSubLessonList = function(sublist, lid){
    $.each(sublist, function(i, v) {
        i++;
        var class_name = 'segment-'+ i;
        var item = '<div class="segment '+ class_name +'">'+ i +'</div>';
        $(item).appendTo(lid +" .sub-lesson-list");
        
        var full_class_name = '.'+ class_name;
        $(full_class_name).data('subSource',v.sources);
        
        $(lid+' .lesson-info').removeClass('url-loading').addClass('url-ready');
        $('.segment').parent().addClass('sub-lesson');
    });

    scrollBar.resize();
}
// 设置视频标题信息
var setVideoTitle = function(lid) {
    var lid = '.lesson-'+lid;
    var i = $(lid).data('title');

    $('#lesson-name .lesson-num').text('第'+i.tNum+'节');
    $('#lesson-name .lesson-name').text(i.tName);
    $('#lesson-name .lesson-date').text(i.tDate);
    $('#lesson-name .lesson-start').text(i.tStart);
    $('#lesson-name .lesson-duration').text('('+i.tDuration+'分钟)');
}

var setTeacherInfo = function (i) {
    $('.teacher-avatar img').attr("src", i.tAvatar);
    $('.teacher-name h2').text(i.tName);
    $('.teacher-bio p').text(i.tBio || '');
}

var getVideoSourceType = function(url){
    if (!url) return;
    var type;
    if(url.match(/\.flv/)){
        type = 'video/x-flv';
    } else if(url.match(/\.mp4/)){
        type = 'video/mp4'
    } else if(url.match(/\.m3u8/)){
        type = 'application/x-mpegURL';
    } else {
        type = 'video/webm';
    }
    return type;
}

var segmentFirst = function(lid) {
    $('.segment-cur').removeClass('segment-cur');
    $(lid+' .segment-1').addClass('segment-cur');
}

var setVideoElement = function(){
    $('#video-play').show();
    $('#default-play-err').remove();
}

var setLiveStatusInfo = function(){
    var html = '<div id="default-play-err"><img src="/images/webcast/error.png"><p class="fz16"><span class="color-green">请稍等</span>,本课程教师正在赶来的路上哦！</p></div>';
    $('#video-play').hide();
    $(html).appendTo('#player');
}

// get video source
var getVideoSource = function(id,cid,autoplay) {
    var lid = '.lesson-'+id;
    $.ajax({
            url: '/ajax/webcast.ajax.php?action=getLessonInfo',
            type: 'post',
            dataType: 'json',
            data: {lessonId: id, courseKey: cid},
            beforeSend: function(){
                if(!($(lid+' .lesson-info').hasClass('url-loading'))){
                    $(lid+' .lesson-info').addClass('url-loading');
                }
            }
        })
        .done(function(data) {
            if(data.code == '1'){
                if(data.lessonStatus == '11'){
                    if (data.liveStatus == '1') {
                        if(clear_timeout){
                            clearTimeout(clear_timeout);
                            setVideoElement();
                        }
                        var video_sources = [{
                            type: "application/x-mpegURL",
                            src: data.hls
                        },{
                            type: "rtmp/flv",
                            src: data.rtmp
                        },];
                        videoPlay(video_sources,true);
                        $(lid+' .lesson-info').data('videoSources',video_sources);
                        $(lid+' .lesson-info').removeClass('url-loading').addClass('url-ready');
                    } else {
                        if($('#default-play-err').length == 0){
                            setLiveStatusInfo();
                        }
                        $(lid+' .lesson-info').removeClass('url-loading');
                        clear_timeout = setTimeout(function(){
                            getVideoSource(id,cid,autoplay);
                        },10000);   
                    }
                    
                } else if (data.lessonStatus == '1') {
                    var status = $(lid).data('title').tStatus;
                    if (data.lessonStatus != status){ 
                        $('.lesson-btn-live').removeClass('lesson-btn-live').empty().addClass('lesson-btn-play');
                    }
                    setVideoElement();

                    var videoList = $.map(data.hls, function(n){
                        var sources = {
                            sources: [{
                                src: n,
                                type: getVideoSourceType(n)
                            }],
                        }
                        return sources;
                    }) ;
                    $(lid+' .lesson-info').data('videoList',videoList);
                    setSubLessonList(videoList, lid);

                    player.playlist(videoList);
                    player.playlist.autoadvance(0);
                    // if(autoplay){
                    //     player.play();
                    // }
                    segmentFirst(lid);

                } else {
                    if($(lid+' .lesson-btn').hasClass('lesson-btn-play')){
                        $(lid+' .lesson-btn').removeClass('lesson-btn-play').text('非公开');
                    }else if ($(lid+' .lesson-btn').hasClass('lesson-btn-live')){
                        $(lid+' .lesson-btn').removeClass('lesson-btn-live').text('非公开');
                    }else {
                        showErr(id);
                    }
                }    
            } else if(data.code == '2') {
                urlGoTo('4');
            }
            else {
                showErr(id,data.errMsg);
            }     
        })
        .fail(function(){
            showErr(id);
        });
}

// lesson-btn click
var lessonBtnClick = function(cid) {
    $('body').on(clickName, '.can-play', function() {
        var isLoading = $(this).hasClass('url-loading');
        if(!isLoading){
            $(this).addClass('url-loading');
            var id = $(this).find('button').data("lessonid");
            var lid = '.lesson-'+id;
            var status = $(lid).data('title').tStatus;
            $('.lesson-playing').removeClass('lesson-playing');
            $(lid).addClass('lesson-playing');
            $('#copytips').text('');

            if(clear_timeout){
                clearTimeout(clear_timeout);
            }

            if ($(this).hasClass('url-ready')){
                if (status == '1') {
                    $(lid+' .sub-lesson-list').show();
                    $(lid).siblings().children('.sub-lesson-list').hide();
                    scrollBar.resize();
                    var videoList = $(this).data('videoList');

                    player.playlist(videoList);
                    player.playlist.autoadvance(0);
                    $(this).removeClass('url-loading');
                } else if (status == '11') {
                    $(lid).siblings().children('.sub-lesson-list').hide();
                    scrollBar.resize();
                    var videoSources = $(this).data('videoSources');
                    videoPlay(videoSources,true);
                    $(this).removeClass('url-loading');
                }
            } else {
                $(lid+' .sub-lesson-list').show();
                $(lid).siblings().children('.sub-lesson-list').hide();
                scrollBar.resize();
                var tInfo = $(lid).data('tInfo');
                
                $('html,body').animate({scrollTop:0},500);
                
                //setCourseInfo(cid);
                setTeacherInfo(tInfo);

                //setShareUrl(id);
                
                setVideoTitle(id);
                //getVideoSource(id,cid,true);
            }
        }
    });

}

var lessonSegmentClick = function(cid) {
    $('body').on(clickName, '.segment', function () {
        var video_sources = $(this).data('subSource');
        videoPlay(video_sources,true);
        $('.segment-cur').removeClass('segment-cur');
        $(this).addClass('segment-cur');
    });  
}

$(document).ready(function(){
    var cid = GetQueryString('did');
    playlistToggle();
	//setShareUrl();
    //copyShareUrl();
    setLessonList(cid);
    //setCourseInfo(cid);
    //lessonBtnClick(cid);
    //lessonSegmentClick();  
})
function GetQueryString(name)
{
     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
     var r = window.location.search.substr(1).match(reg);
     if(r!=null)return  unescape(r[2]); return null;
}