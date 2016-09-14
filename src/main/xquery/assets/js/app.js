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
            // assuming data is a JavaScript array such as
            // ["one@abc.de", "onf@abc.de","ong@abc.de"]
            // and not a string
            response(data);
        });
    },
    minLength: 3
});  

/*
$.get('/ws/autocomplete.xqy', function(data){
    $("#name").typeahead({ source:data });
},'json');
*/