package wfs.l2t.controller;
import wfs.l2t.dto.*;
import wfs.l2t.model.*;
import wfs.l2t.utility.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Resume")
public class ControllerResume extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private LoginUtility login = new LoginUtility();
	dtoResume resume= new dtoResume();
	ModelResume model= new ModelResume();
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
//			int accountId=Integer.parseInt(login.getLoggedUserId());
			String resumeId=request.getParameter("id");
			if(resumeId!=null){
				resume= model.getResume(Integer.parseInt(resumeId));
				if(resume.getResumeId()>0){
					LoadPage(request);
					request.getRequestDispatcher("view/resume-profile.jsp").include(request, response);
				}
			}
			else
				response.sendRedirect(request.getContextPath()+"/listresume");
		}
		else{
			response.sendRedirect(request.getContextPath()+"/login");
	}
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String updateResume= request.getParameter("personal-submit");
		String updateContact= request.getParameter("contact-submit");
		String removeEducation=request.getParameter("eduRemoveId");
		String removeExperience= request.getParameter("expRemoveId");
		String removeSkill= request.getParameter("skillRemoveId");
		String addEducation= request.getParameter("education-submit-button");
		String addExperience= request.getParameter("exp-submit");
		String addSkill=request.getParameter("skill-submit");
		String addReference=request.getParameter("ref-submit");
		String removeReference= request.getParameter("RefRemoveId");
		String updateCareerObject= request.getParameter("cao-submit");
		String editHobbies= request.getParameter("hobbies-button");
	
		//if(login.isLogged(request, response)){
		if(updateResume!=null){
			//System.out.print("dzo lan 1");
			String gender=request.getParameter("gender_input");
			boolean maritalStatus=Boolean.parseBoolean(request.getParameter("status_select"));
			String nationality=request.getParameter("nationality_input");
			model.UpdatePersonal(gender, maritalStatus, nationality );
		}
		if(updateContact!=null){
			String address= request.getParameter("address-input");
			String email= request.getParameter("email-input");
			String phone=request.getParameter("phone-input");
			model.UpdateContact(address, email, phone);
		}
		if(removeEducation!=null){
			model.RemoveEducation(Integer.parseInt(removeEducation));
		}
		if(removeExperience!=null){
			model.RemoveExperience(Integer.parseInt(removeExperience));
		}
		if(removeSkill!=null){
			model.RemoveSkill(Integer.parseInt(removeSkill));
		}
		if(removeReference!=null){
			model.RemoveReference(Integer.parseInt(removeReference));
		}
		if(addEducation!=null){
			String startDate= request.getParameter("edu-start-date");
			String endDate = request.getParameter("edu-end-date");
			String educationDescription=request.getParameter("edu-description");
			
			String schoolID_str=request.getParameter("edu-school");
			String educationLevel= request.getParameter("edu-level");
			String educationMajor= request.getParameter("edu-major");
			String educationLocation= request.getParameter("edu-location");
			int schoolID;
			if(request.getParameter("edu-another-school")==null){
				//can than cai select
				schoolID= Integer.parseInt(schoolID_str);
			}
			else{
				int result=model.AddSchool(request.getParameter("edu-another-school"));
				if(result==-1)
					schoolID=Integer.parseInt(schoolID_str);
				else
					schoolID= result;
			}
			
			model.AddEducation(startDate, endDate, educationDescription, resume.getResumeId(), schoolID, educationLevel, educationMajor, educationLocation);
		}
		if(addExperience!=null){
			 String Company_name=request.getParameter("exp-company");
			 String JobTitle= request.getParameter("exp-job-title");
			 String Position= request.getParameter("exp-position");
			 String Period=request.getParameter("exp-period");
			 String Description= request.getParameter("exp-description");
			model.AddExperience(resume.getResumeId(), Company_name, JobTitle, Position, Description, Period);
		}
		if(addSkill!=null){
			String skillName= request.getParameter("skill-name");
			String skillLevel= request.getParameter("skill-level");
			model.addSkill(skillName, skillLevel, resume.getResumeId());
		}
		if(addReference!=null){
			String refName= request.getParameter("ref-name");
			String refJob=request.getParameter("ref-job");
			String refPhone= request.getParameter("ref-phone");
			String refEmail= request.getParameter("ref-email");
			model.AddReference(refName, refJob, refPhone, refEmail, resume.getResumeId());
		}
		if(updateCareerObject!=null){
			int DesireSalary= Integer.parseInt(request.getParameter("desire-salary"));
			int RecentSalary= Integer.parseInt(request.getParameter("recent-salary"));
			String PositionType= request.getParameter("position-type");
			String DesireCareerLevel= request.getParameter("desire-career-level");
			String DesireWorkLocation= request.getParameter("desire-work-location");
			Boolean WillingToRelocate= request.getParameter("willing-to-relocation")==null?false:true;
			Boolean WillingToTravel= request.getParameter("willing-to-travel")==null?false:true;
			String CareerObjective= request.getParameter("career-objective");
			model.UpdateCareerObject(DesireSalary, RecentSalary, PositionType, DesireCareerLevel, DesireWorkLocation, WillingToRelocate, WillingToTravel, CareerObjective, resume.getResumeId());
		}
		if(editHobbies!=null){
			String hobbies=request.getParameter("hobbies");
			model.UpdateHobbies(hobbies, resume.getResumeId());
			
		}
		LoadPage(request);
		request.getRequestDispatcher("view/resume-profile.jsp").include(request, response);
	}
//	}
//	else{
//		response.sendRedirect(request.getContextPath()+"/login");
//	}
	public void LoadPage(HttpServletRequest request){
		
		List<dtoEducation> edu= model.getEducation();
		List<dtoSchool> sch= model.getSchool();
		List<dtoExperience> exp= model.getExperience();
		List<dtoSkill> skills= model.getSkill();
		List<dtoReference> ref= model.getReference();
		dtoCareerObjective cao= model.getCareerObjective();
		
		request.setAttribute("resume", resume);
		request.setAttribute("education",edu);
		request.setAttribute("schools", sch);
		request.setAttribute("experience", exp);
		request.setAttribute("skills", skills);
		request.setAttribute("references", ref);
		request.setAttribute("carObject", cao);
		
	}
	
}
