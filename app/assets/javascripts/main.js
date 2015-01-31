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
      $ul.html( "<li><div class='ui-loader'><span class='ui-icon ui-icon-loading'></span></div></li>" );
      $ul.listview( "refresh" );
      $.ajax({
        url: '/search',
        type: 'GET',
        data: {
          query: $input.val()
        }
      })
      .then( function ( response ) {
        html = response.html;
        $ul.html( html );
        $ul.listview( "refresh" );
        $ul.trigger( "updatelayout");
      });
    }
  });

	$(document).on('click', '#autocomplete a', function (e) {
		e.preventDefault();
    $.ajax({
      url: '/song_signup',
      type: 'GET',
      data: {id: $(this).attr('href')},
    })
    .then( function (response) {
      if (response.valid) {
        $('#popupSongSignup').html(response.html);
        $('#popupSongSignup').trigger("create");
        $('#popupSongSignup').popup('open');
      }
      else {
        $('#popup-signin').popup("open");
      }
    });
	});

  $(document).on('submit', 'form#form-song-signup', function(e) {
    e.preventDefault();
    $.ajax({
      url: '/update',
      type: 'POST',
      dataType: 'json',
      data: {"new_performance": {"song_id": $("form#form-song-signup").attr('data')}},
      success: function(response) {
        if (response.valid) {
          $('#popupSongSignup').popup("close");
          $('#search-menu').panel("close");
        }
      },
      error: function(response) { console.log("Song signup error!"); console.log(response); }
    });
  });

});
