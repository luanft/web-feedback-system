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
import wfs.l2t.dto.dtoJobRecommended;
import wfs.l2t.model.ModelJobExperimentalImpl;
import wfs.l2t.model.ModelJobImpl;
import wfs.l2t.utility.LoginUtility;

/**
 * Servlet implementation class ControllerExperimental
 */
@WebServlet(description = "This class is using for collect the user's rating for recommended jobs", urlPatterns = {
		"/ControllerExperimental" })
public class ControllerExperimental extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginUtility loginUtility;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerExperimental() {
		super();
		loginUtility = new LoginUtility();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		if (loginUtility.isLoggedByToken(request, response)) {
			request.setAttribute("user", loginUtility.getLoggedUserId());
			request.getRequestDispatcher("view/experimental.jsp").include(request, response);
			return;
		} else {
			if (loginUtility.isLogged(request, response)) {
				request.setAttribute("user", loginUtility.getLoggedUserId());

				request.getRequestDispatcher("view/experimental.jsp").include(request, response);
				return;
			}
			
			
			Cookie c = new Cookie("redirecttoview", "/ControllerExperimental");
			response.addCookie(c);
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		// check if user is logged in
		if (loginUtility.isLogged(request, response) || loginUtility.isLoggedByToken(request, response)) {
			request.setAttribute("user", loginUtility.getLoggedUserId());
			// if page ready -> load job
			if (request.getParameter("ready") != null)
				loadRecommendedJob(request, response);
			// if user rate or save job
			if (request.getParameter("saveClick") != null || request.getParameter("rateClick") != null)
				setSuitableJob(request, response);
		} else {// redirect to login page
			request.setAttribute("fromJobRec", request.getContextPath());
			response.sendRedirect(request.getContextPath() + "/login");
		}
	}

	private void setSuitableJob(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String accountId = loginUtility.getLoggedUserId();
		dtoJobRecommended jobRec = new dtoJobRecommended();
		jobRec.accountId = accountId;
		jobRec.jobId = request.getParameter("jobId");
		jobRec.rating = request.getParameter("rating");
		ModelJobExperimentalImpl mjr = new ModelJobExperimentalImpl();
		mjr.update(jobRec);
		if (request.getParameter("rateClick") != null)
			if (mjr.countJobRated(accountId).equals(mjr.countJobs(accountId))) {
				response.getWriter().write("tất cả");
			} else {
				response.getWriter().write(mjr.countJobRated(accountId));
			}
	}

	private void loadRecommendedJob(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		ModelJobImpl mdj = new ModelJobImpl();
		List<dtoJob> jobList = mdj.getJobRecommended(loginUtility.getLoggedUserId(), 0);

		dtoJob job = new dtoJob();

		if (jobList.size() == 0)
			writeHtml(request, response);
		else
			for (int i = 0; i < jobList.size(); i++) {
				job = jobList.get(i);
				writeHtml(job, mdj.getShortDescription(job.jobId), request, response);
			}
	}

	private void writeHtml(dtoJob job, String shortDescription, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter()
				.write("<div style = 'margin-bottom:10px' class=\"panel panel-info\" id = 'panel" + job.jobId + "'>");
		response.getWriter().write("<div class='panel-heading'>");
		response.getWriter()
				.write("<a id=\"see-more" + job.jobId + "\" class=\"btn btn-link\"onclick=\"myCollapse('" + job.jobId
						+ "')\"> <b style='font-size: 16px;white-space: pre-wrap; word-break: normal;' class = 'text-left  pull-left'>"
						+ job.jobName + "</b></a>");

		response.getWriter().write("</div>");
		response.getWriter().write("<div class='panel-body'>");
		response.getWriter().write("<div class='row'>");
		response.getWriter().write("<div class='company'>");
		response.getWriter().write("<pre><b>Công ty: </b>" + job.company + "</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='location'>");
		response.getWriter().write("<pre><b>Địa chỉ: </b>" + job.location + "</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='salary'>");
		response.getWriter().write("<pre><b>Lương: </b>" + job.salary + " </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div id='short-description" + job.jobId + "'>");
		response.getWriter()
				.write("<pre><b>Mô tả: </b>" + shortDescription + " ...<a id=\"see-more" + job.jobId
						+ "\" class=\"btn btn-link\"onclick=\"myCollapse('" + job.jobId
						+ "')\" style=\"padding: 0px 0px\">Xem thêm</a></pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div id='full-info" + job.jobId + "' class='custom_hiden'>");
		response.getWriter().write("<div class='description'>");
		response.getWriter().write("<pre><b>Mô tả: </b>");
		response.getWriter().write(job.description);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='requirement'>");
		response.getWriter().write("<pre><b>Yêu cầu: </b>");
		response.getWriter().write(job.requirement);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='benifit'>");
		response.getWriter().write("<pre><b>Lợi ích: </b>");
		response.getWriter().write(job.benifit);
		response.getWriter().write("</pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='expire'>");
		response.getWriter().write("<pre><b>Ngày hết hạn: </b>" + job.expired + " </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='source'>");
		response.getWriter().write(
				"<pre><b>Nguồn: </b><a href = '" + job.source + "'target='_blank'>" + job.source + "</a> </pre>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
		response.getWriter().write("<div class='panel-footer'> <i> Mức độ phù hợp của việc làm này với bạn? </i>");
		for (int i = 1; i <= 5; i++) {
			response.getWriter().write("<a class = 'bookmark' id = '" + job.jobId + "_" + i
					+ "'onclick = 'rating(this, " + i + ", " + job.jobId + ")' onmouseover = 'mouseOverRating("
					+ job.jobId + ", " + i + ")'onmouseout = 'mouseOutRating(" + job.jobId
					+ ")' href='#/' value = '0' style='color:#D9EDF7;font-size:25px; margin-left:3px;'><span class='glyphicon glyphicon-star'></span></a>");
		}
		response.getWriter().write("<i style = 'margin-left:20px;' id = 'tip_" + job.jobId + "'><span></span></i>");
		response.getWriter().write("<a class = 'bookmark pull-right' id = '" + job.jobId + "' onclick = likeClick(this,"
				+ job.jobId
				+ ") href='#/' value = '0' style='margin-left: 15px; margin-right: 15px;color:#AFB4BD;font-size:15px;'><span class='glyphicon glyphicon-floppy-saved'></span> Lưu việc làm</a>");
		response.getWriter().write("</div>");
		response.getWriter().write("</div>");
	}

	private void writeHtml(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter()
				.write("<p class = 'text-center' <b> <i> Bạn đã hoàn thành khảo sát, chân thành cảm ơn sự giúp đỡ của bạn! </i>  </b></p>");
	}
}
