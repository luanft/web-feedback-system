package wfs.l2t.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.model.ModelAccount;

/**
 * Servlet implementation class ControllerLogin
 */
@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerLogin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().write("blalalalal");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().write("blalalalal");
		if (request.getParameter("reg-username") != null || request.getParameter("reg-username").isEmpty()) {
			
			dtoAccount account = new dtoAccount();
			account.userName = request.getParameter("reg-username");
			account.email = request.getParameter("reg-email");
			account.password = request.getParameter("reg-password");
			account.accountType = request.getParameter("reg-user-type");
			account.timeReceiveEmail = "weekly";
			account.numberReceiveEmail = "10";
			ModelAccount mdLogin = new ModelAccount();
			mdLogin.addAccount(account);
			response.getWriter().write("save");
			
		} else {
			 request.getRequestDispatcher("login.jsp").include(request, response);
		}
	}

}
