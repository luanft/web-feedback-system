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
		    			   "<td>"+element.jobName+"</td>"+
		    			   "<td>"+element.category+"</td>"+
		    			   "<td>"+element.numberRating+"</td>"+
		    			   "<td>"+element.fiveStarRating+"</td>"+
		    			   "<td><a href='${pageContext.request.contextPath}/statistic?jobId='"+element.jobId+"'> Xem chi tiết</a></td>"+
		    			   "</tr>"
		    	   );
		       });
		    },
		    error: function (jqXHR, textStatus, errorThrown) {
	            alert("jqXHR: " + jqXHR.status + "\ntextStatus: " + textStatus + "\nerrorThrown: " + errorThrown);
	        }
	   });
}