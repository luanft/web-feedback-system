package wfs.l2t.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.PreparedStatement;

import wfs.l2t.dto.dtoAccount;

public class ModelAccount extends Model {
	public ModelAccount() {
		super();
	}

	public dtoAccount getAccount(String email) {
		dtoAccount account = new dtoAccount();
		String sql = "select * from `account` where `Email` = '" + email + "'";
		connection.connect();
		ResultSet rs = connection.read(sql);
		try {
			if (rs.next() != false) {
				account.accountId = rs.getString("AccountId");
				account.userName = rs.getString("Username");
				account.email = rs.getString("Email");
				account.password = rs.getString("Password");
				account.accountType = rs.getString("AccountType");
				account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
				account.numberReceiveEmail = rs.getString("NumberReceiveEmail");
				account.isActive = rs.getBoolean("IsActive");
			}
			else return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		connection.close();
		return account;
	}

	public void addAccount(dtoAccount account) {
		// String sql =
		// "insert into `account` (`UserName`, `Email`, `Password`, `AccountType`, `TimeReceiveEmail`, `NumberReceiveEmail`) values ('"
		// + account.userName + "','" + account.email + "','" + account.password
		// + "','" + account.accountType + "','" + account.timeReceiveEmail +
		// "','" + account.numberReceiveEmail + "')";
		// connection.connect();
		// connection.write(sql);
		// connection.close();

		String sql = "insert into `account` (`UserName`, `Email`, `Password`, `AccountType`, `TimeReceiveEmail`, `NumberReceiveEmail`, `IsActive`) values (?,?,?,?,?,?,?)";
		connection.connect();
		try {
			PreparedStatement stm = (PreparedStatement) connection
					.getConnection().prepareStatement(sql);
			stm.setString(1, account.userName);
			stm.setString(2, account.email);
			stm.setString(3, account.password);
			stm.setString(4, account.accountType);
			stm.setString(5, account.timeReceiveEmail);
			stm.setString(6, account.numberReceiveEmail);			
			stm.setInt(7, 0);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
