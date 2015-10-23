/**
 * 
 */

$(document).ready(function() {
	$(".dropdown-menu").on('click', 'li a', function() {
		$(".btn:first-child").text($(this).text());
		$(".btn:first-child").val($(this).text());
	});
});

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

/**
 * show or hide job detail
 * 
 * @param jobId
 */
function myCollapse(xxx) {
	$("#full-info" + xxx).slideToggle("slow");
	if ($("#short-description" + xxx).is(":visible"))
		$("#short-description" + xxx).hide();
	else
		$("#short-description" + xxx).show();
}

/**
 * process when user click like button
 * 
 * @param obj
 * @param xxx
 */
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
		$(obj).css("color", "#5890ff");
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
		$(obj).css("color", "#9197a3");
		$(obj).attr("value", "0");
	}
}
//
// function dislikeClick(xxx) {
// $("#panel" + xxx).hide();
// $.ajax({
// type : "POST",
// url : "ControllerHome",
// data : {
// status : "0",
// index : xxx
// }
// });
// }

/**
 * load jobs when document ready
 */
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

/**
 * load jobs when scroll to bottom
 */
var count = 0;
$contentLoadTriggered = false;
$(document)
		.ready(
				function() {

					$(window)
							.scroll(
									function() {
										if (count < 5) {
											count += 1;
											if ($("#done").text().trim() !== "Hết việc mới rồi. Hehe!") {
												if ($(window).scrollTop()
														+ $(window).height() == $(
														document).height()
														&& $contentLoadTriggered == false) {
													$contentLoadTriggered = true;
													$
															.ajax({
																type : "POST",
																url : "ControllerHome",
																data : {
																	xxx : "scroll"
																},
																success : function(
																		data) {
																	$(
																			"#content-wrapper")
																			.append(
																					data);
																	$contentLoadTriggered = false;
																}
															});
												}
											}
										} else {
											count = 0;
											if ($("#done").text().trim() !== "Hết việc mới rồi. Hehe!") {
												if ($(window).scrollTop()
														+ $(window).height() == $(
														document).height()
														&& $contentLoadTriggered == false) {
													$contentLoadTriggered = true;
													$
															.ajax({
																type : "POST",
																url : "ControllerHome",
																data : {
																	xxx : "scroll"
																},
																success : function(
																		data) {
																	$(
																			"#content-wrapper")
																			.html(
																					data);
																	$contentLoadTriggered = false;
																}
															});
												}
											}
										}
									});
				});

function loadMoreJob() {
	$(".loadMore").hide();
	if ($("#done").text().trim() !== "Hết việc mới rồi. Hehe!") {
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

	} else
		$("#loading").hide();
}

/**
 * function go to top
 */
$(document).ready(function() {
	var offset = 250, // At what pixels show Back to Top Button
	scrollDuration = 300; // Duration of scrolling to top
	$(window).scroll(function() {
		if ($(this).scrollTop() > offset) {
			$('.top').fadeIn(500); // Time(in Milliseconds) of appearing of the
									// Button when scrolling down.
		} else {
			$('.top').fadeOut(500); // Time(in Milliseconds) of disappearing of
									// Button when scrolling up.
		}
	});

	// Smooth animation when scrolling
	$('.top').click(function(event) {
		event.preventDefault();
		$('html, body').animate({
			scrollTop : 0
		}, scrollDuration);
	})
});
