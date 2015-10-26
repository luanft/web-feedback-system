
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
		case "/web-feedback-system/help": $('li#help').toggleClass('active');break;
		case "/web-feedback-system/help?about": $('li#about').toggleClass('active');break;
		
	}
	
	var w = window.innerWidth;
	var h = window.innerHeight;
	
	
	
	if($(window).width()< 800){
			
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
			
	}
	
	
	
		
	
	$(window).resize(function() {
		if($(window).width()< 800){
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
		}
			
		else{
			
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