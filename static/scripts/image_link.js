$(document).ready(function() {
    function img_activate() {
        var img_url = $(this).attr('src');
        img_url = img_url.replace(/_inactive/, '');
        $(this).attr('src', img_url);
    }

    function img_deactivate() {
        var img_url = $(this).attr('src');
        img_url = img_url.replace(/\.png/, '_inactive.png'); 
        $(this).attr('src', img_url);
    }

    $('a img.img_light').hover(img_activate, img_deactivate)
});