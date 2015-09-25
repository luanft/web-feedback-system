package wfs.l2t.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.dtoAccount;
import wfs.l2t.dto.dtoJob;

public class DAOJob extends DAO {

	public DAOJob() {
		super();
	}

	public List<dtoJob> getJobByCategory(dtoAccount dtoAcc) {
		String sql = "SELECT `JobId` FROM `job` WHERE `CategoryId` in (SELECT `CategoryId` FROM `care` WHERE `AccountId` = "
				+ dtoAcc.accountId
				+ ")"
				+ "and `JobId` not in (SELECT `JobId`  FROM `job_recommended` WHERE (`Fit`= true or `NotFit` = true) and `AccountId` = "
				+ dtoAcc.accountId
				+ ")"
				+ "order by `JobId` desc limit 0,"
				+ dtoAcc.numberReceiveEmail;
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		dtoJob job = new dtoJob();
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					job = new dtoJob();
					job.jobId = rs.getString("JobId");
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

	public void addRecommendationJobs(List<dtoJob> jobs, String userId) {

		if (this.connection.connect()) {
			for (dtoJob job : jobs) {
				String sql = "INSERT INTO `job_recommended`(`AccountId`, `JobId`, `Fit`, `NotFit`,`Seen`) VALUES ("
						+ userId + "," + job.jobId + ",0,0,0)";
				try {
					this.connection.write(sql);
				} catch (Exception e) {
					// TODO: handle exception
				}
			}
			this.connection.close();
		}
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
