
/**
 * show loading icon when loading data
 */
$(document).ajaxStart(function ()
{
	$("#loading").show();
}
);

/**
 * hide loading icon when data load completely
 */
$(document).ajaxStop(function ()
{
	$("#loading").hide();
}
);

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
			url : "ControllerJobRecommended",
			data : {
				status : "1",
				index : xxx
			}
		});
		$(obj).css("color", "#5890ff");
		$(obj).attr("value", "1");
	} else {
		$.ajax({
			type : "POST",
			url : "ControllerJobRecommended",
			data : {
				status : "0",
				index : xxx
			}
		});
		$(obj).css("color", "#9197a3");
		$(obj).attr("value", "0");
	}
}

function dislikeClick(xxx) {
	$("#panel" + xxx).hide();
	$.ajax({
		type : "POST",
		url : "ControllerJobRecommended",
		data : {
			status : "-1",
			index : xxx
		}
	});
}

// load job when ready
$(document).ready(function() {
	{
		$.ajax({
			type : "POST",
			url : "ControllerJobRecommended",
			data : {
				xxx : "ready"
			},
			success : function(data) {
				$("#content-wrapper").append(data);
			}
		});
	}
});

//$(window).load(function(){alert("rea");
//	$.ajax({
//		type : "GET",
//		url : "ControllerJobRecommend",
//		data : {
//			xxx : $("#from").val()
//		}
//	});
//});

/**
 * function go to top
 */
$(document).ready(function ()
{
	var offset = 250, // At what pixels show Back to Top Button
	scrollDuration = 300; // Duration of scrolling to top
	$(window).scroll(function ()
	{
		if ($(this).scrollTop() > offset)
		{
			$('.go-to-top').fadeIn(500);
		}
		else
		{
			$('.go-to-top').fadeOut(500);
		}
	}
	);

	// Smooth animation when scrolling
	$('.go-to-top').click(function (event)
	{
		event.preventDefault();
		$('html, body').animate(
		{
			scrollTop : 0
		}, scrollDuration);
	}
	)
}
);