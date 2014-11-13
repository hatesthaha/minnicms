$(document).ready(function() {
    $("#kzqie").click(function() {
        var my = $(this);
        if (my.text() == '宽版') {
            $('#content,#top .topnbox').animate({
                width: '99%'
            }, 380);
            my.attr('title', '切换到窄版');
            my.text('窄版');
            setTimeout("topwidth(400)", 100);
        } else {
            $('#content,#top .topnbox').animate({
                width: '1000px'
            }, 380);
            my.attr('title', '宽版');
            my.text('宽版');
            setTimeout("topwidth(400)", 400);
        }
    });
    function _documentHight(){
         var iframeHeight = $("#main").contents().find("body").attr("height");
         // $(document).height(iframeHeight);
    }
    $("#topnav").on("click", "a", function(){
        $(".list a").removeClass("onnav");
        $(this).addClass("onnav");
        var id = $(this).attr("id").replace("nav_", "");
        $("#leftnav ul").hide();
        $("#ul_" + id).show();
        var url = $("#ul_" + id + " li:first a").attr("href");
        $("#leftnav ul li a").removeClass("on");
        $("#ul_" + id + " li:first a").addClass("on");
        $("#main").attr("src", url);
        _documentHight();
    });
    $("#leftnav ul li").on("click","a",function(){
        $("#leftnav ul li a").removeClass("on");
        $(this).addClass('on');
        _documentHight();
    });
});
