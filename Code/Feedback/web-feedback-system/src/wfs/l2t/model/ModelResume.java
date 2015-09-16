package wfs.l2t.model;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import wfs.l2t.dto.*;


public class ModelResume extends Model {
	private int resumeId;
	public ModelResume(){
	}
	
	public HashMap<Integer,String> getResumeTitle(int accountId){
		HashMap<Integer,String> listTitle= new HashMap<Integer,String>();
		String sql="SELECT * FROM resume WHERE AccountId="+accountId;
		try {
			connection.connect();
			ResultSet result= connection.read(sql);
			while (result.next()){
				
				listTitle.put(result.getInt("ResumeId"), result.getString("Title"));
			}
			result.close();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();	
		}
		return listTitle;
	}
	public dtoResume getResume(int resumeId){
		dtoResume resume= new dtoResume();
		String sql="SELECT * FROM resume WHERE resumeId="+resumeId;
		resume.setResumeId(resumeId);
		this.resumeId=resumeId;
		try {
			connection.connect();
			ResultSet result= connection.read(sql);
			while (result.next()){
				resume.resumeId=resumeId;
				resume.address=result.getString("Address");
				resume.avatar=result.getString("Avatar");
				resume.birthday=result.getDate("Birthday");
				resume.email=result.getString("Email");
				resume.gender=result.getString("Gender");
				resume.hobby=result.getString("Hobby");
				resume.hometown=result.getString("Hometown");
				resume.maritalStatus=result.getBoolean("MaritalStatus");
				resume.name=result.getString("Name");
				resume.nationality=result.getString("Nationality");
				resume.phone=result.getString("Phone");
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
	public List<dtoEducation> getEducation(){
		List<dtoEducation> listEdu= new ArrayList<dtoEducation>();
		//StartDate,EndDate, EducationDescription, EducationLevel, EducationMajor, EducationLocation, SchoolName
		String sql="SELECT * FROM education, school WHERE education.SchoolID=school.SchoolID and ResumeId="+resumeId;
	
		try{
			connection.connect();
			ResultSet result=connection.read(sql);
			while(result.next()){
				dtoEducation edu= new dtoEducation();
				edu.educationDescription=result.getString("EducationDescription");
				edu.educationLevel= result.getString("EducationLevel");
				edu.educationMajor=result.getString("EducationMajor");
				edu.educationLocation=result.getString("EducationLocation");
				edu.startDate=result.getDate("StartDate");
				edu.endDate=result.getDate("EndDate");
				edu.schoolName=result.getString("SchoolName");
				edu.educationId=result.getInt("EducationId");
				listEdu.add(edu);
			}
			result.close();
			connection.close();
		}catch(SQLException e)
		{
			e.printStackTrace();
		}
		return listEdu;
		
	}
	public List<dtoSchool> getSchool(){
		List<dtoSchool> listSchool= new ArrayList<dtoSchool>();
		String sql="select * from school";
		connection.connect();
		ResultSet result=connection.read(sql);
		try {
			while (result.next()){
				dtoSchool s= new dtoSchool();
				s.schoolID= result.getInt("SchoolID");
				s.schoolName=result.getString("SchoolName");
				listSchool.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return listSchool;
	}
	public List<dtoExperience> getExperience()
	{
		
		String sql="select * from experience where ResumeId="+resumeId;
		List<dtoExperience> listExp=new ArrayList<dtoExperience>();
		try{
			connection.connect();
			ResultSet result= connection.read(sql);
			while(result.next()){
				dtoExperience exp= new dtoExperience();
				exp.companyName=result.getString("Company_name");
				exp.description=result.getString("Description");
				exp.jobCategory=result.getString("JobCategory");
				exp.period=result.getString("Period");
				exp.position= result.getString("Position");
				exp.jobTitle=result.getString("JobTitle");
				exp.experienceId= result.getInt("ExperienceId");
				listExp.add(exp);
			}
			result.close();
			connection.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return listExp;
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
				skill.skillId=result.getInt("Skillid");
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
				ref.id=result.getInt("ReferenceId");
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
	//update avartar
	public void UpdatePersonal( String gender, Boolean maritalStatus,String nationality) {
		String sql="update resume set Gender=?, MaritalStatus=?, Nationality=? where ResumeId="+resumeId;
		try{
			connection.connect();
			PreparedStatement stm=connection.getConnection().prepareStatement(sql);
			stm.setString(1, gender);
			stm.setBoolean(2, maritalStatus);
			stm.setString(3, nationality);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			
			
		} catch (SQLException e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		
	}
	public void UpdateContact(String address, String email, String phone){
		String sql="update resume set Address=?, Email=?, Phone=? where ResumeId="+resumeId;
		try{
		connection.connect();
		PreparedStatement stm= connection.getConnection().prepareStatement(sql);
		stm.setString(1, address);
		stm.setString(2, email);
		stm.setString(3, phone);
		
		connection.setPrepareStatement(stm);
		connection.writeSecure();
		
		
	} catch (SQLException e) {
	// TODO Auto-generated catch block
		e.printStackTrace();
	}
	connection.close();
	
	}
	public void RemoveEducation(int eduId){
		String sql= "Delete from education where EducationId="+eduId;
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void AddEducation(String startDate,String endDate, String educationDescription, int resumeId, int schoolID, String educationLevel, String educationMajor, String educationLocation){
		String sql="Insert into education(StartDate, EndDate, EducationDescription, ResumeId, SchoolID, EducationLevel, EducationMajor, EducationLocation) values(?,?,?,?,?,?,?,?)";
		try {
			connection.connect();
			PreparedStatement stm= connection.getConnection().prepareStatement(sql);
			stm.setString(1,startDate);
			stm.setString(2,endDate);
			stm.setString(3,educationDescription);
			stm.setInt(4,resumeId);
			stm.setInt(5,schoolID);
			stm.setString(6,educationLevel);
			stm.setString(7,educationMajor);
			stm.setString(8,educationLocation);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
	}
	public int AddSchool(String schoolName){
		List<dtoSchool> listSchool= getSchool();
		if(listSchool.size()!=0){
			for(dtoSchool s : listSchool){
				if(s.schoolName==schoolName)
					return -1;
			}
		}
		int schoolID=-1;
		String sql="insert into school (SchoolName) values('"+schoolName+"')";
		connection.connect();
		connection.write(sql);
		
		try {
			ResultSet re=connection.read("select * from school where SchoolName='"+schoolName+"'");
			while(re.next()){
			schoolID= re.getInt("SchoolID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return schoolID;
	}
	public void AddExperience(int ResumeId, String Company_name, String JobTitle, String Position, String Description, String Period){
		String sql="insert into experience (ResumeId,Company_name, JobTitle, Position, Description, Period) values(?, ?, ?, ?,?,?)";
		connection.connect();
		try {
			PreparedStatement stm= connection.getConnection().prepareStatement(sql);
			stm.setInt(1,ResumeId);
			stm.setString(2,Company_name );
			stm.setString(3,JobTitle );
			stm.setString(4,Position );
			stm.setString(5,Description );
			stm.setString(6,Period );
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
	}
	public void RemoveExperience(int expId){
		String sql= "Delete from experience where ExperienceId="+expId;
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void addSkill(String name, String level, int resumeId){
		String sql="insert into skill (Name, Level, ResumeId) values(?,?,?)";
		connection.connect();
		try {
			PreparedStatement stm= connection.getConnection().prepareStatement(sql);
			stm.setString(1, name);
			stm.setString(2, level);
			stm.setInt(3, resumeId);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
	}
	public void RemoveSkill(int skillId){
		String sql= "Delete from skill where SkillId="+skillId;
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void AddReference (String name, String job, String phone, String email, int resumeId){
		String sql="insert into reference (Name, JobTitle,Phone, Email,ResumeId) values(?,?,?,?,?)";
		connection.connect();
		try {
			PreparedStatement stm= connection.getConnection().prepareStatement(sql);
			stm.setString(1, name);
			stm.setString(2, job);
			stm.setString(3, phone);
			stm.setString(4, email);
			stm.setInt(5, resumeId);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
	}
	public void RemoveReference(int refId){
		String sql= "Delete from reference where ReferenceId="+refId;
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void UpdateHobbies(String hobbies, int resumeId){
		String sql="update resume set Hobby='"+hobbies+"' where ResumeId="+resumeId;
		System.out.print(sql);
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void UpdateCareerObject(int DesireSalary, int RecentSalary,String PositionType,String DesireCareerLevel,String DesireWorkLocation, Boolean WillingToRelocate, Boolean WillingToTravel,String CareerObjective, int resumeId){
		dtoCareerObjective cao = getCareerObjective();
		if(cao.getCareerObjectiveId()==0){
			AddCareerObjective(DesireSalary, RecentSalary, PositionType, DesireCareerLevel, DesireWorkLocation, WillingToRelocate, WillingToTravel, CareerObjective, resumeId);
			return;
		}
		
		String sql="Update career_objective set DesireSalary=?, RecentSalary=?, PositionType=?, DesireCareerLevel=?, DesireWorkLocation=?, WillingToRelocate=?,WillingToTravel=?, CareerObjective=? where ResumeId=?";
		connection.connect();
		try {
			PreparedStatement stm=connection.getConnection().prepareStatement(sql);
			stm.setInt(1,DesireSalary);
			stm.setInt(2, RecentSalary);
			stm.setString(3, PositionType);
			stm.setString(4, DesireCareerLevel);
			stm.setString(5, DesireWorkLocation);
			stm.setBoolean(6, WillingToRelocate);
			stm.setBoolean(7, WillingToTravel);
			stm.setString(8, CareerObjective);
			stm.setInt(9, resumeId);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
	}
	public void AddResume(int resumeId, int accountId,String title, String name, String birthday, String gender, Boolean maritalStatus, String nationality, String avatar, String address, String email, String phone, String hobbies){
		String sql="INSERT INTO `resume` (`ResumeId`, `AccountId`, `Title`, `Name`, `Birthday`, `Gender`, `MaritalStatus`, `Nationality`, `Avatar`, `Address`, `Email`, `Phone`, `Hobby`)"+
				" VALUES("+resumeId+","+accountId+", '"+title+"', '"+name+"', '"+birthday+"', '"+gender+"',"+maritalStatus+",'"+nationality+"', '"+avatar+"', '"+address+"','"+email+"', '"+phone+"','"+hobbies+"')";
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public void AddCareerObjective(int desireSalary, int recentSalary,String positionType,String desireCareerLevel,String desireWorkLocation, Boolean willingToRelocate, Boolean willingToTravel,String careerObjective, int resumeId){
		String sql="insert into career_objective (DesireSalary,RecentSalary, PositionType, DesireCareerLevel, DesireWorkLocation, WillingToRelocate, WillingToTravel, CareerObjective, resumeId) values ("+desireSalary+","+recentSalary+",'"+positionType+"','"+desireCareerLevel+"','"+desireWorkLocation+"',"+willingToRelocate+","+willingToTravel+",'"+careerObjective+"',"+resumeId+")";
		connection.connect();
		connection.write(sql);
		connection.close();
	}
	public int getNextResumeId(int accountId){
		connection.connect();
		int id=0;
		ResultSet re=connection.read("select*from resume where AccountId="+accountId);
		try {
			while (re.next())
			{
				id= re.getInt("ResumeId");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id+1;
	}

}
