package object;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

public class Context {
	
	String id="";
	String Name="";

	public static ArrayList<Context> getall(User user) {
		PreparedStatement stnt=null;
		ResultSet rs=null;
		// TODO Auto-generated method stub
		ArrayList<Context> allContext=new ArrayList<Context>();
		String all= "select * from arch.context";
		try {
			stnt = user.getConnection().prepareStatement(all);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			rs=stnt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			while(rs.next()){
				Context tmpContext=new Context();
				tmpContext.setId(String.valueOf(rs.getInt("id")));
				tmpContext.setName(rs.getString("name"));
				allContext.add(tmpContext);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return allContext;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public static HashMap<String,String> getOne(User user) {
		HashMap<String,String> hmap=new HashMap<String,String>();
		String getColumn="describe context ";
		PreparedStatement stnt = null;
		ResultSet rs=null;
		
		try {
			stnt=user.getConnection().prepareStatement(getColumn);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			rs=stnt.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			while (rs.next()){
				hmap.put(rs.getString("Field"), "");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// TODO Auto-generated method stub
		return hmap;
	}

	private HashMap<String,String> getOne(String id) {
		HashMap<String,String> hmap=new HashMap<String,String>();
		
		// TODO Auto-generated method stub
		return hmap;
	}
}
