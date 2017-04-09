/*
$( "input.suggest-user" ).autocomplete({
    source: function( request, response ) {
        $.ajax({
            dataType: "json",
            type : 'get',
            url: '/ws/autocomplete.xqy?term=',
            success: function(data) {
                $('input.suggest-user').removeClass('ui-autocomplete-loading');  
                // hide loading image

                response( $.map( data, function(item) {
                    // your operation on data
                }));
            },
            error: function(data) {
                $('input.suggest-user').removeClass('ui-autocomplete-loading');  
            }
        });
    },
    minLength: 3,
    open: function() {},
    close: function() {},
    focus: function(event,ui) {},
    select: function(event, ui) {}
}); */

/* TODO - also a little bit broken now...
$("input.suggest-user").autocomplete({
    source: function (request, response) {
        jQuery.get("/ws/autocomplete.xqy", {
            term: request.term
        }, function (data) {
            response(data);
        });
    },
    minLength: 3,
    select: function(event, ui) { 
        $("input.suggest-user").val(ui.item.label);
        $(".search-form").submit(); 
    }
});   */


function setClock(el, deg) {
	el.setAttribute('transform', 'rotate('+ deg +' 50 50)')
};

$('.clock').each(function(i) {
    $(this).hide();
    // console.log($(this).attr("datetime"))
    var d = new Date($(this).attr("datetime"));
    setClock(document.getElementsByClassName("min")[i], 6*d.getMinutes())
	setClock(document.getElementsByClassName("hour")[i], 30*(d.getHours()%12) + d.getMinutes()/2) 
    $(this).fadeIn(2000);  
});