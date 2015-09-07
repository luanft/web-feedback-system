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
public class ControllerLogin extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	private dtoAccount account = new dtoAccount();
	private ModelAccount mdLogin = new ModelAccount();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerLogin()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (request.getParameter("submit") != null)
		{
			response.getWriter().write("get cái gì ở đây !!!");

		} else
		{
			request.getRequestDispatcher("view/login.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if (request.getParameter("submit") != null)
		{

			switch (request.getParameter("submit"))
			{
			case "login":
				login(request, response);
				break;
			case "register":
				register(request, response);
				break;
			default:
				break;
			}

		} else
		{
			request.getRequestDispatcher("view/login.jsp").include(request, response);
		}
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// check email
		if (mdLogin.getAccount(request.getParameter("login-email")) != null)
		{
			account = mdLogin.getAccount(request.getParameter("login-email"));
			// check password
			if (account.password.equals(request.getParameter("login-pass")))
			{
				// check activate status
				if (account.isActive)
				{
					// check if user want to keep login
					if (request.getParameter("login-check") != null)
					{						
						Cookie cookieUserId = new Cookie("jobrec_login_cookie", account.accountId);
						cookieUserId.setMaxAge(3600);
						response.addCookie(cookieUserId);
						
					} else
					{
						Cookie cookieUserId = new Cookie("jobrec_login_cookie", account.accountId);
						cookieUserId.setMaxAge(3600);
						response.addCookie(cookieUserId);
					}
					// login successful
					//request.getRequestDispatcher("view/new-job.jsp").forward(request, response);
					response.sendRedirect(request.getContextPath()+"/home");
				} else
				{
					// not activate account
					request.setAttribute("Message",
							"Bạn chưa xác thực email. Vui lòng xác thực email để kích hoạt tài khoản của bạn!");
					request.getRequestDispatcher("view/notification.jsp").include(request, response);
				}
			} else
			{
				// login fail - password do not match
				request.setAttribute("Message", "Sai mật khẩu!");
				request.getRequestDispatcher("view/login.jsp").forward(request, response);
			}
		} else
		// email do not exist
		{
			request.setAttribute("Message", "Sai email!");
			request.getRequestDispatcher("view/login.jsp").include(request, response);
		}
	}

	private void register(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{
		// check condition register
		if (mdLogin.getAccount(request.getParameter("reg-email")) == null)
		{
			account.userName = request.getParameter("reg-username");
			account.email = request.getParameter("reg-email");
			account.password = request.getParameter("reg-password");
			String accType = request.getParameter("radio");
			account.accountType = "employer".equals(accType) ? "employer" : "job-seeker";
			account.timeReceiveEmail = "weekly";
			account.numberReceiveEmail = "10";

			mdLogin.addAccount(account);
		}
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
		try
		{
			EmailUtility.sendEmail(host, port, user, pass, recipient, subject, content);
			resultMessage = "Để bắt đầu sử dụng hệ thống vui lòng xác nhận đăng ký qua email của bạn!";
		} catch (Exception ex)
		{
			ex.printStackTrace();
			resultMessage = "Lỗi gửi mail. Sorry!!!" + ex.getMessage();
		} finally
		{
			request.setAttribute("Message", resultMessage);
			request.getRequestDispatcher("view/notification.jsp").include(request, response);
		}
	}
}
