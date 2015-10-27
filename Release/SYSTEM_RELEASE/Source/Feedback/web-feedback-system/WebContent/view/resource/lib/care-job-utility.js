/**
 * 
 */

/**
 * show loading icon when loading data
 */
$(document).ajaxStart(function() {
	$("#loading").show();
});

/**
 * hide loading icon when data load completely
 */
$(document).ajaxStop(function() {
	$("#loading").hide();
});

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
			url : "ControllerCareJob",
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
			url : "ControllerCareJob",
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
		url : "ControllerCareJob",
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
			url : "ControllerCareJob",
			data : {
				xxx : "ready"
			},
			success : function(data) {
				$("#content-wrapper").append(data);
			}
		});
	}
});

/**
 * load jobs when scroll to bottom
 */
var count = 0;
$contentLoadTriggered = false;
$(document).ready(function ()
		{
			$(window).scroll(function ()
			{
				if (count < 5)
				{
					count += 1;
					if ($("#done").text().trim() !== "Hết việc đã lưu rồi!")
					{
						if ($(window).scrollTop() + $(window).height() == $(document).height() && $contentLoadTriggered == false)
						{
							$contentLoadTriggered = true;
							$.ajax(
							{
								type : "POST",
								url : "ControllerCareJob",
								data :
								{
									scrollEvent : "scroll"
								},
								success : function (data)
								{
									if (data === "")
									{
										location.href = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
									}
									else
										$("#content-wrapper").append(data);
									$contentLoadTriggered = false;
								}
							}
							);
						}
					}
				}
				else
				{
					count = 0;
					if ($("#done").text().trim() !== "Hết việc đã lưu rồi!")
					{
						if ($(window).scrollTop() + $(window).height() == $(document).height() && $contentLoadTriggered == false)
						{
							$contentLoadTriggered = true;
							$.ajax(
							{
								type : "POST",
								url : "ControllerCareJob",
								data :
								{
									scrollEvent : "scroll"
								},
								success : function (data)
								{
									if (data === "")
									{
										location.href = window.location.pathname.substring(0, window.location.pathname.indexOf("/", 2));
									}
									else
										$("#content-wrapper").html(data);
									$contentLoadTriggered = false;
								}
							}
							);
						}
					}
				}
			}
			);
		}
		);

/**
 * get job by scroll event on mobile
 */
$('body').on('touchmove',function() {
			if ($("#done").text().trim() !== "Hết việc mới rồi. Hehe!") {
				if ($(window).scrollTop() + $(window).height() >= $(document)
						.height() - 100) {
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
			}
		});

/**
 * function go to top
 */
$(document).ready(function() {
	var offset = 250, // At what pixels show Back to Top Button
	scrollDuration = 300; // Duration of scrolling to top
	$(window).scroll(function() {
		if ($(this).scrollTop() > offset) {
			$('.go-to-top').fadeIn(500);
		} else {
			$('.go-to-top').fadeOut(500);
		}
	});

	// Smooth animation when scrolling
	$('.go-to-top').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop : 0
		}, scrollDuration);
	})
});