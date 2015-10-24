
$(document).ready(function() {
	$(".navbar-small").hide();
	$(".left-menu-toggle").hide();
	
		
	//var contextPath= '${pageContext.request.contextPath}';
	var contextPath=window.location.pathname;
	
	switch(contextPath){
		case "/web-feedback-system/":$('li#new-job').toggleClass('active');break;
		case "/web-feedback-system/recommendation": $('li#rec-job').toggleClass('active');break;
		case "/web-feedback-system/listresume": $('li#listresume').toggleClass('active');break;
		case "/web-feedback-system/care": $('li#care').toggleClass('active');break;
		case "/web-feedback-system/settings": $('li#setting').toggleClass('active');break
		case "/web-feedback-system/help": $('li#help').toggleClass('active');break
		case "/web-feedback-system/help?about": $('li#about').toggleClass('active');break;
		default: $('li#listresume').toggleClass('active');
		
	}
	
	var w = window.innerWidth;
	var h = window.innerHeight;
	var jPM= $.jPanelMenu({
		excludedPanelContent:'style, script body',
		menu: "#left-menu-toggle",
		trigger: "#toggle-link-id",
	});
	jPM.on();
	
	var max_width= window.screen.availWidth - (window.outerWidth - window.innerWidth)
	if($(window).width()< max_width-10){
			
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
	}

		
	
	$(window).resize(function() {
		if($(window).width()< max_width-10){
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
		}
			
		else{
			//$(".left-menu-toggle").hide();
			$(".navbar-small").hide();
			$(".navbar-large").show();
			$(".left-menu").show();
		
		}
			
	});
	$('ul.nav li.dropdown').hover(function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		  
		});
	
});