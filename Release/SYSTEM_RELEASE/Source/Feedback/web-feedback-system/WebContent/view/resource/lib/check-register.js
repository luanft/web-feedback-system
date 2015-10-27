/**
 * 
 */

// check email

$(document).ready(function() {
	$('#reg-email').on('blur keyup', function(event) {
		$.ajax({
			url : 'ControllerCheckRegister',
			data : {
				email : $('#reg-email').val()
			},
			success : function(responseText) {
				$('#txtHintEmail').text(responseText);
			}
		});
	});
});

// check null field
$(document).ready(
		function() {
			$("#reg-form").on(
					'blur keyup',
					function(event) {
						if ($('#reg-email').val() == ""
								|| $('#reg-user').val() == ""
								|| $('#reg-pwd').val() == ""
								|| $('#reg-rpwd').val() == ""
								|| $("#txtHintEmail").text() != ""
								|| $("#txtHintrpwd").text() != "") 
									{
							$("#reg-button").prop('disabled', true);
						} else
							$("#reg-button").prop('disabled', false);
					});
		});

// check match password
$(document).ready(function() {
	$('#reg-pass').on('keyup blur', function(event) {
		if ($("#reg-pwd").val() != $("#reg-rpwd").val()) {
			$("#txtHintrpwd").text("Mật khẩu không trùng khớp");
		} else {
			$("#txtHintrpwd").text("");
		}
	});
	$('#reg-rpass').on('keyup blur', function(event) {
		if ($("#reg-pwd").val() != $("#reg-rpwd").val()) {
			$("#txtHintrpwd").text("Mật khẩu không trùng khớp");
		} else {
			$("#txtHintrpwd").text("");
		}
	});
});