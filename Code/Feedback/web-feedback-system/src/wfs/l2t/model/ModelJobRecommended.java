package wfs.l2t.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import wfs.l2t.dto.dtoJobRecommended;

public class ModelJobRecommended extends Model
{
	public ModelJobRecommended()
	{
		super();
	}

	public void add(dtoJobRecommended jobRec)
	{
		connection.connect();
		String sql = "insert into `job_recommended` value(?,?,?,?,?)";
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, jobRec.accountId);
			stm.setString(2, jobRec.jobId);
			stm.setString(3, jobRec.fit);
			stm.setString(4, jobRec.notFit);
			stm.setString(5, jobRec.seen);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		connection.close();
	}

	public void updateFittable(String fit, String notFit, String accountId, String jobId)
	{
		connection.connect();
		String sql = "update `job_recommended` set `Fit` = ?, NotFit = ?, Seen = 1 where `AccountId` = ? and `JobId` = ?";
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, fit);
			stm.setString(2, notFit);
			stm.setString(3, accountId);
			stm.setString(4, jobId);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		connection.close();
	}

	public boolean checkIfExist(String jobId, String accountId)
	{
		connection.connect();
		String sql = "select * from `job_recommended` where `AccountId` = ? and `JobId` = ?";
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, accountId);
			stm.setString(2, jobId);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			if (rs.next())
				return true;
		} catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		connection.close();
		return false;
	}
}
