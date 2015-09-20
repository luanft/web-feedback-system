package wfs.l2t.dto;

import java.sql.Date;
import java.util.Calendar;



public class dtoEducation {
	public Date startDate=null;
	public Date endDate=null;
	public String educationDescription ="";
	public int educationId=0;
	public String resumeId ="";
	public String schoolId ="";
	public String educationLevel ="";
	public String educationMajor="";
	public String educationLocation="";
	public String schoolName="";
	Calendar calStart= Calendar.getInstance();
	Calendar calEnd= Calendar.getInstance();
	public dtoEducation(){
		if(startDate!=null)
			calStart.setTime(startDate);
		if(endDate!=null)
			calEnd.setTime(endDate);
	}
	public Date getstartDate() {
		return startDate;
	}
	public void setstartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getendDate() {
		return endDate;
	}
	public void setendDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getEducationDescription() {
		return educationDescription;
	}
	public void setEducationDescription(String educationDescription) {
		this.educationDescription = educationDescription;
	}
	public int getEducationId() {
		return educationId;
	}
	public void setEducationId(int educationId) {
		this.educationId = educationId;
	}
	public String getResumeId() {
		return resumeId;
	}
	public void setResumeId(String resumeId) {
		this.resumeId = resumeId;
	}
	public String getSchoolId() {
		return schoolId;
	}
	public void setSchoolId(String schoolId) {
		this.schoolId = schoolId;
	}
	public String getEducationLevel() {
		return educationLevel;
	}
	public void setEducationLevel(String educationLevel) {
		this.educationLevel = educationLevel;
	}
	public String getEducationMajor() {
		return educationMajor;
	}
	public void setEducationMajor(String educationMajor) {
		this.educationMajor = educationMajor;
	}
	public String getEducationLocation() {
		return educationLocation;
	}
	public void setEducationLocation(String educationLocation) {
		this.educationLocation = educationLocation;
	}
	public String getSchoolName() {
		return schoolName;
	}
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName;
	}
	public int getMonthStart(){
		return calStart.get(Calendar.MONTH);
	}
	public int getYearStart(){
		return calStart.get(Calendar.YEAR);
	}
	public int getMonthEnd(){
		return calEnd.get(Calendar.MONTH);
	}
	public int getYearEnd(){
		return calEnd.get(Calendar.YEAR);
	}
	
	
}
