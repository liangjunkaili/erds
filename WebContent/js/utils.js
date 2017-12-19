var trimStr = function(str, len) {
    //length属性读出来的汉字长度为1
    if(str.length*2 <= len) {
        return str;
    }
    var strlen = 0;
    var s = "";
    for(var i = 0;i < str.length; i++) {
        s = s + str.charAt(i);
        if (str.charCodeAt(i) > 128) {
            strlen = strlen + 2;
            if(strlen >= len){
                return s.substring(0,s.length-1) + "...";
            }
        } else {
            strlen = strlen + 1;
            if(strlen >= len){
                return s.substring(0,s.length-2) + "...";
            }
        }
    }
    return s;
}

var showErr = function(id,msg){
    var lid = '.lesson-'+id;
    var msg = msg || "数据请求错误，请刷新页面重试！"
    $(lid+' .lesson-info').text(msg).addClass('lesson-err');
}

// 错误跳转
var urlGoTo = function(err,url){
    var err = err || '2'; // 1 : browser compatibility 2: other errors
    var url = url || 'http://www.eeo.cn/webcast_error.html';
    window.location.href = url+'?err='+ err ;
}
/*
var clickName;
if($.browser.ipad){
    clickName = 'tap';
}else{
    clickName = 'click';
}
*/