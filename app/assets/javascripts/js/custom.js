//============================== header =========================

jQuery(document).ready(function($) {

    var navbar = $('.navbar-main'),
        distance = navbar.offset().top,
        $window = $(window);

      $window.scroll(function() {
        if(($window.scrollTop() >= distance) && ($(".navbar-default").hasClass("navbar-main")))
          {
              navbar.removeClass('navbar-fixed-top').addClass('navbar-fixed-top');
              $("body").addClass("padding-top");
              $(".topBar").css("display","none");
          } else {
              navbar.removeClass('navbar-fixed-top');
              $("body").removeClass("padding-top");
              $(".topBar").css("display","block");
          }
      });

});

//============================== ALL DROPDOWN ON HOVER =========================
jQuery(document).ready(function(){
    $('.dropdown').hover(function() {
        $(this).addClass('open');
    },
    function() {
        $(this).removeClass('open');
    });
});
