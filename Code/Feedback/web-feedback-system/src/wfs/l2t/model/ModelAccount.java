package wfs.l2t.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import wfs.l2t.dto.dtoAccount;

public class ModelAccount extends Model {
	public ModelAccount()
	{
		super();
	}
	
	public dtoAccount getAccount(String username)
	{
		dtoAccount account = new dtoAccount();
		String sql = "select * from `account` where Username = '" + username + "'";
		ResultSet rs = connection.read(sql);
		try {
			account.accountId = rs.getString("AccountId");
			account.userName = rs.getString("Username");
			account.email = rs.getString("Email");
			account.password = rs.getString("Password");
			account.accountType = rs.getString("AccountType");
			account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
			account.numberReceiveEmail = rs.getString("NumberReceiveEmail");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return account;
	}
	
	public void addAccount(dtoAccount account)
	{
		String sql = "insert into `account` values ('" + account.userName + "','" + account.email + "','" + account.password + "','" + account.accountType + "','" + account.timeReceiveEmail + "','" + account.numberReceiveEmail + "')";
		connection.write(sql);
	}
}
