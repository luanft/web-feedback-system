package wfs.l2t.utility;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.model.ModelAccount;

public class LoginUtility {

	ModelAccount account;

	public LoginUtility() {
		account = new ModelAccount();
	}

	private String currentUserId = null;

	public void logOut(HttpServletRequest request, HttpServletResponse response) {
		this.currentUserId = null;
		Cookie[] cookie = request.getCookies();
		Boolean isLogged = false;
		if (cookie == null)
			return;
		for (Cookie c : cookie) {
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}

	public Boolean isLogged(HttpServletRequest request,
			HttpServletResponse response) {
		this.currentUserId = null;
		String token = "";
		String remember = "";
		Cookie[] cookie = request.getCookies();
		Boolean isLogged = false;
		if (cookie == null)
			return false;
		for (int i = 0; i < cookie.length; i++) {
			switch (cookie[i].getName()) {
			case "jobrec_login_remember":
				remember = cookie[i].getValue();
				break;
			case "jobrec_login_cookie":
				isLogged = true;
				this.currentUserId = cookie[i].getValue();
				break;
			case "jobrec_login_token":
				token = cookie[i].getValue();
				break;
			default:
				break;
			}
		}
		switch (remember) {
		case "true":
			if (account.getLoginToken(this.currentUserId).equals(token)) {
				return isLogged;
			}
			return false;
		default:
			HttpSession session = request.getSession();
			loginSession obj = (loginSession) session
					.getAttribute("login_session");
			if(obj == null) return false;
			this.currentUserId = obj.userId;
			token = obj.token;
			if (this.currentUserId != null) {
				if (account.getLoginToken(this.currentUserId).equals(token)) {
					return true;
				}
			}
			break;
		}
		return false;
	}

	public String getLoggedUserId() {
		return this.currentUserId;
	}

}
