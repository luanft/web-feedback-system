package wfs.l2t.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import wfs.l2t.dto.dtoJobRecommended;

public class ModelJobExperimentalImpl extends Model implements IModelJobRecommended {

	@Override
	public void update(dtoJobRecommended jobRec) {
		if (connection.connect()) {
			String sql = "update `rankedlist` set Rating = ? where `AccountId` = ? and `JobId` = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, jobRec.rating);
				stm.setString(2, jobRec.accountId);
				stm.setString(3, jobRec.jobId);

				connection.setPrepareStatement(stm);
				connection.writeSecure();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
			connection.close();
		}
	}

	@Override
	public boolean checkIfExist(String jobId, String accountId) {
		if (connection.connect()) {
			String sql = "select * from `rankedlist` where `AccountId` = ? and `JobId` = ?";
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, accountId);
				stm.setString(2, jobId);
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				if (rs.next())
					return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return false;
			}
			connection.close();
		}
		return false;
	}

	@Override
	public String countJobRated(String userId) {
		String sql = "SELECT COUNT(*) as NumRate FROM `rankedlist` WHERE rankedlist.AccountId = ? AND Rating > 0";
		if(connection.connect()){
			try {
				PreparedStatement stm = connection.getConnection()
						.prepareStatement(sql);
				stm.setString(1, userId);				
				connection.setPrepareStatement(stm);
				ResultSet rs = connection.readSecure();
				if(rs.next())
					return rs.getString("NumRate");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();

			}
			connection.close();
		}
		return "0";
	}

}
