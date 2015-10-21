/**
 * 
 */

$(document).ready(function() {
	$(".dropdown-menu").on('click', 'li a', function() {
		$(".btn:first-child").text($(this).text());
		$(".btn:first-child").val($(this).text());
	});
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
													$("#loading").show();
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
											} else
												$("#loading").hide();
										} else {
											count = 0;
											if ($("#done").text().trim() !== "Hết việc mới rồi. Hehe!") {
												if ($(window).scrollTop()
														+ $(window).height() == $(
														document).height()
														&& $contentLoadTriggered == false) {
													$contentLoadTriggered = true;
													$("#loading").show();
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
											} else
												$("#loading").hide();
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