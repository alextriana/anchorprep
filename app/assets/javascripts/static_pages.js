
$(document).ready(function () {
	$testimonial = $('.testimonial p')
	items = ["This would be another testimonial", "And another!"]
	setInterval(function(){ 
		var cur = items[Math.floor(Math.random()*items.length)]
		$testimonial.fadeOut(1000, function() {
		$(this).text(cur).fadeIn(1000, function(){})});
	}, 3000).fadeIn();

});