package wfs.l2t.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wfs.l2t.dto.dtoJob;
import wfs.l2t.model.ModelJob;

/**
 * Servlet implementation class ControllerHome
 */
@WebServlet("/ControllerHome")
public class ControllerHome extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerHome()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	private String currentUserId = "";

	private Boolean isLoged(HttpServletRequest request, HttpServletResponse response)
	{

		Cookie[] cookie = request.getCookies();
		Boolean isLogged = false;
		if (cookie == null)
			return false;
		for (int i = 0; i < cookie.length; i++)
		{
			switch (cookie[i].getName())
			{
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (isLoged(request, response))
		{
			// new-job.jsp
			request.getRequestDispatcher("view/new-job.jsp").include(request, response);
			loadJob();
		} else
		{
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	private void loadJob()
	{
		ModelJob mdj = new ModelJob();
		List<dtoJob> jobList = mdj.getJob(0);
		for (dtoJob job : jobList)
		{

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
