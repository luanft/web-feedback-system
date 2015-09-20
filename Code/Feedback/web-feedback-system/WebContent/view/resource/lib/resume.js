/**
 * 
 */
function validEmail(v) {
    var r = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    return (v.match(r) == null) ? false : true;
}
function validPhone(v){
	var r= new RegExp("[0-9]{9,12}");
	return (v.match(r) == null) ? false : true;
}
function processEmail(emailTab, errorTab){
	var email = emailTab.val();  
	if (!validEmail(email)) {
			
		errorTab.show();  
		emailTab.focus();
		emailTab.parent().parent().toggleClass("has-error", true);		 
	} 
	else{
		errorTab.hide();
		emailTab.parent().parent().toggleClass("has-error",false);
		emailTab.parent().parent().toggleClass("has-success", true);	
	}

}
function processPhone(phoneTab, errorTag){
	var phone=phoneTab.val();
	if(!validPhone(phone)){
		
		errorTag.show();  
		phoneTab.focus();
		phoneTab.parent().parent().toggleClass("has-error", true);
	} 
	
	else{
		errorTag.hide();  
		phoneTab.parent().parent().toggleClass("has-error",false);
		phoneTab.parent().parent().toggleClass("has-success", true);	
	}
}
function removeEduEven(id)
{
	$.ajax({
		type: "POST",
		url: "resume",
		data: {
			eduRemoveId:id,
		}
	});
}
function removeExpEven(id)
{
	$.ajax({
		type: "POST",
		url: "resume",
		data: {
			expRemoveId:id,
		}
	});
}
function removeSkillEven(id)
{
	$.ajax({
		type: "POST",
		url: "resume",
		data: {
			skillRemoveId:id,
		}
	});
}
function removeRefEven(id)
{
	$.ajax({
		type: "POST",
		url: "resume",
		data: {
			RefRemoveId:id,
		}
	});
}


$(document).ready(function() {
		
		$("form").attr("class","collapse");
		$("#male-checkbox").attr("checked", false);
		$("#female-checkbox").attr("checked", false);
		$("#email_error").hide();
		$("#phone_error").hide();
		$("#ref_email_error").hide();
		$("#ref_phone_error").hide();
		//personal
		
		$("#personal-edit-button").click(function() {
			$("#personal-list").hide();
			$("#personal-form").show();
			
		});
		$("#personal-submit,#personal-cancel").click(function() {
			$("#personal-list").show();
			$("#personal-form").hide();
		});
		$("#female-checkbox").click(function(){
			$("#male-checkbox").attr("checked", false);
		})
		$("#male-checkbox").click(function(){
			$("#female-checkbox").attr("checked", false);
		});
		//contact
		$("#contact-edit-button").click(function() {
			$("#contact-list").hide();
			$("#contact-form").show();
		});
		$("#contact-submit, #contact-cancel").click(function() {
			$("#contact-list").show();
			$("#contact-form").hide();
		});
		//education
		$("[name='education-remove-button']").click(function() {
			$(this).parent().parent().hide();
		});
		$("#education-submit, #education-cancel").click(function() {
			$("#education-list").show();
			$("#education-form").hide();
		});
//		$("#education-add-button").click(function() {
//			$("form[id='education-form'] input[type='text']").attr("value","");
//		});
		//experience
//		$("#experience-edit-button").click(function() {
//			$("#experience-form").attr("class", "collapse in");
//			$("#experience-form").attr("style","");
//			$("#experience-list").hide();
//			$("#experience-form").show();
//		});
		
		$("[name='experience-remove-button']").click(function(){
			$(this).parent().parent().hide();
		});
		$("#experience-submit, #experience-cancel").click(function() {
			$("#experience-list").show();
			$("#experience-form").hide();
		});
		$("#experience-add-button").click(function() {
			
			$("form[id='experience-form'] input[type='text']").attr("value","");
		});
		
		//skill
		$("[name='skill-remove-button']").click(function(){
			$(this).parent().parent().parent().parent().hide();
		});
		$("#skill-add-submit, #skill-add-cancel").click(function(){
			$("#skill-edit-form").hide();
			$("#skill-add-form").hide();
			$("#skill-list").show();
		});
		//reference
		$("[name='reference-remove-button']").click(function(){
			$(this).parent().parent().parent().hide();
		});
		$("#reference-submit, #reference-cancel").click(function(){
			$("#referenceform").hide();
			$("#reference-list").show();
		});
		$("#reference-add-button").click(function() {
			$("form[id='reference-form'] input[type='text']").attr("value","");
		});
		//hobbies
		$("#hobbies-edit-button").click(function() {
			$("#hobbies-edit-form").attr({class:"collapse in", style:""});
			$("#hobbies-list").hide();
			$("#hobbies-edit-form").show();
		});
		$("#hobbies-edit-submit, #hobbies-edit-cancel, #hobbies-add-submit, #hobbies-add-cancel").click(function() {
			$("#hobbies-list").show();
			$("#hobbies-edit-form").hide();
			$("#hobbies-add-form").hide();
		});
		//career-object-button
		$("#career-object-edit-button").click(function() {
			$("#career-object-list").hide();
			$("#career-object-form").show();
		});
		$("#career-object-submit, #career-object-cancel").click(function() {
			$("#career-object-list").show();
			$("#career-object-form").hide();
		});
		$("#email_input").focusout(function(){
			
			processEmail($(this),$("#email_error"));
		});
		$("#ref_email_input").focusout(function (){
			processEmail($(this),$("#ref_email_error"));
		});
		
		$("#phone_input").focusout(function(){
			processPhone($(this), $("#phone_error"));
		});	
		$("#ref_phone_input").focusout(function(){
			processPhone($(this), $("#ref_phone_error"));
		
			});
		
		$("#contact-form").submit(function(event){
			var email=$("#email_input");
			if(email.val()==""){
				email.focus();
				$("#contact-form").show()
				$("#email_error").show();
				email.parent().parent().toggleClass("has-error", true);
				event.preventDefault();
			}
			
		});
		$("#experience-form").submit(function(event){
			if($("#edu-major").val()==""){
				alert("Chưa nhập ngành học");
				$("#experience-form").attr({class:"collapse in", style:""});
				$("#edu-major").focus();
				event.preventDefault();
			}
			
		});
		$("#education-form").submit(function(event){
		if($("#exp-job-title").val()==""){
			alert("Chưa nhập tên công việc");
			$("#education-form").attr({class:"collapse in", style:""});
			$("#exp-job-title").focus();
			event.preventDefault();
		}
		});
		$("#reference-form").submit(function(event){
			var email=$("#ref_email_input");
			if(email.val()==""){
				email.focus();
				$("#reference-form").attr({class:"collapse in", style:""});
				$("#ref_email_error").show();
				email.parent().parent().toggleClass("has-error", true);
				event.preventDefault();
			}
		});
		$("#career-object-form").submit(function(event){
			if($("#career-objective-text").val()==""){
				alert("Chưa nhập mục tiêu công việc");
				$("#career-object-form").show();
				$("#career-objective-text").focus();
				event.preventDefault();
			}
				
		});
		
		
	});