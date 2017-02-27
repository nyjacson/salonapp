jQuery(document).ready(function($) {
    // Global menu
    $('.drawer').drawer();


    // menu fix
    $(window).on("scroll", function(){
        var scrolled = $(window).scrollTop();
        if (scrolled > 150){
            $(".GlobalNav").addClass("GlobalNav--fixed").fadeIn();
        } else {
            $(".GlobalNav").removeClass("GlobalNav--fixed");
        }
    })



});
