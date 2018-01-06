var $$=jQuery.noConflict();
$$(function(){
    // video 交互
    var s1;
    var $videoBox = $$('.js_video_box');
    var $videoBoxBg = $$('.js_video_box_bg');
    var $videoPre = $$('.js_video_pre');

    $$('.js_video').hover(function() {
        $$(this).children().children('.js_playbox').slideDown(300);
    }, function() {
        $$(this).children().children('.js_playbox').slideUp(300);
    });

    $$('.js_video_play').click(function() {
        var src = $$(this).data('src');
        console.log("src: "+src);
        s1 = new SWFObject("../../images/mediaplayer.swf","single","800","500","7");
        s1.addParam("allowfullscreen","true");
        s1.addVariable("file", location.href + src);
        s1.addVariable("autostart","true");
        s1.write("video");

        var winH = $$(window).height();
        var $body = $$('body');
        var bodyH = $body.height();
        var bodyW = $body.width();
        var retH = winH > bodyH + 400 ? winH : bodyH + 400;

        $videoBoxBg.height(retH);
        $videoBox.css({top: (winH - 500) / 2, left: (bodyW - 800) / 2});
        $videoBox.show();
        $videoBoxBg.show();
        setTimeout(function() {
            $videoPre.hide();
        }, 200);
    })
    $$('.js_video_box_close').click(function() {
        $videoBox.hide();
        $videoBoxBg.hide();
        $videoPre.show();
        s1 = null;
    });
});