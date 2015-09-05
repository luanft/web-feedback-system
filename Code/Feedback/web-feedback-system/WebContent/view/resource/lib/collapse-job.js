/**
 * 
 */
$(document).ready(function() {

	$("#see-more").click(function() {
		$("#full-info").slideToggle("slow");
		if($("#short-description").is(":visible"))
			$("#short-description").hide();
		else
			$("#short-description").show();
	});
});
