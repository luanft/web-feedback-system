package wfs.l2t.model;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.*;

public class ModelResume extends Model {
	private int resumeId;
	SimpleDateFormat sm= new SimpleDateFormat("dd/MM/yyyy");
	public ModelResume(){
	}
	public dtoResume getResume(int AccountId){
		dtoResume resume= new dtoResume();
		String sql="SELECT * FROM resume WHERE AccountId="+AccountId;
		try {
			connection.connect();
			ResultSet result= connection.read(sql);
			while (result.next()){
				resumeId=result.getInt("ResumeId");
				resume.address=result.getString("Address");
				resume.avatar=result.getString("Avatar");
				resume.birthday=sm.format(result.getDate("Birthday"));
				resume.email=result.getString("Email");
				resume.gender=result.getString("Gender");
				resume.hobby=result.getString("Hobby");
				resume.hometown=result.getString("Hometown");
				resume.maritalStatus=result.getBoolean("MaritalStatus");
				resume.name=result.getString("Name");
				resume.nationality=result.getString("Nationality");
				resume.phone=result.getString("Phone");
				resume.placeOfBirth=result.getString("PlaceOfBirth");
				resume.resumeTitle=result.getString("Title");
			}
			result.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
		return resume;
	}
	public dtoEducation getEducation(){
		dtoEducation edu= new dtoEducation();
		String sql="SELECT StartDate,EndDate, EducationDescription, EducationLevel, EducationMajor, EducationLocation, SchoolName FROM education, school WHERE education.SchoolID=school.SchoolID and ResumeId="+resumeId;
	
		try{
			connection.connect();
			ResultSet result=connection.read(sql);
			while(result.next()){
				edu.educationDescription=result.getString("EducationDescription");
				edu.educationLevel= result.getString("EducationLevel");
				edu.educationMajor=result.getString("EducationMajor");
				edu.educationLocation=result.getString("EducationLocation");
				edu.startDate=sm.format(result.getDate("StartDate"));
				edu.endDate=sm.format(result.getDate("EndDate"));
				edu.schoolName=result.getString("SchoolName");
			}
			result.close();
			connection.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return edu;
		
	}
	public dtoExperience getExperience()
	{
		dtoExperience exp= new dtoExperience();
		String sql="select * from experience where ResumeId="+resumeId;
		try{
			connection.connect();
			ResultSet result= connection.read(sql);
			while(result.next()){
				exp.companyName=result.getString("Company_name");
				exp.description=result.getString("Description");
				exp.jobCategory=result.getString("JobCategory");
				exp.period=result.getString("Period");
				exp.position= result.getString("Position");
				exp.jobTitle=result.getString("JobTitle");
			}
			result.close();
			connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return exp;
	}
	public List<dtoSkill> getSkill()
	{
		List<dtoSkill> listSkill= new ArrayList<dtoSkill>();
		String sql= "select * from skill where ResumeId="+resumeId;
		try{
			connection.connect();
			ResultSet result= connection.read(sql);
			while(result.next()){
				dtoSkill skill= new dtoSkill();
				skill.name=result.getString("Name");
				skill.level=result.getString("Level");
				listSkill.add(skill);
				
			}
			connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return listSkill;
	}
	public List<dtoReference> getReference()
	{
		connection.connect();
		List<dtoReference> listRef= new ArrayList<dtoReference>();
		String sql= "select * from reference where ResumeId="+resumeId;
		try{
			ResultSet result= connection.read(sql);
			while(result.next()){
				dtoReference ref= new dtoReference();
				ref.name= result.getString("Name");
				ref.jobTitle= result.getString("JobTitle");
				ref.phone= result.getString("Phone");
				ref.email= result.getString("Email");
				listRef.add(ref);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		connection.close();
		return listRef;
	}
	public dtoCareerObjective getCareerObjective()
	{
		
		dtoCareerObjective cao= new dtoCareerObjective();
		String sql= "select * from career_objective where ResumeId="+resumeId;
		try{
			connection.connect();
			ResultSet result= connection.read(sql);
			while(result.next()){
				cao.desireSalary=result.getInt("DesireSalary");
				cao.recentSalary=result.getInt("RecentSalary");
				cao.positionType=result.getString("PositionType");
				cao.desireCareerLevel=result.getString("DesireCareerLevel");
				cao.desireWorkLocation=result.getString("DesireWorkLocation");
				cao.willingToRelocate=result.getBoolean("WillingToRelocate")==false?"No":"Yes";
				cao.willingToTravel=result.getBoolean("WillingToTravel")==false?"No":"Yes";
				cao.careerObjective=result.getString("CareerObjective");
			}
			connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return cao;
	}
}
