$(document).ready(function() {

	$(document).on('click', '#header-menu', function(e) {
		e.preventDefault();
		console.log('menu');
	});

	$(document).on('click', '#header-search', function(e) {
		e.preventDefault();
		console.log('search');
	});

});