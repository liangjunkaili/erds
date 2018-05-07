(function ($) {
    function init() {
        var width = $(".teacher li:first").width();

        $(".teacher").css({
            width: width * length + "px"
        });

        $(".school-list").hover(function () {
            clearInterval(timer)
        }, function () {
            timer = setInterval(function () {
                $(".teacher").stop().animate({
                    marginLeft: -width
                }, 1000, function () {
                    $(".teacher .on").next("li").addClass("on").siblings().removeClass("on"), $(".teacher li:first").appendTo($(".teacher"));
                    $(".teacher").css({
                        "margin-left": 0
                    })
                })
            }, 3000)
        }).trigger('mouseout');

        $(".dispose").mouseover(function () {
            clearInterval(timer)
        });

        $(".dispose").mouseout(function () {
            timer = setInterval(function () {
                $(".teacher").stop().animate({
                    marginLeft: -width
                }, 1000, function () {
                    $(".teacher .on").next("li").addClass("on").siblings().removeClass("on"), $(".teacher li:first").appendTo($(".teacher"));
                    $(".teacher").css({
                        "margin-left": 0
                    })
                })
            }, 3000)
        });
    }

    function next() {
        $(".teacher li:first").stop().animate({
            marginLeft: -outerMargin
        }, 1000, function () {
            $(this).css({
                marginLeft: marginLeft
            }).appendTo($(".teacher"))
        })
    }

    function left() {
        $(".teacher li:last").prependTo($(".teacher")), $(".teacher li:first").css({
            marginLeft: -outerMargin
        }).stop().animate({
            marginLeft: marginLeft
        }, 1000), $(".teacher .on").prev("li").addClass("on").siblings().removeClass("on")
    }

    var timer, length = $(".teacher li").length,
        marginLeft = parseInt($(".teacher li:first").css("marginLeft")),
        outerMargin = $(".teacher li:first").outerWidth() + marginLeft,
        outerWidth = $(".teacher li:first").outerWidth(),
        width = outerWidth * length;
    $(".teacher").css({
        width: width + "px"
    });

    $(".teacher").find("li").eq(3).addClass("on");

    $(".left").click(function () {
        $(".teacher li:first").is(":animated") || left();
    });

    $(".right").click(function () {
        $(".teacher li:first").is(":animated") || (next(), $(".teacher .on").next("li").addClass("on").siblings().removeClass("on"));
    });

    $(".teacher-head").hover(function () {
        $(this).parent().addClass("on").siblings().removeClass("on");
    });

    init();
})(jQuery);