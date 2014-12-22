$(document).ready(function() {

  $('#link-signup').on('click', function(e) {
    setTimeout( function(){ $('#popup-signup').popup( 'open' ) }, 100 );
  });

  $('#link-signout').on('click', function(e) {
		$.ajax({
	    url: '/logout',
	    type: 'GET',
	    success: function(response) {
	      if (response.valid) {
	      	console.log(response);
	      	$('#main-menu').panel('close');
					$('#link-signout').hide();
					$('#link-signin').show();
	      }
	    },
	    error: function(response) { console.log("logout error!"); console.log(response); }
	  });
  });

	$('form#form-signin').on('submit', function(e) {
		e.preventDefault();
		$.ajax({
	    url: '/login',
	    type: 'POST',
	    dataType: 'json',
	    data: $("form#form-signin").serialize(),
	    success: function(response) {
	      if (response.valid) {
	      	console.log(response);
	      	$('#main-menu').panel('close');
					$('#link-signout').show();
					$('#link-signin').hide();
					$('#popup-signin').popup("close");
	      }
	      else {
	        $('#error-signin').text('Incorrect email or password!');
    			setTimeout( function(){ $('#error-signin').text( '' ) }, 2000 );
	      }
	    },
	    error: function(response) { console.log("login error!"); console.log(response); }
	  });
	});

});