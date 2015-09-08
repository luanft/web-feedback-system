package wfs.l2t.model;

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

	public List<dtoJob> getJob(int nums)
	{
		dtoJob job = new dtoJob();
		List<dtoJob> jobList = new ArrayList<dtoJob>();
		String sql = "select * from `job` order by JobId asc limit " + nums + ",10";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try
		{
			if (rs.next() != false)
			{
				job.accountId = Integer.toString(rs.getInt("AccountId"));
				job.jobId = rs.getString("JobId");
				job.categoryId = rs.getString("Category");
				job.accountId = rs.getString("AccountId");
				job.jobName = rs.getString("JobName");
				job.location = rs.getString("Location");
				job.salary = rs.getString("Salary");
				job.description = rs.getString("Description");
				job.tags = rs.getString("Tags");
				job.requirement = rs.getString("Requirement");
				job.benifit = rs.getString("Benifit");
				job.expired = rs.getString("Expired");
				job.source = rs.getString("Source");
				jobList.add(job);
			} else
				return null;
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return jobList;
	}

	public List<dtoJob> getJob()
	{
		String sql = "select count(*) from `job`";
		connection.connect();
		int nums = 0;
		ResultSet rs = connection.read(sql);
		try
		{
			rs.next();
			nums = rs.getInt("nums");
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return getJob(nums);
	}
}
