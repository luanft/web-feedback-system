package wfs.l2t.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.dtoJob;

public class ModelJobImpl extends Model implements IModelJob {

	@Override
	public List<dtoJob> getJobRecommended(String userId, int offset) {
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select job.AccountId, job.JobId, JobName, rankedlist.AccountId as UserId, category.CategoryId, category.Description as Category, Location, Salary, job.Description, Tags, Requirement, Benifit, Expired, Source, Company, Rating from category, job join rankedlist on rankedlist.JobId = job.JobId where rankedlist.Rating is null and category.CategoryId = job.CategoryId and rankedlist.AccountId = "
				+ userId + " order by job.JobId desc";
		if (connection.connect()) {
			ResultSet rs = connection.read(sql);
			try {
				List<String> previousJobId = new ArrayList<>();
				while (rs.next()) {
					
					dtoJob job = new dtoJob();					
					job.jobId = rs.getString("JobId");
					if(previousJobId.contains(job.jobId)){
						continue;
					}										
					previousJobId.add(job.jobId);
					
					job.categoryId = rs.getString("CategoryId");
					job.accountId = rs.getString("AccountId");
					job.jobName = trimAll(rs.getString("JobName"));
					job.location = trimAll(rs.getString("Location"));
					job.salary = trimAll(rs.getString("Salary").replace("L��ng:", ""));
					job.description = trimAll(rs.getString("Description"));
					job.tags = trimAll(rs.getString("Tags"));
					job.requirement = trimAll(rs.getString("Requirement"));
					job.benifit = trimAll(rs.getString("Benifit"));
					job.expired = trimAll(rs.getString("Expired"));
					job.source = trimAll(rs.getString("Source"));
					job.company = trimAll(rs.getString("Company"));
					job.userId = rs.getString("UserId");
					job.category = rs.getString("Category");
					job.rating = rs.getString("Rating");
					jobList.add(job);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection.close();
		}
		return jobList;
	}

	@Override
	public String trimAll(String txt) {
		while (txt.contains("  ") || txt.contains("\r\n") || txt.contains("\n\n") || txt.contains("\t")) {
			txt = txt.trim();
			txt = txt.replaceAll("(?m)^[ |\t]*\r?\n", "");
			txt = txt.replaceAll("(\\s){2,}", "\n");

			txt = txt.replaceAll("\t", " ");
			txt = txt.replaceAll("\r\n", "\n");
			txt = txt.replaceAll("\n-\n", "-");
			txt = txt.replaceAll(":\n", ":");
		}
		return txt;
	}

	@Override
	public String getShortDescription(String jobId) {
		String sql = "select left(Description, 100) as ShortDescription from job where JobId = ?";
		// String sql = "select Benifit from job where JobId = ?";
		String shortDes = "";
		if (connection.connect()) {
			try {
				PreparedStatement stm = connection.getConnection().prepareStatement(sql);
				stm.setString(1, jobId);
				// stm.setString(1, "2769");
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				if (rs.next()) {
					shortDes = trimAll(rs.getString("ShortDescription"));
					// shortDes = rs.getString("Benifit");
					// shortDes = trimAll(shortDes);
				} else
					return "";
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			connection.close();
		}
		return shortDes;
	}

}
