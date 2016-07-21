$(document).on("turbolinks:load", (function(){
	$('.request-link').on('click', function(event){
		event.preventDefault();

		var requestStatus = $(this).siblings('.request-status')

		$.post(this.href, function(response){
			requestStatus.text(response.new_status)
		});
	});
}));
