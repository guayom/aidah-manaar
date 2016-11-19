/*
 * Bavely v1.2
 * Design_mylife
 */



/**smooth scroll on anchor tag****/
$(document).ready(function () {
    $(function () {
        $('.scroll-to a[href*=#]:not([href=#])').click(function () {
            if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                if (target.length) {
                    $('html,body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                    return false;
                }
            }
        });
    });
});

/*=========================*/
 /*========on hover dropdown navigation====*/
 /*==========================*/


 // $(document).ready(function() {
 //
 //      $('.js-activated').dropdownHover({
 //          instantlyCloseOthers: false,
 //          delay: 0
 //      }).dropdown();
 //
 //  });


/* -------------------
 Parallax Sections
 ---------------------*/
if (!Modernizr.touch) {
    $('.parallax-1').parallax("50%", 0.5);
    $('.parallax-2').parallax("50%", 0.5);
    $('.parallax-3').parallax("50%", 0.5);
    $('.parallax-4').parallax("50%", 0.5);
    $('.parallax-bg').parallax("50%", 0.5);
    $('.intro-banner').parallax("50%", 0.5);
}
/*----------------
 Auto Close Navbar
 -----------------*/
$(document).ready(function () {
    function close_toggle() {
        if ($(window).width() <= 992) {
            $('.navbar-collapse a').on('click', function () {
                $('.navbar-collapse').collapse('hide');
            });
        }
        else {
            $('.navbar .navbar-default a').off('click');
        }
    }
    close_toggle();
    $(window).resize(close_toggle);
    $(".navbar-collapse").css({maxHeight: $(window).height() - $(".navbar-header").height() + "px"});
    $(function () {
        $('.navbar-toggle').bind('click', function (event) {
            var $anchor = $('.navbar-header');
            $('html, body').stop().animate({
                scrollTop: $($anchor).offset().top - 0
            }, 800, 'swing');
            event.preventDefault();
        });
    });
});
//flex slider for testimonials
$(document).ready(function () {
    $(window).load(function () {
        $('.testi-slider').flexslider({
            animation: "slide",
            direction: "vertical",
            prevText: "<i class='ion-android-arrow-back'></i>",
            nextText: "<i class='ion-android-arrow-forward'></i>"
        });
    });
});
//flex slider for blog image slider
$(document).ready(function () {
    $(window).load(function () {
        $('.blog-slider').flexslider({
            animation: "fade",
            slideshowSpeed: 4000,
            controlNav: false,
            prevText: "<i class='ion-android-arrow-back'></i>",
            nextText: "<i class='ion-android-arrow-forward'></i>"
        });
    });
});
//flex slider for home parallax text slider
$(document).ready(function () {
    $(window).load(function () {
        $('#home-slider').flexslider({
            animation: "fade",
            slideshow: true,
            slideshowSpeed: 3500,
            animationDuration: 500,
            directionNav: false,
            controlNav: true,
            smootheHeight: true
        });
    });
});




//  TWEETIE -  TWITTER FEED PLUGIN THAT WORKS WITH NEW Twitter 1.1 API
jQuery(document).ready(function () {
    $('.tweet').twittie({
        apiPath: 'assets/twit-api/tweet.php',
        dateFormat: '%b. %d, %Y',
        template: '{{tweet}} <div class="date">{{date}}</div> <a href="{{url}}"{{screen_name}}',
        count: 1
    });
});



/* ==============================================
 Sticky Navbar
 =============================================== */

$(document).ready(function () {
    $(".sticky-nav").sticky({topSpacing: 0});
});



//on hover dropdown navigation
// $(document).ready(function () {
//
//     $('.js-activated').dropdownHover({
//         instantlyCloseOthers: false,
//         delay: 0
//     }).dropdown();
//
// });


//wow js
jQuery(document).ready(function () {
    wow = new WOW(
            {
                animateClass: 'animated',
                offset: 100,
                mobile: true
            }
    );
    wow.init();
});

//tooltip and popovers
jQuery(document).ready(function () {
    $("[data-toggle=popover]").popover();

    $("[data-toggle=tooltip]").tooltip();
});


//mailchimp
// $('.form-subscribe input[type="text"], .form-subscribe input[type="email"]').live('focus keypress', function() {
// 	var $email = $(this);
//
// 	if ($email.hasClass('error')) {
// 		$email.val('').removeClass('error');
// 	}
// 	if ($email.hasClass('success')) {
// 		$email.val('').removeClass('success');
// 	}
// });

	// Subscribe form when submit to database
	$('.form-subscribe').submit(function() {
		var $email	= $(this).find('input[name="email"]');
		var $submit	= $(this).find('input[name="submit"]');

		var email_pattern = /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i;
		if (email_pattern.test($email.val()) === false) {
			$email.val('Please enter a valid email address!').addClass('error');
		} else {
			var submitData = $(this).serialize();
			$email.attr('disabled','disabled');
			$submit.attr('disabled','disabled');
			$.ajax({ // Subcribe process with AJAX
				type: 'POST',
				url: './assets/mailchimp/process-subscribe.php',
				data: submitData + '&action=add',
				dataType: 'html',
				success: function(msg) {
					if (parseInt(msg, 0) !== 0) {
						var msg_split = msg.split('|');

						if (msg_split[0] === 'success') {
							$submit.removeAttr('disabled');
							$email.removeAttr('disabled').val(msg_split[1]).addClass('success');
						} else {
							$submit.removeAttr('disabled');
							$email.removeAttr('disabled').val(msg_split[1]).addClass('error');
						}
					}
				}
			});
		}

		return false;
	});
