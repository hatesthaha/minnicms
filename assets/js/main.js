$(document).ready(function() {
    $(".verify").click(function() {
        var time = new Date().getTime();
        $(this).attr("src", root + "/Index/verify/" + time);
    });
});
