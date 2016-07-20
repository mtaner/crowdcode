$(document).ready(function(){
	$('.request-link').on('click', function(event){
		event.preventDefault();

		var requestStatus = $(this).siblings('.request-status')
		console.log(this.href);

		$.post(this.href, function(response){
			requestStatus.text(response.new_status)
		})
	})
})
