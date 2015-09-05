package wfs.l2t.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.model.ModelAccount;
import wfs.l2t.utility.EmailUtility;

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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (request.getParameter("submit") != null) {
			response.getWriter().write("get cái gì ở đây !!!");

		} else {
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if (request.getParameter("submit") != null) {

			switch (request.getParameter("submit")) {
			case "login":
				login(request, response);
				break;
			case "register":
				register(request, response);
				break;
			default:
				break;
			}

		} else {
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {
		dtoAccount account = new dtoAccount();
		ModelAccount mdLogin = new ModelAccount();
		if (mdLogin.getAccount(request.getParameter("login-email")) != null) {
			account = mdLogin.getAccount(request.getParameter("login-email"));

			if (account.password.equals(request.getParameter("login-pass"))) {
				if (request.getParameter("login-check") != null) {
					Cookie c = new Cookie("cookieName", account.email);
					c.setMaxAge(5);
					response.addCookie(c);
				} else {
					Cookie c = new Cookie("cookieName", "anonymous User");
					c.setMaxAge(5);
					response.addCookie(c);
				}
				try {
					request.getRequestDispatcher("view/new-job.jsp").include(
							request, response);
				} catch (ServletException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			} else
				try {
					response.getWriter().write("fail");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		} else {
			try {
				response.getWriter().write("fail");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) {
		dtoAccount account = new dtoAccount();
		account.userName = request.getParameter("reg-username");
		account.email = request.getParameter("reg-email");
		account.password = request.getParameter("reg-password");
		String accType = request.getParameter("radio");
		account.accountType = "employer".equals(accType) ? "employer"
				: "job-seeker";
		account.timeReceiveEmail = "weekly";
		account.numberReceiveEmail = "10";
		ModelAccount mdLogin = new ModelAccount();
		mdLogin.addAccount(account);

		// verify by email
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		String recipient = request.getParameter("reg-email");
		String subject = "Verify Account";
		String content = "This is email to verify your account on: abc.xyz";

		String resultMessage = "";

		try {
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject,
					content);
			resultMessage = "The e-mail was sent successfully";
		} catch (Exception ex) {
			ex.printStackTrace();
			resultMessage = "There were an error: " + ex.getMessage();
		} finally {
			request.setAttribute("Message", resultMessage);
			try {
				request.getRequestDispatcher("view/notification.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
