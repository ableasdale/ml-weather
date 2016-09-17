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

setInterval(function() {
	function r(el, deg) {
		el.setAttribute('transform', 'rotate('+ deg +' 50 50)')
	}
    
	var d = new Date()
	
    /*
    for (c in document.getElementsByClassName("min")){
        r( c,  6*d.getMinutes() )    
    }

    for (c in document.getElementsByClassName("hour")){
        r( c,  30*(d.getHours()%12) + d.getMinutes()/2 ) 
    } */

    /*$.each( [ "a", "b", "c" ], function( i, l ){
        alert( "Index #" + i + ": " + l );
    }); */

    //$(".min").each( r( $(this),  6*d.getMinutes() ))
    //$(".hour").each( r( $(this),  30*(d.getHours()%12) + d.getMinutes()/2 ))
    // r(sec, 6*d.getSeconds())  
	//r(min, 6*d.getMinutes())
	//r(hour, 30*(d.getHours()%12) + d.getMinutes()/2)

// This sets the hour and minute hands for all...

$('.min').each(function(i, el){
    r(el, 6*d.getMinutes())
});

$('.hour').each(function(i, el){
    r(el, 30*(d.getHours()%12) + d.getMinutes()/2)
});

    /*r(document.getElementsByClassName("min")[0], 6*d.getMinutes())
	r(document.getElementsByClassName("hour")[0], 30*(d.getHours()%12) + d.getMinutes()/2) */

}, 1000)