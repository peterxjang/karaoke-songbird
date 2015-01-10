$(document).ready(function() {

	$(document).on('click', '#header-menu', function(e) {
		e.preventDefault();
	});

	$(document).on('click', '#header-search', function(e) {
		e.preventDefault();
	});

  $(".ui-popup").bind({
    popupafterclose: function(event, ui) { 
      $('.ui-popup input').val('');
    }
  });

  $( "#autocomplete" ).on( "filterablebeforefilter", function ( e, data ) {
    var $ul = $( this ),
      $input = $( data.input ),
      value = $input.val(),
      html = "";
    $ul.html( "" );
    if ( value && value.length > 2 ) {
    	console.log(value);
      $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
      $ul.listview( "refresh" );
      $.ajax({
        url: "http://gd.geobytes.com/AutoCompleteCity",
        dataType: "jsonp",
        crossDomain: true,
        data: {
          q: $input.val()
        }
      })
      .then( function ( response ) {
        $.each( response, function ( i, val ) {
          html += "<li><a href='#'>" + val + "</a></li>";
        });
        $ul.html( html );
        $ul.listview( "refresh" );
        $ul.trigger( "updatelayout");
      });
    }
  });

});