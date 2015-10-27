
$(document).ready(function() {
	$(".navbar-small").hide();
	
		
	//var contextPath= '${pageContext.request.contextPath}';
	var contextPath=window.location.pathname;
	
	switch(contextPath){
		case "/web-feedback-system/":$('li#new-job').toggleClass('active');break;
		case "/web-feedback-system/recommendation": $('li#rec-job').toggleClass('active');break;
		case "/web-feedback-system/listresume": $('li#listresume').toggleClass('active');break;
		case "/web-feedback-system/care": $('li#care').toggleClass('active');break;
		case "/web-feedback-system/settings": $('li#setting').toggleClass('active');break;
		case "/web-feedback-system/help": $('li#help').toggleClass('active');break;
		case "/web-feedback-system/help?about": $('li#about').toggleClass('active');break;
		
	}	
	
	if($(window).width()< 975){
			
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
			
	}
	
	
	
		
	
	$(window).resize(function() {
		if($(window).width()<975){
			$(".navbar-large").hide();
			$(".navbar-small").show();
			$(".left-menu").hide();
			
		}
			
		else{
			
			$(".navbar-small").hide();
			$(".navbar-large").show();
			$(".left-menu").show();
			$(".left-menu-collapsed").toggleClass("left-menu-collapsed");
			$(".overlay").toggleClass("overlay");
		}
			
	});
	$('ul.nav li.dropdown').hover(function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeIn(500);
		}, function() {
		  $(this).find('.dropdown-menu').stop(true, true).delay(200).fadeOut(500);
		  
		});
	
    $("#toggle-link-id").click(function(e) {
       
        $("#left-menu-toggle").toggleClass("left-menu-collapsed");
        //$(".main-content").toggleClass("main-disable");
        $("#disablingDiv").toggleClass("overlay");
    });
    
});
