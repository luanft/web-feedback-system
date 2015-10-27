


$(document).ready(function() {
	$(".navbar-small").hide();
	var url      = window.location.href;
	var sortLink=url.substring(url.lastIndexOf("/")+1,url.length);
	switch(sortLink){
		case "":$('li#new-job').toggleClass('active');break;
		case "recommendation": $('li#rec-job').toggleClass('active');break;
		case "listresume": $('li#listresume').toggleClass('active');break;
		case "care": $('li#care').toggleClass('active');break;
		case "settings": $('li#setting').toggleClass('active');break;
		case "help": $('li#help').toggleClass('active');break;
		case "help?about": $('li#about').toggleClass('active');
	}	
		
	if($(window).width()< 975 ){
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
        $("#disablingDiv").toggleClass("overlay");
    });
    $("#disablingDiv").click(function(){
    	$("#left-menu-toggle").toggleClass("left-menu-collapsed");
        $("#disablingDiv").toggleClass("overlay");
    });
});
