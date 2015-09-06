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

//check password
$(document).ready(function(){
	$('#reg-pwd').blur(function(event){
		$.ajax({
			url:'ControllerCheckRegister',
			data:{
				pass : $('#reg-pwd').val()				
			},
			success: function(responseText){
				$('#txtHintpwd').text(responseText);
			}
		});
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

//check user name
$(document).ready(function(){
	$('#reg-user').blur(function(event){
		$.ajax({
			url:'ControllerCheckRegister',
			data:{
				userName : $('#reg-user').val()
			},
			success: function(responseText){
				$('#txtHintUserName').text(responseText);
			}
		});
	});
});