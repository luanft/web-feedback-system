package wfs.l2t.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.Cache;
import wfs.l2t.model.ModelAccount;
import wfs.l2t.model.ModelCare;

/**
 * Servlet implementation class ControllerSetting
 */
@WebServlet("/ControllerSetting")
public class ControllerSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerSetting() {
		super();
		// TODO Auto-generated constructor stub
	}

	private String currentUserId = "";

	private Boolean isLoged(HttpServletRequest request,
			HttpServletResponse response) {

		Cookie[] cookie = request.getCookies();
		Boolean isLogged = false;
		if(cookie == null) return false;
		for (int i = 0; i < cookie.length; i++) {
			switch (cookie[i].getName()) {
			case "jobrec_login_cookie":
				isLogged = true;
				this.currentUserId = cookie[i].getValue();
				break;

			default:
				break;
			}
		}
		return isLogged;
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (isLoged(request, response)) {
			
			request.setAttribute("user", this.currentUserId);
			request.getRequestDispatcher("view/configure-system.jsp").include(
					request, response);
		} else {
//			request.getRequestDispatcher("/login").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (!isLoged(request, response)) {
//			request.getRequestDispatcher("/login").forward(request, response);
			response.sendRedirect(request.getContextPath()+"/login");
		}
		request.setAttribute("user", this.currentUserId);
		PrintWriter out = response.getWriter();

		String submit_by_jquery = request.getParameter("jquery-sumit");
		String form_number_email = request.getParameter("fne-btn-submit");
		String form_time_email = request.getParameter("fte-btn-submit");
		String form_care_category = request.getParameter("fcc-btn-submit");

		// xu ly khi sutmit form chon so email mot lan gui
		if (form_number_email != null) {
			String number = request.getParameter("fne_rdo_number");
			ModelAccount model = new ModelAccount();
			if (number != null)
				model.setReceiveEmailNumber(currentUserId, number);
			request.getRequestDispatcher("view/configure-system.jsp").include(
					request, response);
			return;
		}

		// xu ly khi chon form chon thoi gian nhan mail
		if (form_time_email != null) {
			String time = request.getParameter("fte-rdo-time");
			ModelAccount model = new ModelAccount();
			if (time != null)
				model.setReceiveEmailTime(currentUserId, time);
			// fte-rdo-time
			request.getRequestDispatcher("view/configure-system.jsp").include(
					request, response);
			return;
		}

		// xu ly form chon thoi gian quan tam
		if (form_care_category != null) {
			// lay du lieu
			String[] data = request.getParameterValues("fcc_ck_cat");
			if (data.length > 0) {
				// luu du liêu
				ModelCare careModel = new ModelCare();
				careModel.uncareAllCategory(currentUserId);
				careModel.careCategory(currentUserId, data);
				request.getRequestDispatcher("view/configure-system.jsp")
						.include(request, response);
			}
			return;
		}

	}

}
