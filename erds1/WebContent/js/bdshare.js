// bdshare
$(window).load(function(){
	window._bd_share_config = {
	    common : {
	        bdText : $('.lesson-name').text(),   
	        bdDesc : $('[name="description"]').attr('content'),   
	        bdUrl : $.url(), 
	        bdPic : $('#weixin-share img').attr('src'),	

	    },
	    share : [{
	        "bdSize" : 32
	    }],
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
})