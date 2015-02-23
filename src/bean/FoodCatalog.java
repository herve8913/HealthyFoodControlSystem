package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class FoodCatalog {

	private int id;
	private String catalog;
	private Connection conn;
	
	public FoodCatalog(int id, String catalog, Connection conn){
		this.id = id;
		this.catalog = catalog;
		this.conn = conn;
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}



	public static List<FoodCatalog> getCatalog(Connection conn){
		List<FoodCatalog> listOfCatalog = new LinkedList<FoodCatalog>();
		String sql = "SELECT * FROM food_catalog ";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet rs= stmt.executeQuery();
			while(rs.next()){
				int id = rs.getInt("id");
				String catalog = rs.getString("name");
				FoodCatalog foodCatalog = new FoodCatalog(id, catalog, conn);
				listOfCatalog.add(foodCatalog);
			}
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return listOfCatalog;
	}
}
