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
public class ControllerResume extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private LoginUtility login = new LoginUtility();
	dtoResume resume = new dtoResume();

	public ControllerResume() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (login.isLogged(request, response)) {
			String resumeId = request.getParameter("id");
			String delete_education = request.getParameter("delete_education");
			String delete_language = request.getParameter("delete_language");
			String delete_experience = request
					.getParameter("delete_experience");
			String delete_skill = request.getParameter("delete_skill");
			if (resumeId != null && resumeId != "") {

				ModelResume resume = new ModelResume();
				// kiem tra cv co thuoc ve user hay không
				if (resume.canModify(this.login.getLoggedUserId(), resumeId)) {
					// xóa education
					if (delete_education != null && delete_education != "") {
						resume.deleteEducation(resumeId, delete_education);
					}
					// xoa language
					if (delete_language != null && delete_language != "") {
						resume.deleteLanguage(resumeId, delete_language);
					}
					// xoa kinh nghiem
					if (delete_experience != null && delete_experience != "") {
						resume.deleteExperience(resumeId, delete_experience);
					}
					// xóa skill
					if (delete_skill != null && delete_skill != "") {
						resume.deleteSkill(resumeId, delete_skill);
					}
				}

				request.setAttribute("user", this.login.getLoggedUserId());
				request.setAttribute("id", resumeId);
				request.getRequestDispatcher("view/resume-profile.jsp")
						.include(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/listresume");
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (login.isLogged(request, response)) {

			String resumeId = request.getParameter("id");
			String btn_add_education = request
					.getParameter("btn_add_education");
			String btn_add_language = request.getParameter("btn_add_language");
			String addResume = request.getParameter("add-resume-button");
			String btn_add_experience = request
					.getParameter("btn_add_experience");
			String btn_add_skill = request.getParameter("btn_add_skill");

			String btn_add_objective = request
					.getParameter("btn_add_objective");
			// xu ly cap nhat thong tin cá nhân
			if (addResume != null) {
				this.updateResume(request, response);
			}

			// xu ly them skill
			if (btn_add_skill != null) {
				this.addSkill(request, response);
			}

			// xu ly them kinh nghiêm lam viec

			if (btn_add_experience != null) {
				this.addExperience(request, response);

			}

			// xu ly them education
			if (btn_add_education != null) {

				this.addAnEduation(request, response);

			}

			// xu ly them language
			if (btn_add_language != null) {
				this.addAnLanguage(request, response);

			}

			// them objective
			if (btn_add_objective != null) {
				this.updateObjective(request, response);
			}

			request.setAttribute("user", this.login.getLoggedUserId());
			request.setAttribute("id", resumeId);
			request.getRequestDispatcher("view/resume-profile.jsp").include(
					request, response);
		}
	}

	public void LoadPage(HttpServletRequest request) {

	}

	// /cac ham xu ly con

	private String getMysqlDate(String date) {
		String[] data = date.split("/");
		if (data.length > 0) {
			date = data[2] + "-" + data[1] + "-" + data[0];
		}
		return date;
	}

	// them mot education
	private Boolean addAnEduation(HttpServletRequest request,
			HttpServletResponse response) {
		String resumeId = request.getParameter("id");
		String school = request.getParameter("school_name");
		String level = request.getParameter("education_level");
		String major = request.getParameter("education_major");
		String description = request.getParameter("education_description");
		String start = request.getParameter("startday_input");
		String end = request.getParameter("endday_input");

		start = this.getMysqlDate(start);
		end = this.getMysqlDate(end);
		ModelResume resume = new ModelResume();
		resume.AddEducation(resumeId, school, level, major, description, start,
				end);
		return true;
	}

	private Boolean addAnLanguage(HttpServletRequest request,
			HttpServletResponse response) {
		String resumeId = request.getParameter("id");
		String language = request.getParameter("language_name");
		String level = request.getParameter("language_level");
		ModelResume resume = new ModelResume();
		resume.addLanguage(resumeId, language, level);
		return true;
	}

	private Boolean updateResume(HttpServletRequest request,
			HttpServletResponse response) {

		String resumeId = request.getParameter("id");
		String title = request.getParameter("title-input");
		// personal
		String name = request.getParameter("full-name-input");
		String birthday = request.getParameter("birthday-input");

		String gender = request.getParameter("gender-input");
		String maritalStatus = request.getParameter("status_select");
		String nationality = request.getParameter("nationality_input");
		// contact
		String address = request.getParameter("address-input");
		String email = request.getParameter("email-input");
		String phone = request.getParameter("phone-input");
		// hobbies
		String hobbies = request.getParameter("hobbies-input");
		ModelResume model = new ModelResume();

		model.updateResume(resumeId, this.login.getLoggedUserId(), title, name,
				birthday, gender, maritalStatus, nationality, address, email,
				phone, hobbies);

		return true;

	}

	private Boolean addSkill(HttpServletRequest request,
			HttpServletResponse response) {

		String resumeId = request.getParameter("id");
		String skill_name = request.getParameter("skill_name");
		String skill_level = request.getParameter("skill_level");
		ModelResume model = new ModelResume();
		model.addSkill(skill_name, skill_level, resumeId);
		return true;

	}

	private Boolean addExperience(HttpServletRequest request,
			HttpServletResponse response) {

		String resumeId = request.getParameter("id");
		String company_name = request.getParameter("company_name");
		String job_name = request.getParameter("job_name");
		String job_position = request.getParameter("job_position");
		String job_description = request.getParameter("job_description");
		String job_time = request.getParameter("job_time");
		ModelResume model = new ModelResume();
		model.addExperience(resumeId, company_name, job_name, job_position,
				job_description, job_time);
		return true;
	}

	private Boolean updateObjective(HttpServletRequest request,
			HttpServletResponse response) {
		String resumeId = request.getParameter("id");
		ModelResume model = new ModelResume();
		// neu chưa có objective
		if (!model.hasAObject(resumeId)) {
			model.addObjective(resumeId, "0", "0", "Toàn thời gian",
					"Nhân Viên", "Chưa xác định", "0", "0", "Chưa xác định");
		}

		String desireSalary = request.getParameter("desireSalary");
		String recentSalary = request.getParameter("recentSalary");
		String positionType = request.getParameter("positionType");
		String desireCareerLevel = request.getParameter("desireCareerLevel");
		String desireWorkLocation = request.getParameter("desireWorkLocation");
		String CareerObjective = request.getParameter("CareerObjective");
		String willingToRelocate = "0";
		String WillingToTravel = "0";

		String[] data = request.getParameterValues("opt_object");
		if (data != null) {
			for (String i : data) {
				if (i.equals("willingToRelocate")) {
					willingToRelocate = "1";
				}
				if (i.equals("WillingToTravel")) {
					WillingToTravel = "1";
				}
			}
		}

		model.updateObjective(resumeId, desireSalary, recentSalary,
				positionType, desireCareerLevel, desireWorkLocation,
				willingToRelocate, WillingToTravel, CareerObjective);
		return true;
	}
}
