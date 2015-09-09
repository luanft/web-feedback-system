/**
 * 
 */

function myCollapse(xxx){	
	$("#full-info" + xxx).slideToggle("slow");
	if($("#short-description" + xxx).is(":visible"))
		$("#short-description" + xxx).hide();
	else
		$("#short-description" + xxx).show();
}