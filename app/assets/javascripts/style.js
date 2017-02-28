jQuery(document).ready(function($) {
    // Global menu
    $('.drawer').drawer();


    // menu fix
    var windowWidth = $(window).width();
    var windowSM = 743;
    $(window).on("resize", function(){
        windowWidth = $(window).width();
    })
    $(window).on("scroll", function(){
        if (windowWidth >= windowSM) {
            var scrolled = $(window).scrollTop();
            if (scrolled > 250){
                $(".GlobalNav").addClass("GlobalNav--fixed").fadeIn();
            } else {
                $(".GlobalNav").removeClass("GlobalNav--fixed");
            }
        }
    })
});
