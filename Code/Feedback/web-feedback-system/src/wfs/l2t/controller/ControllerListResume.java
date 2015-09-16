package wfs.l2t.controller;

import java.io.IOException;
import java.util.HashMap;












import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.dto.dtoResume;
import wfs.l2t.model.ModelResume;
import wfs.l2t.utility.LoginUtility;

/**
 * Servlet implementation class ControllerListResume
 */
@WebServlet("/ListResume")
public class ControllerListResume extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginUtility login = new LoginUtility();
	ModelResume model= new ModelResume();
	int accountId;
	/**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerListResume() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if(login.isLogged(request, response)){
			accountId=Integer.parseInt(login.getLoggedUserId());
			HashMap<Integer,String> li=model.getResumeTitle(accountId);
			request.setAttribute("listTitle", li);
			
			request.setAttribute("listCount", li.size());
			request.setAttribute("schools", model.getSchool());
			int firstResumeId=0;
			for(int i :li.keySet()){
				firstResumeId=i;
					break;
			}
			dtoResume resume = model.getResume(firstResumeId);
			request.setAttribute("resume", resume);
			request.getRequestDispatcher("view/list-resume.jsp").include(request, response);
		}
		else
		{
			response.sendRedirect(request.getContextPath()+"/login");
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String addResume= request.getParameter("add-resume-button");
		if(addResume!=null){
			
			
			String title=request.getParameter("title-input");
			//personal
			String name=request.getParameter("full-name-input");
			String birthday=request.getParameter("birthday-input");
			String gender=request.getParameter("gender-input");
			boolean maritalStatus=Boolean.parseBoolean(request.getParameter("status_select"));
			String nationality=request.getParameter("nationality_input");
			//contact
			String address= request.getParameter("address-input");
			String email= request.getParameter("email-input");
			String phone=request.getParameter("phone-input");
			//hobbies
			String hobbies=request.getParameter("hobbies-input");
			int resumeId=model.getNextResumeId(accountId);
			model.AddResume(resumeId, accountId, title, name, birthday, gender, maritalStatus, nationality,"", address, email, phone, hobbies);
			response.sendRedirect(request.getContextPath()+"/resume?id="+resumeId);
			
			
		}
	}

}
