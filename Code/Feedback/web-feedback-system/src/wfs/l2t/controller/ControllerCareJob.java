package wfs.l2t.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wfs.l2t.dto.dtoJob;
import wfs.l2t.dto.dtoJobRecommended;
import wfs.l2t.model.ModelJob;
import wfs.l2t.model.ModelJobRecommended;
import wfs.l2t.utility.LoginUtility;

/**
 * Servlet implementation class ControllerCareJob
 */
@WebServlet("/ControllerCareJob")
public class ControllerCareJob extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private LoginUtility loginUtility;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerCareJob()
	{
		super();
		loginUtility = new LoginUtility();
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

		if (loginUtility.isLogged(request, response))
		{
			// new-job.jsp
			HttpSession session = request.getSession();
			session.setAttribute("offset", "0");
			request.setAttribute("user", this.loginUtility.getLoggedUserId());
			request.getRequestDispatcher("view/care-job.jsp").include(request, response);
		} else
		{
			response.sendRedirect(request.getContextPath() + "/login");
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
		if (loginUtility.isLogged(request, response))
		{
			request.setAttribute("user", this.loginUtility.getLoggedUserId());
			loadCaredJob(request, response);
			setSuitableJob(request);
		} else
		{
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	private void setSuitableJob(HttpServletRequest request) throws ServletException, IOException
	{
		if (request.getParameter("status") != null)
		{
			Cookie[] cookies = request.getCookies();
			String accountId = "";
			ModelJobRecommended mjr = new ModelJobRecommended();
			for (Cookie c : cookies)
			{
				if (c.getName().equals("jobrec_login_cookie"))
				{
					accountId = c.getValue();
					break;
				}
			}
			String key = request.getParameter("status");
			String jobId = request.getParameter("index");
			switch (key)
			{
			case "0":
				if (mjr.checkIfExist(jobId, accountId))
				{
					mjr.updateFittable(key, "0", accountId, jobId);
				} else
				{
					dtoJobRecommended jobRec = new dtoJobRecommended();
					jobRec.accountId = accountId;
					jobRec.jobId = jobId;
					jobRec.fit = "0";
					jobRec.notFit = "0";
					jobRec.seen = "1";
					mjr.add(jobRec);
				}
				break;
			case "1":
				if (mjr.checkIfExist(jobId, accountId))
				{
					mjr.updateFittable(key, "0", accountId, jobId);
				} else
				{
					dtoJobRecommended jobRec = new dtoJobRecommended();
					jobRec.accountId = accountId;
					jobRec.jobId = jobId;
					jobRec.fit = "1";
					jobRec.notFit = "0";
					jobRec.seen = "1";
					mjr.add(jobRec);
				}
				break;
			case "2":
				if (mjr.checkIfExist(jobId, accountId))
				{
					mjr.updateFittable("0", "1", accountId, jobId);
				} else
				{
					dtoJobRecommended jobRec = new dtoJobRecommended();
					jobRec.accountId = accountId;
					jobRec.jobId = jobId;
					jobRec.fit = "0";
					jobRec.notFit = "1";
					jobRec.seen = "1";
					mjr.add(jobRec);
				}
				break;
			default:
				break;
			}
		}
	}

	private void loadCaredJob(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException
	{
		ModelJob mdj = new ModelJob();
		HttpSession session = request.getSession();
		int offset = Integer.parseInt(session.getAttribute("offset").toString());

		List<dtoJob> jobList = mdj.getJobCared(loginUtility.getLoggedUserId(), offset);
		dtoJob job = new dtoJob();
		offset += 11;
		session.setAttribute("offset", offset);

		if (jobList.size() == 0)
			if (offset == 11)
				writeHtml("Bạn chưa chọn quan tâm công việc nào!", request, response);
			else
				writeHtml("Hết rồi! Đừng cuộn nữa mắc công. Hehe !!!", request, response);
		else
		{
			for (int i = 0; i < jobList.size(); i++)
			{
				job = jobList.get(i);
				writeHtml(job, mdj.getShortDescription(job.jobId), request, response);
			}
		}
	}

	private void writeHtml(dtoJob job, String shortDescription, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write("<div class=\"panel panel-info\" id = 'panel" + job.jobId + "'>");
		response.getWriter().write("<div class='panel-heading'>");
		response.getWriter().write(
				"<a id=\"see-more" + job.jobId + "\" class=\"btn btn-link\"onclick=\"myCollapse('" + job.jobId
						+ "')\"> <b>" + job.jobName + "</b></a>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='panel-body'>");
		response.getWriter().write("<div class='row'>");
		response.getWriter().write("<div class='company'>");
		response.getWriter().write("<pre>Công ty: " + job.company + "</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='location'>");
		response.getWriter().write("<pre>Địa chỉ: " + job.location + "</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='salary'>");
		response.getWriter().write("<pre>" + job.salary + " </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div id='short-description" + job.jobId + "'>");
		response.getWriter().write("<pre>Mô tả: " + shortDescription + " ...</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div id='full-info" + job.jobId + "' class='custom_hiden'>");
		response.getWriter().write("<div class='description'>");
		response.getWriter().write("<pre>Description:");
		response.getWriter().write(job.description);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='requirement'>");
		response.getWriter().write("<pre>Requirement:");
		response.getWriter().write(job.requirement);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='benifit'>");
		response.getWriter().write("<pre>Benifit:");
		response.getWriter().write(job.benifit);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='expire'>");
		response.getWriter().write("<pre>Expired: " + job.expired + " </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='source'>");
		response.getWriter().write("<pre>Nguồn: " + job.source + " </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='panel-footer'>");
		response.getWriter().write("<label>Bạn thấy công việc này có phù hợp với bạn không?</label>");
		response.getWriter()
				.write("<a onclick = likeClick(this,"
						+ job.jobId
						+ ") href='#/' value = '1' style='margin-left: 15px; margin-right: 15px;color:yellow;font-size:15px;'	class='glyphicon glyphicon-star' data-toggle='tooltip'	title='Việc này phù hợp với tôi!'></a>");
		response.getWriter()
				.write("<a onclick = dislikeClick("
						+ job.jobId
						+ ") href='#/' style='color:red;font-size:15px;' class='glyphicon glyphicon-remove' data-toggle='tooltip' title='Việc này không hợp, bỏ đi!' style='margin-left: 8px; margin-right: 8px;'></a>");
		response.getWriter().write("</div>");
		response.getWriter().write("<br>");
		response.getWriter().write("</div>");
	}

	private void writeHtml(String noti, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
	{
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().write("<p class = 'text-center' id = 'done' <b> <i> " + noti + " </i>  </b></p>");
	}
}
