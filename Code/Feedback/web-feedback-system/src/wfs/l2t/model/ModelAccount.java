package wfs.l2t.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import wfs.l2t.dto.dtoAccount;

public class ModelAccount extends Model
{
	public ModelAccount()
	{
		super();
	}

	public dtoAccount getAccount(String email)
	{
		dtoAccount account = new dtoAccount();
		String sql = "select * from `account` where `Email` = ?";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, email);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try
			{
				if (rs.next() != false)
				{
					account.accountId = rs.getString("AccountId");
					account.userName = rs.getString("Username");
					account.email = rs.getString("Email");
					account.password = rs.getString("Password");
					account.accountType = rs.getString("AccountType");
					account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
					account.numberReceiveEmail = rs.getString("NumberReceiveEmail");
					account.isActive = rs.getBoolean("IsActive");
					account.confirmCode = rs.getString("ConfirmCode");
					account.avatar = rs.getString("Avatar");
				} else
					return null;
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		connection.close();
		return account;
	}

	public boolean checkConfirmCode(String code)
	{
		String sql = "select * from `account` where `ConfirmCode` = ?";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, code);
			connection.setPrepareStatement(stm);
			ResultSet rs = connection.readSecure();
			try
			{
				if (rs.next() == false)
					return false;
			} catch (SQLException e)
			{
				e.printStackTrace();
			}
		} catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		connection.close();
		return true;
	}

	public void updateActivation(int status)
	{
		String sql = "update `account` set `IsActive` = ?";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setInt(1, status);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
		} catch (SQLException e1)
		{
			e1.printStackTrace();
		}
		connection.close();
	}

	public void addAccount(dtoAccount account)
	{
		String sql = "insert into `account` (`UserName`, `Email`, `Password`, `AccountType`, `TimeReceiveEmail`, `NumberReceiveEmail`, `IsActive`,`ConfirmCode`,`Avatar`) values (?,?,?,?,?,?,?,?,?)";
		connection.connect();
		try
		{
			PreparedStatement stm = connection.getConnection().prepareStatement(sql);
			stm.setString(1, account.userName);
			stm.setString(2, account.email);
			stm.setString(3, account.password);
			stm.setString(4, account.accountType);
			stm.setString(5, account.timeReceiveEmail);
			stm.setString(6, account.numberReceiveEmail);
			stm.setInt(7, 0);
			stm.setString(8, account.confirmCode);
			stm.setString(9, account.avatar);
			connection.setPrepareStatement(stm);
			connection.writeSecure();
			connection.close();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

	public dtoAccount getAccountById(String id)
	{
		dtoAccount account = new dtoAccount();
		String sql = "select * from `account` where `AccountId` = " + id;
		if (this.connection.connect())
		{
			ResultSet rs = this.connection.read(sql);
			try
			{
				rs.next();
				account.accountId = rs.getString("AccountId");
				account.userName = rs.getString("Username");
				account.email = rs.getString("Email");
				account.password = rs.getString("Password");
				account.accountType = rs.getString("AccountType");
				account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
				account.numberReceiveEmail = rs.getString("NumberReceiveEmail");
				account.confirmCode = rs.getString("ConfirmCode");
				account.avatar = rs.getString("Avatar");
			} catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return account;
	}

	public Boolean setReceiveEmailTime(String userId, String time)
	{
		if (this.connection.connect())
		{
			String sql = "UPDATE `account` SET `TimeReceiveEmail`='" + time + "' WHERE `AccountId`=" + userId;
			Boolean rs = this.connection.write(sql);
			this.connection.close();
			return rs;
		}
		return false;
	}

	public Boolean setReceiveEmailNumber(String userId, String number)
	{
		if (this.connection.connect())
		{
			String sql = "UPDATE `account` SET `NumberReceiveEmail`='" + number + "' WHERE `AccountId`=" + userId;
			Boolean rs = this.connection.write(sql);
			this.connection.close();
			return rs;
		}
		return false;
	}

}
