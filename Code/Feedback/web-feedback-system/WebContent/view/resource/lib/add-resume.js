$(document).ready(function(){
	$("#add-resume-div").hide();
	$("#add-resume-link").click( function(){
		$("#add-resume-div").show();
	});
	$("#cancel-add-resume-button").click(function(){
		$("#add-resume-div").hide();
	});
});