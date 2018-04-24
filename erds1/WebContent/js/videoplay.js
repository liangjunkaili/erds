// player flash playback
videojs.options.flash.swf = "/js/webcast/videojs/video-js.swf";
// videojs.options.techOrder = ['flash', 'html5'];
videojs.addLanguage('zh', {
    "Play": "播放",
    "Pause": "暂停",
    "Current Time": "当前时间",
    "Duration Time": "时长",
    "Remaining Time": "剩余时间",
    "Stream Type": "媒体流类型",
    "LIVE": "直播",
    "Loaded": "加载完毕",
    "Progress": "进度",
    "Fullscreen": "全屏",
    "Non-Fullscreen": "退出全屏",
    "Mute": "静音",
    "Unmuted": "取消静音",
    "Playback Rate": "播放码率",
    "Subtitles": "字幕",
    "subtitles off": "字幕关闭",
    "Captions": "内嵌字幕",
    "captions off": "内嵌字幕关闭",
    "Chapters": "节目段落",
    "You aborted the video playback": "视频播放被终止",
    "A network error caused the video download to fail part-way.": "网络错误导致视频下载中途失败。",
    "The video could not be loaded, either because the server or network failed or because the format is not supported.": "视频因格式不支持或者服务器或网络的问题无法加载。",
    "The video playback was aborted due to a corruption problem or because the video used features your browser did not support.": "由于视频文件损坏或是该视频使用了你的浏览器不支持的功能，播放终止。",
    "No compatible source was found for this video.": "无法找到此视频兼容的源。",
    "The video is encrypted and we do not have the keys to decrypt it.": "视频已加密，无法解密。"
}); 
var player = videojs('video-play');
player.on('error',function(){
    console.log('MediaError:'+ player.error().code);
    console.log('NetworkState:'+player.networkState());
    console.log('readyState:'+player.readyState());
    console.log('type:'+getVideoSourceType(src));
    console.log('currentSrc:'+player.currentSrc());
    // if(player.currentSrc() !== ''){
        setTimeout(function(){
            var src = player.currentSrc();
            var video_sources = [{
                        type: getVideoSourceType(src),
                        src: src
                    }];
            videoPlay(video_sources,true);
            console.log('loading...');
        },3000)
    // }
}) 
player.on('playlistchange', function() {  
    //player.playlist.autoadvance(0);
    player.playlist.first();
});
player.on('playlistitem',function(){
    setTimeout(function(){
        var id = $('.lesson-playing button').data('lessonid');
        var lid = '.lesson-'+id;
        var i = player.playlist.currentItem();
        $('.segment-cur').removeClass('segment-cur');
        $(lid+' .segment-'+(i+1)).addClass('segment-cur');
    },10)  
});
