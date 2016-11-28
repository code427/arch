package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;

import database.Encrypt;
import database.MysqlConnection;


public class User {
	
	String level="";	 //0 professor 1 student 2 other
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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
				System.out.println("checking password: "+ Encrypt.hash(password)+"db pass "+rs.getString("password"));
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
	
	public int createuser(User createu) throws SQLException {
		String sql = "insert into arch.user (name,password,level) values(?,?,?)";
		PreparedStatement stnt = null;
		try {
			stnt = this.getConnection().prepareStatement(sql);
		} catch (SQLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
		try {
			stnt.setString(1, createu.getUsername());
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			stnt.setString(2, Encrypt.hash(createu.getPassword()));
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		stnt.setString(3, createu.getLevel());
	
		System.out.println(stnt.toString());
		try {
			if (stnt.execute() == false) {
				
				return 0;
			}
		} catch (SQLException e) {
			if (e.getErrorCode() == 1062) {
				System.out.println("got duplicate key exception");

				return 2;
			}
			e.printStackTrace();
		}
		return 1;
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

	public void logout() {

		
		try {
			this.connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	this.id=null;
	this.address=null;
	this.school=null;
	this.name=null;
	this.email=null;
	this.level=null;
	this.telephone=null;
	this.zip=null;
		// TODO Auto-generated method stub
		
	}
}
