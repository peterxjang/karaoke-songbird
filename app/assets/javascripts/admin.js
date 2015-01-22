$(document).ready(function() {

	$(".admin-sortable").sortable({
		axis:"y", 
		stop: function(event, ui){
			console.log("hi")
		}
	})
})