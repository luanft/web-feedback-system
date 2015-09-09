package wfs.l2t.utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginUtility {

	public LoginUtility(){}
	
	private String currentUserId = null;
	
	public Boolean isLogged(HttpServletRequest request,
			HttpServletResponse response)
	{
		this.currentUserId = null;
		Cookie[] cookie = request.getCookies();
		Boolean isLogged = false;
		if (cookie == null)
			return false;
		for (int i = 0; i < cookie.length; i++) {
			switch (cookie[i].getName()) {
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
	
	public String getLoggedUserId()
	{
		return this.currentUserId;
	}

}
