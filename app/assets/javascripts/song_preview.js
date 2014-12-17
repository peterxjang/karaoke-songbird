$(document).ready(function() {
	$(document).on('click', '.song-preview', function(e) {
		e.preventDefault();
		var that = this;
		// var audioObject;
		if ($(this).html() === "Preview") {
			$.ajax({
				url: $(this).attr('href'),
				success: function(response) {
					var items = response.tracks.items;
					if (items.length > 0) {
						// console.log(items[0].album.images[2].url);
						audioObject = new Audio(items[0].preview_url);
						audioObject.play();
						$(that).html("Pause");
					}
					else {
						$(that).html("Preview not available");
					}
				}
			});
		}
		else if ($(this).html() === "Pause") {
			audioObject.pause();
			$(that).html("Preview");
		}
	});

	$(document).on("popupafterclose", '.ui-popup', function(event, ui) {
		if (audioObject) {
			audioObject.pause();
			$(this).find('.song-preview').html("Preview");
		}
	});
});