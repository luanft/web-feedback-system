package wfs.l2t.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoAccountStatistic;
import wfs.l2t.dto.dtoJob;
import wfs.l2t.dto.dtoRecJobStatistic;

public class ModelStatistic extends Model {
	public ModelStatistic(){
		super();
	}

	public List<dtoAccountStatistic> getAllAccount(){
		List<dtoAccountStatistic> listName= new ArrayList<dtoAccountStatistic>();
		String sql="Select* from account where AccountType='job-seeker'";
		if(connection.connect()){
		ResultSet rs = connection.read(sql);
		
		try{
			while(rs.next()){
				dtoAccountStatistic acc = new dtoAccountStatistic();
				int accId=rs.getInt("AccountId");
				acc.setAccountId(Integer.toString(accId));
				acc.setUserName(rs.getString("UserName"));
				acc.setEmail(rs.getString("Email"));
				acc.setNumberJobRated(this.getNumberJobRated(accId));
				acc.setNumberJobSent(this.getNumberJobSent(accId));
				
			listName.add(acc);
			}
		
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}
		return listName;
	}
	
	public int getNumberJobSent(int accId){
		
		String sql="select count(*) from job_recommended where `AccountId`="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getNumberJobRated(int accId){
		String sql="select count(*) from job_recommended where `rating` !=0 and `AccountId`="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getNumberUser()
	{
		String sql="Select count(*) from account where AccountType='job-seeker'";
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getJobhasRated(){
		String sql="select count(*) from job_recommended where `rating` !=0";
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getJobhasSent(){
		String sql="select count(*) from job_recommended";
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getFiveStar(int accId){
		String sql="select count(*) from job_recommended where Rating=5 and AccountId="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}

	public int getFourStar(int accId){
		String sql="select count(*) from job_recommended where Rating=4 and AccountId="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getThreeStar(int accId){
		String sql="select count(*) from job_recommended where Rating=3 and AccountId="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getTwoStar(int accId){
		String sql="select count(*) from job_recommended where Rating=2 and AccountId="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getOneStar(int accId){
		String sql="select count(*) from job_recommended where Rating=1 and AccountId="+accId;
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
				return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public dtoAccountStatistic getUser(int accId){
		String sql="Select* from account where AccountType='job-seeker' and AccountId="+accId;
		dtoAccountStatistic acc = new dtoAccountStatistic();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try{
				while(rs.next()){
					acc.setAccountId(Integer.toString(accId));
					acc.setUserName(rs.getString("UserName"));
					acc.setEmail(rs.getString("Email"));
					acc.setNumberJobRated(this.getNumberJobRated(accId));
					acc.setNumberJobSent(this.getNumberJobSent(accId));
					acc.setRateFiveStar(this.getFiveStar(accId));
					acc.setRateFourStar(this.getFourStar(accId));
					acc.setRateThreeStar(this.getThreeStar(accId));
					acc.setRateTwoStar(this.getTwoStar(accId));
					acc.setRateOneStar(this.getOneStar(accId));
					
				
				}
			
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		}
		return acc;
	}
	public List<dtoRecJobStatistic> getRecJob(int accId)
	{
		String sql="select JobName, category.Description as Category, Time, Rating  from job_recommended join job on job_recommended.jobId=job.jobId join category on job.CategoryId=category.CategoryId where job_recommended.AccountId="+accId;
		List<dtoRecJobStatistic> listJob= new ArrayList<dtoRecJobStatistic>();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					dtoRecJobStatistic job= new dtoRecJobStatistic();
					job.setJobName(rs.getString("JobName"));
					job.setCategory(rs.getString("Category"));
					job.setTime(rs.getTimestamp("Time"));
					job.setRating(Integer.toString(rs.getInt("Rating")));
					listJob.add(job);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listJob;
	}
	public List<dtoRecJobStatistic> getRecJobCategory(int categoryId){
		String sql="select distinct jr.JobId, JobName, c.Description as Category "
				+ "from job_recommended jr join job on jr.jobId=job.jobId join category c on job.CategoryId=c.CategoryId "
				+ "where c.CategoryId="+categoryId;
		List<dtoRecJobStatistic> listJob= new ArrayList<dtoRecJobStatistic>();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					dtoRecJobStatistic job= new dtoRecJobStatistic();
					job.setJobId(Integer.toString(rs.getInt("JobId")));
					job.setJobName(rs.getString("JobName"));
					job.setCategory(rs.getString("Category"));
					job.setNumberRating(this.getNumberRating(rs.getInt("JobId")));
					job.setFiveStarRating(this.getFiveRating(rs.getInt("JobId")));
					listJob.add(job);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listJob;
	}

	public List<dtoRecJobStatistic> getAllRecJob(){
		String sql="select distinct jr.JobId, JobName, c.Description as Category "
				+ "from job_recommended jr join job on jr.jobId=job.jobId join category c on job.CategoryId=c.CategoryId ";
		List<dtoRecJobStatistic> listJob= new ArrayList<dtoRecJobStatistic>();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					dtoRecJobStatistic job= new dtoRecJobStatistic();
					job.setJobId(Integer.toString(rs.getInt("JobId")));
					job.setJobName(rs.getString("JobName"));
					job.setCategory(rs.getString("Category"));
					job.setNumberRating(this.getNumberRating(rs.getInt("JobId")));
					job.setFiveStarRating(this.getFiveRating(rs.getInt("JobId")));
					listJob.add(job);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return listJob;
	}
	public dtoRecJobStatistic getJobDetail(int jobId){
		String sql="select job_recommended.JobId as JobId, JobName from job_recommended join job on job_recommended.JobId=job.JobId where job_recommended.JobId="+jobId;
		dtoRecJobStatistic job= new dtoRecJobStatistic();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					
					job.setJobId(Integer.toString(rs.getInt("JobId")));
					job.setJobName(rs.getString("JobName"));
					job.setFiveStarRating(this.getFiveRating(jobId));
					job.setFourStarRating(this.getFourRating(jobId));
					job.setThreeStarRating(this.getThreeRating(jobId));
					job.setTwoStarRating(this.getTwoRating(jobId));
					job.setOneStarRating(this.getOneRating(jobId));
					job.setUserRateFiveStar(this.getUserRatedFive(jobId));
					job.setUserRateFourStar(this.getUserRatedFour(jobId));
					job.setUserRateThreeStar(this.getUserRatedThree(jobId));
					job.setUserRateTwoStar(this.getUserRatedTwo(jobId));
					job.setUserRateOneStar(this.getUserRatedOne(jobId));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return job;
	}
	public int getNumberRating(int jobId) {
		String sql = "select count(*) from job_recommended where JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getFiveRating(int jobId){
		String sql = "select count(*) from job_recommended where Rating= 5 and JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getFourRating(int jobId){
		String sql = "select count(*) from job_recommended where Rating= 4 and JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getThreeRating(int jobId){
		String sql = "select count(*) from job_recommended where Rating= 3 and JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getTwoRating(int jobId){
		String sql = "select count(*) from job_recommended where Rating= 2 and JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public int getOneRating(int jobId){
		String sql = "select count(*) from job_recommended where Rating= 1 and JobId=" + jobId;
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					return rs.getInt(1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return 0;
	}
	public List<dtoAccount> getUserRatedFive(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 5 and JobId=" + jobId;
		List<dtoAccount> list=new ArrayList<dtoAccount>();
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoAccount acc= new dtoAccount();
					acc.setAccountId(Integer.toString(rs.getInt("AccountId")));
					acc.setUserName(rs.getString("UserName"));
					list.add(acc);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<dtoAccount> getUserRatedFour(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 4 and JobId=" + jobId;
		List<dtoAccount> list=new ArrayList<dtoAccount>();
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoAccount acc= new dtoAccount();
					acc.setAccountId(Integer.toString(rs.getInt("AccountId")));
					acc.setUserName(rs.getString("UserName"));
					list.add(acc);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<dtoAccount> getUserRatedThree(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 3 and JobId=" + jobId;
		List<dtoAccount> list=new ArrayList<dtoAccount>();
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoAccount acc= new dtoAccount();
					acc.setAccountId(Integer.toString(rs.getInt("AccountId")));
					acc.setUserName(rs.getString("UserName"));
					list.add(acc);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<dtoAccount> getUserRatedTwo(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 2 and JobId=" + jobId;
		List<dtoAccount> list=new ArrayList<dtoAccount>();
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoAccount acc= new dtoAccount();
					acc.setAccountId(Integer.toString(rs.getInt("AccountId")));
					acc.setUserName(rs.getString("UserName"));
					list.add(acc);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public List<dtoAccount> getUserRatedOne(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 1 and JobId=" + jobId;
		List<dtoAccount> list=new ArrayList<dtoAccount>();
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				while (rs.next()) {
					dtoAccount acc= new dtoAccount();
					acc.setAccountId(Integer.toString(rs.getInt("AccountId")));
					acc.setUserName(rs.getString("UserName"));
					list.add(acc);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
}

