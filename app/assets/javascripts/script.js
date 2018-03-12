/*	Table OF Contents
 ==========================
 Carousel
 Ajax Tab
 List view , Grid view  and compact view
 Global Plugins
 Customs Script
 Responsive cat-collapse for homepage
 */


$(document).ready(function () {

    /*==================================
     Carousel
     ====================================*/
    var ifrtl = false;
    var dir = $("html").attr("dir");
    if(dir == "rtl")  {
        var ifrtl = true;
    }


    // Featured Listings  carousel || HOME PAGE
    var owlitem = $(".item-carousel");

    owlitem.owlCarousel({
        //navigation : true, // Show next and prev buttons
        navigation: false,
        pagination: true,
        items: 5,
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsTabletSmall: [660, 2],
        itemsMobile: [400, 1]

    });

    // Custom Navigation Events
    $("#nextItem").click(function () {
        owlitem.trigger('owl.next');
    });
    $("#prevItem").click(function () {
        owlitem.trigger('owl.prev');
    });


    // Featured Listings  carousel || HOME PAGE
    var featuredListSlider = $(".featured-list-slider");

    featuredListSlider.owlCarousel({
        //navigation : true, // Show next and prev buttons
        navigation: false,
        pagination: false,
        items: 5,
        itemsDesktopSmall: [979, 3],
        itemsTablet: [768, 3],
        itemsTabletSmall: [660, 2],
        itemsMobile: [400, 1]


    });

    // Custom Navigation Events
    $(".featured-list-row .next").click(function () {
        featuredListSlider.trigger('owl.next');
    });

    $(".featured-list-row .prev").click(function () {
        featuredListSlider.trigger('owl.prev');
    });



    /*==================================
     List view clickable || CATEGORY
     ====================================*/

    // List view , Grid view  and compact view

    //  var selector doesn't work on ajax tab category.hhml. This variables elements disable for V1.6
    //  var listItem = $('.item-list');
    //  var addDescBox = $('.item-list .add-desc-box');
    //  var addsWrapper = $('.adds-wrapper');

    $('.list-view,#ajaxTabs li a').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.grid-view,.compact-view').removeClass("active");
        $('.list-view').addClass("active");
        $('.item-list').addClass("make-list").removeClass("make-grid make-compact");


        if ($('.adds-wrapper').hasClass('property-list')) {
            $('.item-list .add-desc-box').removeClass("col-sm-9").addClass("col-sm-6");
        } else {
            $('.item-list .add-desc-box').removeClass("col-sm-9").addClass("col-sm-7");
        }

        $(function () {
            $('.item-list').matchHeight('remove');
        });
    });

    $('.grid-view').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.list-view,.compact-view').removeClass("active");
        $(this).addClass("active");
        $('.item-list').addClass("make-grid").removeClass("make-list make-compact");


        if ($('.adds-wrapper').hasClass('property-list')) {
            // keep it for future
        } else {
            //
        }

        $(function () {
            $('.item-list').matchHeight();
            $.fn.matchHeight._apply('.item-list');
        });

    });


    $('.compact-view').click(function (e) { //use a class, since your ID gets mangled
        e.preventDefault();
        $('.list-view,.grid-view').removeClass("active");
        $(this).addClass("active");
        $('.item-list').addClass("make-compact").removeClass("make-list make-grid");


        if ($('.adds-wrapper').hasClass('property-list')) {
            $('.item-list .add-desc-box').addClass("col-sm-9").removeClass('col-sm-6');
        } else {
            $('.item-list .add-desc-box').toggleClass("col-sm-9 col-sm-7");
        }

        $(function () {
            $('.adds-wrapper .item-list').matchHeight('remove');
        });
    });


    // smooth scroll to the ID
    $(document).on('click', 'a.scrollto', function (event) {
        event.preventDefault();

        $('html, body').animate({
            scrollTop: $($.attr(this, 'href')).offset().top
        }, 500);
    });


    /*=======================================================================================
     cat-collapse Homepage Category Responsive view
     ========================================================================================*/

}); // end Ready


	
