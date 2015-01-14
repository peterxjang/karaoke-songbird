$(document).ready(function() {

  $('#link-signup').on('click', function(e) {
    setTimeout( function(){ $('#popup-signup').popup('open') }, 100 );
  });

  $('#link-signout').on('click', function(e) {
		$.ajax({
	    url: '/logout',
	    type: 'GET',
	    success: function(response) {
	      if (response.valid) {
	      	toggleLoginLogout();
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
	      	toggleLoginLogout();
					$('#popup-signin').popup("close");
	      }
	      else {
	        $('#error-signin').text('Incorrect email or password!');
    			setTimeout( function(){ $('#error-signin').text('') }, 2000 );
	      }
	    },
	    error: function(response) { console.log("login error!"); console.log(response); }
	  });
	});

	$('form#form-signup').on('submit', function(e) {
		e.preventDefault();
		$.ajax({
	    url: '/users',
	    type: 'POST',
	    dataType: 'json',
	    data: $("form#form-signup").serialize(),
	    success: function(response) {
	      if (response.valid) {
	      	toggleLoginLogout();
					$('#popup-signup').popup("close");
	      }
	      else {
	        $('#error-signup').text('Invalid entries!');
    			setTimeout( function(){ $('#error-signup').text('') }, 2000 );
	      }
	    },
	    error: function(response) { console.log("create user error!"); console.log(response); }
	  });
	});

});

function toggleLoginLogout() {
	$('#main-menu').panel('close');
	$('#link-signout').toggle();
	$('#link-signin').toggle();
}