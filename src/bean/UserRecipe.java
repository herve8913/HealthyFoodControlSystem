package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

public class UserRecipe {

	private int id;
	private int userId;
	private int foodId;
	private Date date;
	private int amount;
	private Connection conn;
	
	
	public UserRecipe(int userId, int foodId, Date date, int amount, Connection conn) {
		this.userId = userId;
		this.foodId = foodId;
		this.date = date;
		this.amount = amount;
		this.conn = conn;
	}
	
	public void insert(){
		String sql = "INSERT INTO user_recipe(user_id, food_id, amount, date) VALUES(?,?,?,?)";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setInt(2, foodId);
			stmt.setInt(3, amount);
			stmt.setDate(4, date);
			
			stmt.executeUpdate();
			
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
