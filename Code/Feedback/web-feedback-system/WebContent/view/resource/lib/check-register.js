/**
 * 
 */

//check email
$(document).ready(function(){
	$('#reg-email').blur(function(event){
		$.ajax({
			url:'ControllerCheckRegister',
			data:{
				email : $('#reg-email').val()
			},
			success: function(responseText){
				$('#txtHintEmail').text(responseText);
			}
		});
	});
});

//check null
$(document).ready(function(){
	$("#reg-form").keyup(function(event){
		if($('#reg-email').val() != "" && $('#reg-user').val() != "" && $('#reg-pwd').val() != "" && $('#reg-rpwd').val() != "" && $("#txtHintEmail").text() == "" && $("#txtHintrpwd").text() == "")
		{
			$("#reg-button").prop('disabled', false);			
		}
		else
			$("#reg-button").prop('disabled', true);
	});
});

//check match password
$(document).ready(function(){
	$('#reg-rpwd').keyup(function(event){
		$.ajax({
			url:'ControllerCheckRegister',
			data:{
				pass : $('#reg-pwd').val(),
				rpass: $('#reg-rpwd').val()
			},
			success: function(responseText){
				$('#txtHintrpwd').text(responseText);
			}
		});
	});
});