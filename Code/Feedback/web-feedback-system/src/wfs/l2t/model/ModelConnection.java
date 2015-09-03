package wfs.l2t.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ModelConnection {

	public final String mysqlHost = "jdbc:mysql://localhost:3306/recsys?useUnicode=true&characterEncoding=UTF-8";
	public final String userName = "root";
	public final String password = "";
	private Connection connection = null;

	public ModelConnection() {

	}

	public Boolean Connect() {
		try {
			//chọn driver
			Class.forName("com.mysql.jdbc.Driver");
			//tao kết nối xuống database
			connection = DriverManager.getConnection(mysqlHost, userName,
					password);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public ResultSet Read(String sql){
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

	public Boolean Write(String sql) {
		try {
			java.sql.Statement cmd = connection.createStatement();
			return cmd.execute(sql);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public void Close() {
		try {
			this.connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
