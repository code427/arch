package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.mysql.jdbc.Connection;

import database.Encrypt;
import database.MysqlConnection;

public class User {
	
	String level="";	 //0 professor 1 student 2 other
	String name = "";
	String zip = "";
	String telephone = "";
	String email = "";
	String id = "";
	String school = "";
	String password = "";
	Connection	connection=null;
	String address = "";
	   
	public Integer login(String username, String password) throws SQLException {
		String sql = "select * from arch.user where name=?";

	Connection	conn = (Connection) MysqlConnection.getFBconnection("arch");
		if (conn != null) {
			PreparedStatement stnt = conn.prepareStatement(sql);
			stnt.setString(1, username);
			ResultSet rs = stnt.executeQuery();
			if (rs.next()) {

				if (rs.getString("password").equals(Encrypt.hash(password))) {
					System.out.println("passed");
					
					this.connection=conn;
					this.name = username;

					this.id = String.valueOf(rs.getInt("id"));
					if (rs.getString("school") != null) {
						school = rs.getString("school");
					}
					if (rs.getString("address") != null) {
						address = rs.getString("address");
					}
					if (rs.getString("zip") != null) {
						zip = rs.getString("zip");
					}
					if (rs.getString("telephone") != null) {

						telephone = rs.getString("telephone");
					}
					if (rs.getString("email") != null) {

						email = rs.getString("email");
					}
										

					level = String.valueOf(rs.getInt("level"));
					
					rs.close();
					
					return 0;

				}
				conn.close();
				rs.close();
				System.out.println("verificaton failed");
				// forward error
			}
			conn.close();
			// verification failed
			return 1;
		}
		// conn null
		return 3;

	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getUsername() {
		return name;
	}

	public void setUsername(String username) {
		this.name = username;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
