/**
 * 
 */

function myCollapse(xxx) {
	$("#full-info" + xxx).slideToggle("slow");
	if ($("#short-description" + xxx).is(":visible"))
		$("#short-description" + xxx).hide();
	else
		$("#short-description" + xxx).show();
}

function likeClick(obj, xxx) {
	if (($(obj).attr("value")) === "0") {
		$.ajax({
			type : "POST",
			url : "ControllerHome",
			data : {
				status : "1",
				index : xxx
			}
		});
		$(obj).css("color", "yellow");
		$(obj).attr("value", "1");
	} else {
		$.ajax({
			type : "POST",
			url : "ControllerHome",
			data : {
				status : "0",
				index : xxx
			}
		});
		$(obj).css("color", "#CCCCFF");
		$(obj).attr("value", "0");
	}
}

function dislikeClick(xxx) {
	$("#panel" + xxx).hide();
	$.ajax({
		type : "POST",
		url : "ControllerHome",
		data : {
			status : "0",
			index : xxx
		}
	});
}

// load job when ready
$(document).ready(function() {

	{
		$.ajax({
			type : "POST",
			url : "ControllerHome",
			data : {
				xxx : "ready"
			},
			success : function(data) {
				$("#content-wrapper").append(data);
			}
		});
	}
});

// load job when user scroll down of page
$(document).ready(
		function() {
			$contentLoadTriggered = false;
			$(window).scroll(
					function() {
						if($("#done").text().trim() !== "Hết việc mới rồi. Hehe!")
						if ($(window).scrollTop() + $(window).height() == $(
								document).height()
								&& $contentLoadTriggered == false) {
							$contentLoadTriggered = true;
							$.ajax({
								type : "POST",
								url : "ControllerHome",
								data : {
									xxx : "scroll"
								},
								success : function(data) {
									$("#content-wrapper").append(data);
									$contentLoadTriggered = false;
								}
							});
						}

					});
		});
