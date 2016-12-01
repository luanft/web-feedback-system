package wfs.l2t.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import wfs.l2t.dto.dtoAccount;

import wfs.l2t.dto.dtoCare;

public class DAOAccount extends DAO {

	public DAOAccount() {
		super();

	}

	public int getTotalAccount() {
		String sql = "SELECT count(*) as `Amount` FROM `account`";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			if (rs != null) {
				try {
					rs.next();
					return rs.getInt("Amount");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
		return 0;
	}

	
	public List<dtoAccount> getAccountByEmail(String email) {
		dtoAccount account = null;
		List<dtoAccount> listAccount = new ArrayList<dtoAccount>();
		String sql = "SELECT `AccountId`, `UserName`, `Password` , `Email`, `TimeReceiveEmail`, `NumberReceiveEmail` FROM `account` where `Email`='"+email+"'";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					account = new dtoAccount();
					account.accountId = rs.getString("AccountId");
					account.userName = rs.getString("Username");
					account.email = rs.getString("Email");
					account.password = rs.getString("Password");
					account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
					account.numberReceiveEmail = rs
							.getInt("NumberReceiveEmail");
					listAccount.add(account);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return listAccount;
	}
		
	public List<dtoAccount> getAllAccount() {
		dtoAccount account = null;
		List<dtoAccount> listAccount = new ArrayList<dtoAccount>();
		String sql = "SELECT `AccountId`, `UserName`, `Password` , `Email`, `TimeReceiveEmail`, `NumberReceiveEmail` FROM `account`";
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					account = new dtoAccount();
					account.accountId = rs.getString("AccountId");
					account.userName = rs.getString("Username");
					account.email = rs.getString("Email");
					account.password = rs.getString("Password");
					account.timeReceiveEmail = rs.getString("TimeReceiveEmail");
					account.numberReceiveEmail = rs
							.getInt("NumberReceiveEmail");
					listAccount.add(account);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}
		return listAccount;
	}

	public List<dtoCare> getUserCareCatogory(String userId) {
		List<dtoCare> careList = new ArrayList<dtoCare>();
		dtoCare care = null;
		String sql = "SELECT `CategoryId`, `AccountId` FROM `care` WHERE `AccountId` = "
				+ userId;
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			try {
				while (rs.next()) {
					care = new dtoCare();
					care.accountId = rs.getString("AccountId");
					care.categoryId = rs.getString("CategoryId");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			this.connection.close();
		}

		return careList;
	}
}
