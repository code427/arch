package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MysqlConnection {
	
	
	public static Connection getFBconnection(String database)  {
		try {
			return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/"+database,"root","1@9)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
