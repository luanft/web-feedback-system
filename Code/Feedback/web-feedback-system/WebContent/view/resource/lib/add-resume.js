function validEmail(v) {
    var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    return (v.match(r) == null) ? false : true;
}
function validPhone(v){
	var r= new RegExp("[0-9]{9,12}");
	return (v.match(r) == null) ? false : true;
}
function removeResume(id){
	
	$.ajax({
		type: "POST",
		url: "listresume",
		data:{
			resumeId:id
		}
	});
}

$(document).ready(function(){
	$("#add-resume-form").hide();
	$("#email2_error").hide();
	$("#phone_error").hide();  
	$("#title_error").hide();
	$("#name_error").hide();
	$("#email_error").hide();
	$("#add-resume-link").show();
	$("#birthday_error").hide();
	$("#add-resume-link").click( function(){
		$("#add-resume-form").show();
		$(this).hide();
	});
	$("#cancel-add-resume-button").click(function(){
		$("#add-resume-form").hide();
	});
	$("a[name='remove']").click(function(){
		$(this).parent().hide();
	});
	
	$("input#email").focusout(function(){
		var email = $("input#email").val();  
		if (!validEmail(email)) {
				
			$("p#email2_error").show();  
			$("input#email").focus();
			$(this).parent().parent().toggleClass("has-error", true);		 
		} 
		else{
			$("p#email2_error").hide();
			$(this).parent().parent().toggleClass("has-error",false);
			$(this).parent().parent().toggleClass("has-success", true);	
		}
	
	});
	$("#title-input").focusout(function(){
		if($(this).val()!=""){
			$("#title-error").hide();
			$(this).parent().parent().toggleClass("has-error",false);
			$(this).parent().parent().toggleClass("has-success", true);
			
		}
	});	
	$("#name-input").focusout(function(){
		if($(this).val()!=""){
			$("#name-error").hide();
			$(this).parent().parent().toggleClass("has-error",false);
			$(this).parent().parent().toggleClass("has-success", true);
			
		}
	});	
	
	$("#phone_input").focusout(function(){
		var phone=$(this).val();
		if(!validPhone(phone)){
			
			$("#phone_error").show();  
			$(this).focus();
			$(this).parent().parent().toggleClass("has-error", true);
		} 
		
		else{
			$("#phone_error").hide();  
			$(this).parent().parent().toggleClass("has-error",false);
			$(this).parent().parent().toggleClass("has-success", true);	
		}
	});	
	$("#add-resume-form").submit(function(event){
		
		var title= $("#title-input");
		if(title.val()==""){
			title.focus();
			$("#title_error").show();
			title.parent().parent().toggleClass("has-error", true);
			event.preventDefault();
		}
		var email=$("#email");
		if(email.val()==""){
			email.focus();
			$("#email_error").show();
			email.parent().parent().toggleClass("has-error", true);
			event.preventDefault();
		}
		var name=$("#name");
		if(name.val()==""){
			name.focus();
			$("#name_error").show();
			name.parent().parent().toggleClass("has-error", true);
			event.preventDefault();
		}
		if($("#day")=="..."||$("#month")=="..."||$("#year")=="..."){
			$("#birthday_error").show();
			event.preventDefault()
		}
		
	}
	);
});
