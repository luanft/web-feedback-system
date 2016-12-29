package wfs.l2t.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ControllerDatasetManagement
 */
@WebServlet("/dataset")
public class ControllerDatasetManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerDatasetManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		File downloadFile = new File("C:\\JobRecSys\\data\\" + request.getParameter("dsname"));
		try {
		    FileInputStream inputStream = new FileInputStream(downloadFile);

		    /* Set content attribute for response */
		    response.setContentType("application/octec-stream");
		    response.setContentLength((int) downloadFile.length());

		    /* Set header for response */
		    String headerKey = "Content-Disposition";
		    String headerValue = String.format("attachment; filename=\"%s\"",
				    downloadFile.getName());
		    response.setHeader(headerKey, headerValue);

		    /* Get output stream of the response */
		    OutputStream outputStream = response.getOutputStream();

		    /* Write file to output */
		    byte[] buffer = new byte[4069];
		    int byteRead = -1;
		    while ((byteRead = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, byteRead);
		    }
		    inputStream.close();
		    outputStream.close();
		} catch (IOException e) {
		    e.printStackTrace();
		}
	}
}
