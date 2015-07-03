
$(document).ready(function () {
	$testimonial = $('.testimonial p')
	var cur,
		i=1,
	items = [
	"\"Thank you so much for all of the help you have given our son as he embarks on this college search. It has been invaluable\". -AnchorPrep Parent",
	"My son was accepted to a top tier university and AnchorPrep deserves a ton of credit for helping to make his dream a reality.\" -AnchorPrep Parent",
	"\"Without AnchorPrep I wouldn't have been admitted to such amazing universities.\" -AnchorPrep Student",
	"\" Your patience, wisdom, guidance and humor were much appreciated through the journey.\" -AnchorPrep Parent"]
	setInterval(function(){ 
		i+=1;
		if (i == 4) {
			i = 0;
		}
		cur = items[i]
		$testimonial.fadeOut(1000, function() {
		$(this).text(cur).fadeIn(1000, function(){})});
	}, 5000);

});