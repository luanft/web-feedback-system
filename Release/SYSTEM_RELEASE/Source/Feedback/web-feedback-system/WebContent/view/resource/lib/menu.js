
$(document).ready(function() {
	$(".navbar-small").hide();
	$(".left-menu-toggle").hide();
	var w = window.innerWidth;
	var h = window.innerHeight;
	var jPM= $.jPanelMenu({
		menu: "#left-menu-toggle",
		trigger: "#toggle-link-id",
	});
	jPM.on();
	var max_width= window.screen.availWidth - (window.outerWidth - window.innerWidth)
	if($(window).width()< max_width-10){
			alert("thu nho!!!")
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
	
	
});