package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Type {
	String id = "";
	String name = "";

	public static ArrayList<Type> getall(User user) {
		PreparedStatement stnt = null;
		ResultSet rs = null;
		// TODO Auto-generated method stub
		ArrayList<Type> allType = new ArrayList<Type>();
		String all = "select * from arch.Type";
		try {
			stnt = user.getConnection().prepareStatement(all);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs = stnt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			while (rs.next()) {
				Type tmpType = new Type();
				tmpType.setId(String.valueOf(rs.getInt("id")));
				tmpType.setName(rs.getString("name"));
				allType.add(tmpType);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
