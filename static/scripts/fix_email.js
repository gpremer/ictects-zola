$(document).ready(function() {
    $('.fix_email').each(function(i) {
        span = $($('.fix_email')[i])
        span.text(span.text().replace('<', '').replace(' at ','@').replace(' dot ', '.').replace('>', ''))
    })
});