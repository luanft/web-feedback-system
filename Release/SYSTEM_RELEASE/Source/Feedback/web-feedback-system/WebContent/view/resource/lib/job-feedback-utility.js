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
			url : "ControllerJobRecommended",
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
			url : "ControllerJobRecommended",
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
		url : "ControllerJobRecommended",
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