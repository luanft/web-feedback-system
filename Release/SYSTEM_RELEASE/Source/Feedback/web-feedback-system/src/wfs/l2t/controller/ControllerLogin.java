package wfs.l2t.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.model.ModelAccount;
import wfs.l2t.utility.EmailUtility;
import wfs.l2t.utility.LoginUtility;
import wfs.l2t.utility.Md5Utility;
import wfs.l2t.utility.loginSession;

/**
 * Servlet implementation class ControllerLogin
 */
@WebServlet("/ControllerLogin")
public class ControllerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private dtoAccount account = new dtoAccount();
	private ModelAccount mdLogin = new ModelAccount();
	private LoginUtility loginUtility = new LoginUtility();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerLogin() {
		super();
		// TODO Auto-generated constructor stub
		md5 = new Md5Utility();
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
		if (loginUtility.isLogged(request, response)) {
			request.setAttribute("user", loginUtility.getLoggedUserId());
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}
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
		if (loginUtility.isLogged(request, response)) {
			response.sendRedirect(request.getContextPath() + "/home");
			return;
		}

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
			// response.sendRedirect(request.getContextPath() + "/Login");
		}
	}

	private Md5Utility md5;

	private void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// check email
		if (mdLogin.getAccount(request.getParameter("login-email")) != null) {
			account = mdLogin.getAccount(request.getParameter("login-email"));
			// check password
			String pass = request.getParameter("login-pass");
			pass = md5.md5(pass);
			if (account.password.equals(pass)) {
				// check activate status
				if (account.isActive) {
					// check if user want to keep login
					if (request.getParameter("login-check") != null) {

						Cookie cookieRemember = new Cookie(
								"jobrec_login_remember", "true");
						cookieRemember.setMaxAge(31104000);

						Cookie cookieUserId = new Cookie("jobrec_login_cookie",
								account.accountId);
						cookieUserId.setMaxAge(31104000);

						String token = md5.generateToken();
						mdLogin.setToken(account.accountId, token);
						Cookie cookieToken = new Cookie("jobrec_login_token",
								token);
						cookieToken.setMaxAge(31104000);

						response.addCookie(cookieUserId);
						response.addCookie(cookieToken);
						response.addCookie(cookieRemember);

					} else {
						Cookie cookieRemember = new Cookie(
								"jobrec_login_remember", "false");
						cookieRemember.setMaxAge(31104000);
						HttpSession session = request.getSession();
						loginSession obj = new loginSession();
						obj.userId = account.accountId;

						String token = md5.generateToken();
						mdLogin.setToken(account.accountId, token);
						obj.token = token;
						session.setAttribute("login_session", obj);
						response.addCookie(cookieRemember);
					}
					response.sendRedirect(request.getContextPath() + "/home");
				} else {
					// not activate account
					request.setAttribute(
							"Message",
							"Bạn chưa xác thực email. Vui lòng xác thực email để kích hoạt tài khoản của bạn!");
					request.getRequestDispatcher("view/notification.jsp")
							.include(request, response);
				}
			} else {
				// login fail - password do not match
				request.setAttribute("Message", "Sai mật khẩu!");
				request.getRequestDispatcher("view/login.jsp").include(request,
						response);
			}
		} else
		// email do not exist
		{
			request.setAttribute("Message", "Sai email!");
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		}
	}

	private void register(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// check condition register
		String email = request.getParameter("reg-email");
		String userName = request.getParameter("reg-username");
		String password = request.getParameter("reg-password");
		String rpassword = request.getParameter("reg-re-type-password");
		if (email != "" && userName != "" && password != "" && rpassword != "") {
			if (password.equals(rpassword)) {
				account.userName = userName;
				account.email = email;
				account.password = password;
				String accType = request.getParameter("radio");
				account.accountType = "employer".equals(accType) ? "employer"
						: "job-seeker";
				account.timeReceiveEmail = "weekly";
				account.numberReceiveEmail = "10";
				account.confirmCode = UUID.randomUUID().toString();
				account.avatar = "/view/resource/image/avatar/icon-user-default.png";
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

				String content = "This is email to verify your account on: http://localhost:8080/web-feedback-system/ControllerConfirmEmail?code="
						+ account.confirmCode
						+ "&accountId="
						+ mdLogin.getAccountId(account.email);

				String resultMessage = "";
				try {
					EmailUtility.sendEmail(host, port, user, pass, recipient,
							subject, content);
					resultMessage = "Để bắt đầu sử dụng hệ thống vui lòng xác nhận đăng ký qua email của bạn!";
				} catch (Exception ex) {
					ex.printStackTrace();
					resultMessage = "Lỗi gửi mail. Sorry!!!" + ex.getMessage();
				} finally {
					request.setAttribute("Message", resultMessage);
					request.getRequestDispatcher("view/notification.jsp")
							.include(request, response);
				}
			}
		} else {
			request.setAttribute("Message-Register-Error",
					"Vui lòng điền đầy đủ thông tin!");
			request.getRequestDispatcher("view/login.jsp").include(request,
					response);
		}
	}
}
