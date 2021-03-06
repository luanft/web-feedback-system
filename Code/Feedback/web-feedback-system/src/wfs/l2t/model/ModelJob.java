package wfs.l2t.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.dtoJob;

public class ModelJob extends Model
{
	public ModelJob()
	{
		super();
	}

	public List<dtoJob> getJob(int offset)
	{

		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select job.AccountId, job.JobId, JobName, category.CategoryId, category.Description as Category, Location, Salary, job.Description, Tags, Requirement, Benifit, Expired, Source, Company, Fit, NotFit, job_recommended.AccountId as UserId from category, job left join job_recommended on job_recommended.JobId = job.JobId where category.CategoryId = job.CategoryId limit "
				+ offset + ",10";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try
		{
			while (rs.next())
			{
				dtoJob job = new dtoJob();
				job.jobId = rs.getString("JobId");
				job.categoryId = rs.getString("CategoryId");
				job.accountId = rs.getString("AccountId");
				job.jobName = trimAll(rs.getString("JobName"));
				job.location = trimAll(rs.getString("Location"));
				job.salary = trimAll(rs.getString("Salary"));
				job.description = trimAll(rs.getString("Description"));
				job.tags = trimAll(rs.getString("Tags"));
				job.requirement = trimAll(rs.getString("Requirement"));
				job.benifit = trimAll(rs.getString("Benifit"));
				job.expired = trimAll(rs.getString("Expired"));
				job.source = trimAll(rs.getString("Source"));
				job.company = trimAll(rs.getString("Company"));
				job.fit = rs.getString("Fit");
				job.notFit = rs.getString("NotFit");
				job.userId = rs.getString("UserId");
				job.category = rs.getString("Category");
				jobList.add(job);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return jobList;
	}

	public List<dtoJob> getJobByCategory(int offset, int categoryId)
	{

		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select job.AccountId, job.JobId, JobName, category.Description as Category, Job.CategoryId, Location, Salary, job.Description, Tags, Requirement, Benifit, Expired, Source, Company, Fit, NotFit, job_recommended.AccountId as UserId FROM category, job LEFT JOIN job_recommended ON job_recommended.JobId = job.JobId WHERE job.CategoryId = "
				+ categoryId
				+ " AND category.CategoryId = "
				+ categoryId
				+ " order by job.JobId desc limit "
				+ offset
				+ ",10";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try
		{
			while (rs.next())
			{
				dtoJob job = new dtoJob();
				job.jobId = rs.getString("JobId");
				job.categoryId = rs.getString("CategoryId");
				job.accountId = rs.getString("AccountId");
				job.jobName = trimAll(rs.getString("JobName"));
				job.location = trimAll(rs.getString("Location"));
				job.salary = trimAll(rs.getString("Salary"));
				job.description = trimAll(rs.getString("Description"));
				job.tags = trimAll(rs.getString("Tags"));
				job.requirement = trimAll(rs.getString("Requirement"));
				job.benifit = trimAll(rs.getString("Benifit"));
				job.expired = trimAll(rs.getString("Expired"));
				job.source = trimAll(rs.getString("Source"));
				job.company = trimAll(rs.getString("Company"));
				job.fit = rs.getString("Fit");
				job.notFit = rs.getString("NotFit");
				job.userId = rs.getString("UserId");
				job.category = rs.getString("Category");
				jobList.add(job);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return jobList;
	}

	public String getShortDescription(String jobId)
	{
		String sql = "select left(Description, 100) as ShortDescription from job where JobId = ?";
		// String sql = "select Benifit from job where JobId = ?";
		connection.connect();
		String shortDes = "";
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, jobId);
			// stm.setString(1, "2769");
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			if (rs.next())
			{
				shortDes = trimAll(rs.getString("ShortDescription"));
				// shortDes = rs.getString("Benifit");
				// shortDes = trimAll(shortDes);
			} else
				return "";
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return shortDes;
	}

	public String trimAll(String txt)
	{

		while (txt.contains("  ") || txt.contains("\r\n") || txt.contains("\n\n") || txt.contains("\t"))
		{
			txt = txt.trim();
			txt = txt.replaceAll("(?m)^[ |\t]*\r?\n", "");
			txt = txt.replaceAll("(\\s){2,}", "\n");

			txt = txt.replaceAll("\t", " ");
			txt = txt.replaceAll("\r\n", "\n");
		}
		return txt;
	}

	public List<dtoJob> getJobRecommended(String userId)
	{
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select job.AccountId, job.JobId, JobName, category.CategoryId, category.Description as Category, Location, Salary, job.Description, Tags, Requirement, Benifit, Expired, Source, Company, Fit, NotFit, job_recommended.AccountId as UserId from category, job join job_recommended on job_recommended.JobId = job.JobId where category.CategoryId = job.CategoryId and Seen = 0 and job_recommended.AccountId = "
				+ userId + " order by job.JobId desc";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try
		{
			while (rs.next())
			{
				dtoJob job = new dtoJob();
				job.jobId = rs.getString("JobId");
				job.categoryId = rs.getString("CategoryId");
				job.accountId = rs.getString("AccountId");
				job.jobName = trimAll(rs.getString("JobName"));
				job.location = trimAll(rs.getString("Location"));
				job.salary = trimAll(rs.getString("Salary"));
				job.description = trimAll(rs.getString("Description"));
				job.tags = trimAll(rs.getString("Tags"));
				job.requirement = trimAll(rs.getString("Requirement"));
				job.benifit = trimAll(rs.getString("Benifit"));
				job.expired = trimAll(rs.getString("Expired"));
				job.source = trimAll(rs.getString("Source"));
				job.company = trimAll(rs.getString("Company"));
				job.fit = rs.getString("Fit");
				job.notFit = rs.getString("NotFit");
				job.userId = rs.getString("UserId");
				job.category = rs.getString("Category");
				jobList.add(job);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return jobList;
	}

	public List<dtoJob> getJobCared(String userId, int offset)
	{
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select job.AccountId, job.JobId, JobName, category.CategoryId, Location, Salary,job.Description, category.Description as Category, Tags, Requirement, Benifit, Expired, Source, Company, Fit, NotFit, job_recommended.AccountId as UserId from category, job join job_recommended on job_recommended.JobId = job.JobId and Fit = 1 and job_recommended.AccountId = "
				+ userId
				+ " where category.CategoryId = job.CategoryId order by job.JobId desc limit "
				+ offset
				+ ", 10";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try
		{
			while (rs.next())
			{
				dtoJob job = new dtoJob();
				job.jobId = rs.getString("JobId");
				job.categoryId = rs.getString("CategoryId");
				job.accountId = rs.getString("AccountId");
				job.jobName = trimAll(rs.getString("JobName"));
				job.location = trimAll(rs.getString("Location"));
				job.salary = trimAll(rs.getString("Salary"));
				job.description = trimAll(rs.getString("Description"));
				job.tags = trimAll(rs.getString("Tags"));
				job.requirement = trimAll(rs.getString("Requirement"));
				job.benifit = trimAll(rs.getString("Benifit"));
				job.expired = trimAll(rs.getString("Expired"));
				job.source = trimAll(rs.getString("Source"));
				job.company = trimAll(rs.getString("Company"));
				job.fit = rs.getString("Fit");
				job.notFit = rs.getString("NotFit");
				job.userId = rs.getString("UserId");
				job.category = rs.getString("Category");
				jobList.add(job);
			}
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return jobList;
	}
}
