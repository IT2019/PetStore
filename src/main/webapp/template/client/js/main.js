var base_url = "http://localhost:8090/PetStoreWeb/";
jQuery(document).ready(function($) {

    // jQuery sticky Menu

    $(".mainmenu-area").sticky({ topSpacing: 0 });

    $(".add_to_cart_button").click(function(e) {
        e.preventDefault();
        $("#quantity").val();
        window.location.href = base_url + 'add-to-cart?code=' + $(".add_to_cart_button").val() + '&quantity=' + $("#quantity").val();

    });
    $('.product-carousel').owlCarousel({
        loop: true,
        nav: true,
        margin: 20,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 3,
            },
            1000: {
                items: 5,
            }
        }
    });

    $('.related-products-carousel').owlCarousel({
        loop: true,
        nav: true,
        margin: 20,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 2,
            },
            1000: {
                items: 2,
            },
            1200: {
                items: 3,
            }
        }
    });

    $('.brand-list').owlCarousel({
        loop: true,
        nav: true,
        margin: 20,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
            },
            600: {
                items: 3,
            },
            1000: {
                items: 4,
            }
        }
    });


    // Bootstrap Mobile Menu fix
    $(".navbar-nav li a").click(function() {
        $(".navbar-collapse").removeClass('in');
    });

    // jQuery Scroll effect
    $('.navbar-nav li a, .scroll-to-up').bind('click', function(event) {
        var $anchor = $(this);
        var headerH = $('.header-area').outerHeight();
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top - headerH + "px"
        }, 1200, 'easeInOutExpo');

        event.preventDefault();
    });

    // Bootstrap ScrollPSY
    $('body').scrollspy({
        target: '.navbar-collapse',
        offset: 95
    })
});

(function(i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] || function() {
        (i[r].q = i[r].q || []).push(arguments)
    }, i[r].l = 1 * new Date();
    a = s.createElement(o),
        m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
})(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

ga('create', 'UA-10146041-21', 'auto');
ga('send', 'pageview');

$('.ht-setting-trigger, .ht-currency-trigger, .ht-language-trigger, .hm-minicart-trigger, .cw-sub-menu').on('click', function(e) {
    e.preventDefault();
    $(this).toggleClass('is-active');
    $(this).siblings('.ht-setting, .ht-currency, .ht-language, .minicart, .cw-sub-menu li').slideToggle();
});
$('.ht-setting-trigger.is-active').siblings('.catmenu-body').slideDown();
$(".qtybutton").on("click", function() {
    var $button = $(this);
    var oldValue = $button.parent().find("input").val();
    if ($button.hasClass('inc')) {
        var newVal = parseFloat(oldValue) + 1;
    } else {
        // Don't allow decrementing below zero
        if (oldValue > 0) {
            var newVal = parseFloat(oldValue) - 1;
        } else {
            newVal = 0;
        }
    }
    $button.parent().find("input").val(newVal);
});