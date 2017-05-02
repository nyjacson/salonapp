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

    function motionRipple(){
        var $rippleElement = $("<span></span>", {class: 'js-rippleElement'});
        var $clickable = $('.js-Motion-ripple');
        $rippleElement.appendTo($clickable);
        $clickable.on('mouseenter', function(e){
            var _self = this;
            var $effect = $(_self).find('.js-rippleElement');

            if (!$effect.hasClass('js-is-show')) {
            $effect.addClass('js-is-show');
            setTimeout(function() {
                $effect.removeClass('js-is-show');
                // console.log("timeout");
            }, 400);
        }
        return false;

        });
    }
    motionRipple();

});
