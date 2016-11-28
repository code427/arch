package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Form {

	String id = "";
	String name = "";

	public static ArrayList<Form> getall(User user) {
		PreparedStatement stnt = null;
		ResultSet rs = null;
		// TODO Auto-generated method stub
		ArrayList<Form> allForm = new ArrayList<Form>();
		String all = "select * from arch.Form";
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
				Form tmpForm = new Form();
				tmpForm.setId(String.valueOf(rs.getInt("id")));
				tmpForm.setName(rs.getString("name"));
				allForm.add(tmpForm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return allForm;
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
