package wfs.l2t.model;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoAccountStatistic;
import wfs.l2t.dto.dtoRecJobStatistic;

public class ModelStatistic extends Model {
	public ModelStatistic(){
		super();
	}

	public List<dtoAccountStatistic> getAllAccount(){
		List<dtoAccountStatistic> listName= new ArrayList<dtoAccountStatistic>();
		String sql="Select account.AccountId, UserName, Email, count(*) as NumberJobRated "
				+ "from account join job_recommended on account.AccountId= job_recommended.AccountId "
				+ "where Rating!=0 "
				+ "group by AccountId, UserName, Email "
				+ "order by NumberJobRated desc";
				
		if(connection.connect()){
		ResultSet rs = connection.read(sql);
		
		try{
			while(rs.next()){
				dtoAccountStatistic acc = new dtoAccountStatistic();
				int accId=rs.getInt("AccountId");
				acc.setAccountId(Integer.toString(accId));
				acc.setUserName(rs.getString("UserName"));
				acc.setEmail(rs.getString("Email"));
				acc.setNumberJobRated(rs.getInt("NumberJobRated"));
				acc.setNumberJobSent(this.getNumberJobSent(accId));
				
			listName.add(acc);
			}
		
		} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
		}
		if(listName.size()>0)
		{
			listName.sort(new Comparator<dtoAccountStatistic>() {

				@Override
				public int compare(dtoAccountStatistic o1, dtoAccountStatistic o2) {
					return o1.getNumberJobRated()<o2.getNumberJobRated()?1:
						o1.getNumberJobRated()>o2.getNumberJobRated()?-1:0;
					// TODO Auto-generated method stub
				
						}
			});
		}
		return listName;
	}
	// Đếm số lượng công việc đã gửi
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
	// Đếm số lượng người dùng
	public int getNumberUser()
	{
		String sql="Select count(*) from account";
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
	// Đếm sô lượng công việc đã đánh giá
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
	// Đếm số lượng công việc đã gửi
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
	// Đếm số lượng các công việc được đánh giá là 5 sao của 1 người dùng xác định
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
	// Đếm số lượng các công việc được đánh giá là 4 sao của 1 người dùng xác định
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
	// Đếm số lượng các công việc được đánh giá là 3 sao của 1 người dùng xác định
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
	// Đếm số lượng các công việc được đánh giá là 2 sao của 1 người dùng xác định
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
	// Đếm số lượng các công việc được đánh giá là 1 sao của 1 người dùng xác định
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
	// lấy  thông tin chi tiết của một người dùng 
	public dtoAccountStatistic getUser(int accId, String userName){
		dtoAccountStatistic acc = new dtoAccountStatistic();
		acc.setAccountId(Integer.toString(accId));
		acc.setUserName(userName);
		acc.setListRecJob(this.getListRecJob(accId));
		acc.setRateFiveStar(this.getFiveStar(accId));
		acc.setRateFourStar(this.getFourStar(accId));
		acc.setRateThreeStar(this.getThreeStar(accId));
		acc.setRateTwoStar(this.getTwoStar(accId));
		acc.setRateOneStar(this.getOneStar(accId));
		return acc;
	}
	// Lấy danh sách công việc được đánh giá bởi một người dùng xác định
	public List<dtoRecJobStatistic> getListRecJob(int accId)
	{
		String sql="select JobName, category.Description as Category, Time, Rating "
				+ "from job_recommended join job on job_recommended.jobId=job.jobId join category on job.CategoryId=category.CategoryId "
				+ "where job_recommended.AccountId="+accId+" order by Rating desc, Time desc  limit 100";
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
	// Lấy danh sách các công việc theo loại giới hạn 200 cv
	public List<dtoRecJobStatistic> getRecJobCategory(int categoryId){
		String sql="select jr.JobId, JobName, c.Description as Category, count(*) as NumberRating "
				+ "from job_recommended jr join job on jr.jobId=job.jobId join category c on job.CategoryId=c.CategoryId "
				+ "where c.CategoryId="+categoryId+" group by JobId, JobName, Category order by NumberRating desc Limit 50";
		List<dtoRecJobStatistic> listJob= new ArrayList<dtoRecJobStatistic>();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					dtoRecJobStatistic job= new dtoRecJobStatistic();
					job.setJobId(Integer.toString(rs.getInt("JobId")));
					job.setJobName(rs.getString("JobName"));
					job.setCategory(rs.getString("Category"));
					job.setNumberRating(Integer.parseInt(rs.getString("NumberRating")));
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
	// Lấy danh sách công việc được đánh giá tối đa 100cv và chỉ lấy loại đánh giá 5, 4, 3 sao
	public List<dtoRecJobStatistic> getAllRecJob(){
		String sql="select jr.JobId, JobName, c.Description as Category, count(*) as RatingNumber "
				+ "from job_recommended jr join job on jr.jobId=job.jobId join category c on job.CategoryId=c.CategoryId "
				+ "group by JobId, JobName, Category order by RatingNumber desc Limit 100 ";
		List<dtoRecJobStatistic> listJob= new ArrayList<dtoRecJobStatistic>();
		if(connection.connect()){
			ResultSet rs = connection.read(sql);
			try {
				while(rs.next()){
					dtoRecJobStatistic job= new dtoRecJobStatistic();
					job.setJobId(Integer.toString(rs.getInt("JobId")));
					job.setJobName(rs.getString("JobName"));
					job.setCategory(rs.getString("Category"));
					job.setNumberRating(Integer.parseInt(rs.getString("RatingNumber")));
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
	// lấy thông tin chi tiết của một công việc
	public dtoRecJobStatistic getJobDetail(String strJobId, String jobName){
		dtoRecJobStatistic job = new dtoRecJobStatistic();
		int jobId=Integer.parseInt(strJobId);
		job.setJobId(strJobId);
		job.setJobName(jobName);
		job.setUserRateFiveStar(this.getUserRatedFive(jobId));
		job.setUserRateFourStar(this.getUserRatedFour(jobId));
		job.setUserRateThreeStar(this.getUserRatedThree(jobId));
		job.setUserRateTwoStar(this.getUserRatedTwo(jobId));
		job.setUserRateOneStar(this.getUserRatedOne(jobId));

		return job;
	}
	// Lấy số lượng người dùng đánh giá của một công việc xác định
	public int getNumberRating(int jobId) {
		String sql = "select count(*) from job_recommended where JobId=" + jobId+ "and rating <>0";
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
	// Lấy số lượng người dùng đánh giá 5 sao của một công việc xác định
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
	// Lấy đanh sách tên người dùng đã đánh giá công việc với mức độ 5 sao
	public List<dtoAccount> getUserRatedFive(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 5 and JobId=" + jobId+" limit 50";
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
	// Lấy đanh sách tên người dùng đã đánh giá công việc với mức độ 4 sao
	public List<dtoAccount> getUserRatedFour(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 4 and JobId=" + jobId+ " limit 50";
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
	// Lấy đanh sách tên người dùng đã đánh giá công việc với mức độ 3 sao
	public List<dtoAccount> getUserRatedThree(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 3 and JobId=" + jobId+ " limit 50";
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
	// Lấy đanh sách tên người dùng đã đánh giá công việc với mức độ 2 sao
	public List<dtoAccount> getUserRatedTwo(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 2 and JobId=" + jobId+" limit 50";
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
	// Lấy đanh sách tên người dùng đã đánh giá công việc với mức độ 1 sao
	public List<dtoAccount> getUserRatedOne(int jobId){
		String sql = "select account.AccountId as AccountId, UserName from job_recommended join account "
				+ "on job_recommended.AccountId=account.AccountId where Rating= 1 and JobId=" + jobId+" Limit 50";
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

