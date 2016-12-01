package wfs.l2t.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoJob;

public class DAOJob extends DAO {

	public DAOJob() {
		super();
	}

	public List<dtoJob> getJobByCategory(dtoAccount dtoAcc) {
		int numberEmail = 500; 
		String relevantJobs = "SELECT `JobId`,`JobName`,`Company` FROM `job` WHERE `CategoryId` in (SELECT `CategoryId` FROM `care` WHERE `AccountId` = "
				+ dtoAcc.accountId
				+ ")"
				+ "and (`JobId` not in (SELECT `JobId`  FROM `job_recommended` WHERE `AccountId` = "
				+ dtoAcc.accountId
				+ "))"
				+ "order by `JobId` desc limit 0,"
				+ numberEmail;
		numberEmail = 100;
		String irrelevantJobs = "SELECT * FROM `job` WHERE (`job`.`CategoryId` not in (SELECT `care`.`CategoryId` from `care` where `care`.`AccountId` = "+dtoAcc.accountId+")) and (`job`.`JobId` not in (select `job_recommended`.`JobId` from `job_recommended` where `job_recommended`.`AccountId` = "+dtoAcc.accountId+")) order by rand() LIMIT 0 , "+numberEmail;
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		dtoJob job = new dtoJob();
		if (this.connection.connect()) {
			ResultSet rs1 = this.connection.read(relevantJobs);
			ResultSet rs2 = this.connection.read(irrelevantJobs);
			try {
				while (rs1.next()) {
					job = new dtoJob();
					job.jobId = rs1.getString("JobId");
					job.company = rs1.getString("Company");
					job.jobName = rs1.getString("JobName");
					jobList.add(job);
				}
				while (rs2.next()) {
					job = new dtoJob();
					job.jobId = rs2.getString("JobId");
					job.company = rs2.getString("Company");
					job.jobName = rs2.getString("JobName");
					jobList.add(job);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return jobList;
	}

	public int addRecommendationJobs(List<dtoJob> jobs, String userId) {
		int count = 0;
		for (dtoJob job : jobs) {
			if (!isExisted(job.jobId, userId)) {
				if (this.connection.connect()) {
					DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
					Date dateObj = new Date();
					String sql = "INSERT INTO `job_recommended`(`AccountId`, `JobId`, `Save`,`Rating`,`Seen`,`Time`) VALUES ("
							+ userId
							+ ","
							+ job.jobId
							+ ",0,0,0,'"
							+ df.format(dateObj) + "')";
					try {
						this.connection.write(sql);
						count++;
					} catch (Exception e) {
						// TODO: handle exception
					}
					this.connection.close();
				}
			}
		
		}
		return count;
	}

	private boolean isExisted(String jobId, String userId) {
		String sql = "select * from `job_recommended` where `AccountId`= "
				+ userId + " and `JobId` = " + jobId;
		boolean exist = false;
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				exist = rs.next();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
			return exist;

		}
		return false;
	}

	public void addRecommendationJob(String jobId, String userId) {

		String sql = "INSERT INTO `job_recommended`(`AccountId`, `JobId`) VALUES ("
				+ userId + "," + jobId + ")";
		if (this.connection.connect()) {
			this.connection.write(sql);
			this.connection.close();
		}
	}
}
