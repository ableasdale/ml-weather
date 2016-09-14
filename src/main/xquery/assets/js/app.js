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

jQuery("input.suggest-user").autocomplete({
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
});  