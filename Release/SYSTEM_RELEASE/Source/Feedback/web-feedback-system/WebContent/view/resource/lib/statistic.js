$(document).ready(
		function(){
			$("#job_list").hide();
			$("#job_list_menu").click(function(){
				$("#user_list").hide();
				$("#job_list").show();
			});
			$("#user_list_menu").click( function(){
				$("#user_list").show();
				$("#job_list").hide();
			});
			var path= window.location.pathname;
			var shortPath=path.substring(path.lastIndexOf("/")+1, path.length);
			if(shortPath=="jobList"){
				$("#user_list").hide();
				$("#job_list").show();
			}
		}
		);
function loadJob(categoryId){
	 $.ajax({
	      type: "POST",
	      url: "statistic",
	      data: {categoryId: categoryId},
	      success: function(result) {
		       var len= result.length;
		       if(len==0){
		    	   $("#no-result").html("Không có công việc nào");
		       }
		       else{
		       $("#no-result").html("");
		       }
	    	   $("#job-table>tbody").html("");
		       $.each(result, function(index, element) {
		    	   $("#job-table>tbody").append(
		    			   "<tr>"+
		    			   "<td>"+index+"</td>"+
		    			   "<td>"+element.jobName+"</td>"+
		    			   "<td>"+element.category+"</td>"+
		    			   "<td>"+element.numberRating+"</td>"+
		    			   "<td>"+element.fiveStarRating+"</td>"+
		    			   "<td><a href='"+window.location.pathname+"?jobId="+element.jobId+"'> Xem chi tiết</a></td>"+
		    			   "</tr>"
		    	   );
		       });
		    },
		    error: function (jqXHR, textStatus, errorThrown) {
	            alert("jqXHR: " + jqXHR.status + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown);
	        }
	   });
}