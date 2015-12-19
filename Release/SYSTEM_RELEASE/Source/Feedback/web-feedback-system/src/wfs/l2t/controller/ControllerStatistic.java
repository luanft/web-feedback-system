package wfs.l2t.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import wfs.l2t.model.ModelCategory;
import wfs.l2t.model.ModelStatistic;

/**
 * Servlet implementation class ControllerStatistic
 */
@WebServlet("/ControllerStatistic")
public class ControllerStatistic extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ModelStatistic ms= new ModelStatistic();
    ModelCategory mc=new ModelCategory();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerStatistic() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setCharacterEncoding("UTF-8");	
		
		//PrintWriter out = response.getWriter();
		//out.print("<h1>Go to Statistic</h1>");
		String userId= request.getParameter("userId");
		String jobId=request.getParameter("jobId");
		//int  userIdAccess=Integer.parseInt(request.getParameter("userIdAccess"));
			//if(userIdAccess==1 || userIdAccess == 23 || userIdAccess == 24 || userIdAccess==26 || userIdAccess==27){
			if(userId!=null)
			{
				int accId= Integer.parseInt(userId);
				String userName= request.getParameter("userName");
				request.setAttribute("userDetail",ms.getUser(accId, userName) );
				request.getRequestDispatcher("view/statistic-job-list.jsp").include(request, response);
			}
			else if(jobId!=null){
				String jobName= request.getParameter("jobName");
				request.setAttribute("job", ms.getJobDetail(jobId,jobName));
				request.getRequestDispatcher("view/statistic-job-detail.jsp").include(request, response);
			}
			else{
				
					// dữ liệu cho danh sách người dùng
					request.setAttribute("accountList", ms.getAllAccount());
					request.setAttribute("numberUser", ms.getNumberUser());
					request.setAttribute("numberJobRated", ms.getJobhasRated());
					request.setAttribute("numberJobSent", ms.getJobhasSent());
					// Dữ liệu cho danh sách công việc
					request.setAttribute("categoryList",mc.getAllCategory());
					request.setAttribute("jobList", ms.getAllRecJob());
					
					request.getRequestDispatcher("view/statistic.jsp").include(request, response);
				
			
			}
		//}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String categoryId= request.getParameter("categoryId");
		
		response.setCharacterEncoding("UTF-8");	
		response.setContentType("application/json");
		String json = null ;
		Gson gson= new Gson();
		if(Integer.parseInt(categoryId)!=0){
		json= gson.toJson(ms.getRecJobCategory(Integer.parseInt(categoryId)));
		//json= gson.toJson(ms.getAllRecJob());
		}
		else {
			json= gson.toJson(ms.getAllRecJob());
		}
		//System.out.println(ms.getRecJobCategory(Integer.parseInt(categoryId)).size());
		response.getWriter().write(json);
	}

}
