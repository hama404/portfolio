//============================== ALL DROPDOWN ON HOVER =========================
jQuery(document).ready(function(){
    $('.dropdown').hover(function() {
        $(this).addClass('open');
    },
    function() {
        $(this).removeClass('open');
    });
});
