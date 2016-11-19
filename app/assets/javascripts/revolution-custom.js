//full width revolution

jQuery(document).ready(function () {
    revapi = jQuery('.tp-banner').revolution(
            {
                delay: 6000,
                startwidth: 1170,
//                startheight: 650,
                hideThumbs: 10,
                fullScreen: "on",
                forceFullWidth: "on",
                navigationStyle: "preview4"
            });

});	//ready

$('.tp-banner-video').show().revolution({
    dottedOverlay: "none",
    delay: 9000,
    startheight: 700,
    hideTimerBar: "on",
    navigationType: "none",
    navigationStyle: "preview4",
    touchenabled: "on",
    swipe_velocity: 0.7,
    swipe_min_touches: 1,
    swipe_max_touches: 1,
    drag_block_vertical: false,
    keyboardNavigation: "on",
    fullScreen: "on",
    spinner: "spinner1",
    stopLoop: "off",
    stopAfterLoops: -1,
    stopAtSlide: -1,
    forceFullWidth: "off",
    fullScreenAlignForce: "off",
    minFullScreenHeight: "400",
    hideThumbsOnMobile: "off",
    hideNavDelayOnMobile: 1500,
    hideBulletsOnMobile: "off",
    hideArrowsOnMobile: "off"
});


