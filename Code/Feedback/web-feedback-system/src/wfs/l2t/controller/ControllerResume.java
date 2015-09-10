package wfs.l2t.controller;
import wfs.l2t.dto.*;
import wfs.l2t.model.*;
import wfs.l2t.utility.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/resume")
public class ControllerResume extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private LoginUtility login = new LoginUtility();
	
	public ControllerResume() {
		super();
		// TODO Auto-generated constructor stub
	}
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if(login.isLogged(request, response)){
			ModelResume model= new ModelResume();
			int accountId=Integer.parseInt(login.getLoggedUserId());
			dtoResume resume= model.getResume(accountId);
			dtoEducation edu= model.getEducation();
			dtoExperience exp= model.getExperience();
			List<dtoSkill> skills= model.getSkill();
			List<dtoReference> ref= model.getReference();
			dtoCareerObjective cao= model.getCareerObjective();
			request.setAttribute("general", resume);
			request.setAttribute("education",edu);
			request.setAttribute("experience", exp);
			request.setAttribute("skills", skills);
			request.setAttribute("references", ref);
			request.setAttribute("carObject", cao);
			request.getRequestDispatcher("view/resume-profile.jsp").include(request, response);
		}
		else{
			response.sendRedirect(request.getContextPath()+"/login");
		}
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
}
