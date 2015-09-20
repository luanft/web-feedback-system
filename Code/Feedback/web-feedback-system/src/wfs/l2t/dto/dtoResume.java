package wfs.l2t.dto;

import java.sql.Date;
import java.util.Calendar;

public class dtoResume {

	public int resumeId=-1;
	public String accountId="";
	public String resumeTitle="";
	public String name="";
	public Date birthday=null;
	public String gender="";
	public Boolean maritalStatus=false;
	public String placeOfBirth="";
	public String hometown="";
	public String nationality="";
	public String avatar="";
	public String address="";
	public String email="";
	public String phone="";
	public String hobby="";

	Calendar cal= Calendar.getInstance();
	public dtoResume(){
		 if(this.birthday!=null)
			 cal.setTime(this.birthday);
		
	}
	public int getResumeId() {
		return resumeId;
	}
	public void setResumeId(int resumeId) {
		this.resumeId = resumeId;
	}
	public String getAccountId() {
		return accountId;
	}
	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}
	public String getResumeTitle() {
		return resumeTitle;
	}
	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Boolean getMaritalStatus() {
		return maritalStatus;
	}
	public void setMaritalStatus(Boolean maritalStatus) {
		this.maritalStatus = maritalStatus;
	}
	public String getPlaceOfBirth() {
		return placeOfBirth;
	}
	public void setPlaceOfBirth(String placeOfBirth) {
		this.placeOfBirth = placeOfBirth;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getAvatar() {
		return avatar;
	}
	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public int getDay() {
		
		return cal.get(Calendar.DAY_OF_MONTH);
	}
	public void setDay(int day) {
		cal.set(Calendar.DAY_OF_MONTH, day);
	}
	public int getMonth() {
		return cal.get(Calendar.MONTH);
	}
	public void setMonth(int month) {
		
	}
	public int getYear() {
		return cal.get(Calendar.YEAR);
	}
	public void setYear(int year) {
	
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	

}
