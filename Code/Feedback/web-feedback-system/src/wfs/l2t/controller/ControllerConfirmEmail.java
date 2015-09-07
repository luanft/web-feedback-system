package wfs.l2t.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.model.ModelAccount;

/**
 * Servlet implementation class ControllerConfirmEmail
 */
@WebServlet("/ControllerConfirmEmail")
public class ControllerConfirmEmail extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerConfirmEmail()
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
		String code = request.getParameter("code");
		// response.getWriter().println(code);

		ModelAccount md = new ModelAccount();
		if (md.checkConfirmCode(code))
		{
			request.setAttribute(
					"Message",
					"Xác thực email thành công. Vui lòng đăng nhập tại <a href= 'http://localhost:8080/web-feedback-system/login'> recsys.com </a> để sử dụng hệ thống! ");
			md.updateActivation(1);
			response.sendRedirect(request.getContextPath() + "/notification");
		}
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

}
