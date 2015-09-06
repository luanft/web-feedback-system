package wfs.l2t.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.model.ModelAccount;

/**
 * Servlet implementation class ControllerCheckRegisterEmail
 */
@WebServlet("/ControllerCheckRegister")
public class ControllerCheckRegister extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private ModelAccount mdLogin = new ModelAccount();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerCheckRegister()
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
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		if (request.getParameter("email") != null)
			checkEmail(request, response);
		if (request.getParameter("pass") != null)
			checkPassword(request, response);
		if (request.getParameter("userName") != null)
			checkUserName(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{
		// TODO Auto-generated method stub
	}

	private void checkEmail(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{
		if (request.getParameter("email") != "")
		{
			String email = request.getParameter("email");
			response.getWriter().flush();
			if (mdLogin.getAccount(email) == null)
			{
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().write("");
			} else
			{
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().write("<i>Email này đã được đăng ký!</i>");
			}
		} else
		{
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().write("<i>Email không được trống!</i>");
		}
	}

	private void checkPassword(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{

		String pwd = request.getParameter("pass");
		String rpwd = request.getParameter("rpass");
		response.getWriter().flush();
		if (pwd.equals(rpwd))
		{
			response.getWriter().write("");
		} else
		{
			response.getWriter().write("Mật khẩu không trùng khớp!");
		}
	}

	private void checkUserName(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{

		String userName = request.getParameter("userName");
		response.getWriter().flush();
		if (userName != "")
		{
			response.getWriter().write("");
		} else
		{
			response.getWriter().write("Tên tài khoản không được trống!");
		}
	}
}
