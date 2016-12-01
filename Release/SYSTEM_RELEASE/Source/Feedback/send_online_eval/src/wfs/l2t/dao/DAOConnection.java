package wfs.l2t.dao;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAOConnection {

	public static String mysqlHost = "";
	public static String userName = "";
	public static String password = "";
	private Connection connection = null;
	private PreparedStatement preStatement = null;

	public static boolean init() {
		try {
			FileReader reader = new FileReader("mysql_config.txt");
			BufferedReader in = new BufferedReader(reader);
			mysqlHost = in.readLine();
			userName = in.readLine();
			password = in.readLine();
			password = password == null ? "" : password;
			in.close();			
			return true;
		} catch (IOException e) {
			return false;
		}
	}

	public DAOConnection() {
		
	}

	public Connection getConnection() {
		return connection;
	}

	public PreparedStatement getPrepareStatement() {
		return preStatement;
	}

	public void setPrepareStatement(PreparedStatement pre) {
		this.preStatement = pre;
	}

	public Boolean connect() {
		try {
			// chọn driver
			Class.forName("com.mysql.jdbc.Driver");
			// tao kết nối xuống database
			connection = DriverManager.getConnection(DAOConnection.mysqlHost, DAOConnection.userName,
					DAOConnection.password);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			return false;
		}
		return true;
	}

	
	
	public ResultSet read(String sql) {
		ResultSet data = null;
		try {
			java.sql.Statement cmd = connection.createStatement();
			data = cmd.executeQuery(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			// TODO Auto-generated catch block
		}
		return data;
	}

	public ResultSet readSecure() {
		ResultSet data = null;
		try {
			data = preStatement.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

	public Boolean write(String sql) {
		try {
			java.sql.Statement cmd = connection.createStatement();
			return cmd.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public Boolean writeSecure() {
		try {
			this.preStatement.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public void close() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
