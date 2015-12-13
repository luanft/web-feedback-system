package wfs.l2t.dto;

public class dtoAccount
{
	public String accountId = "";
	public String userName = "";
	public String password = "";
	public String email = "";
	public String accountType = "";
	public String timeReceiveEmail = "";
	public String numberReceiveEmail = "";
	public int isActive = 0;
	public String confirmCode = "";
	public String avatar = "";
	public String token = "";
	
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public String getTimeReceiveEmail() {
		return timeReceiveEmail;
	}
	public void setTimeReceiveEmail(String timeReceiveEmail) {
		this.timeReceiveEmail = timeReceiveEmail;
	}
	public String getNumberReceiveEmail() {
		return numberReceiveEmail;
	}
	public void setNumberReceiveEmail(String numberReceiveEmail) {
		this.numberReceiveEmail = numberReceiveEmail;
	}
	public int getIsActive() {
		return isActive;
	}
	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}
	public String getConfirmCode() {
		return confirmCode;
	}
	public void setConfirmCode(String confirmCode) {
		this.confirmCode = confirmCode;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getToken() {
		return token;
	}
	public void setToken(String token) {
		this.token = token;
	}
}
