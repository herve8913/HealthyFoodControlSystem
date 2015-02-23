package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class TrendValue {

	private int calorieTotal;
	private Date date;
	private String comment;
	private Connection conn;
	
	public TrendValue(int calorieTotal, Date date, String comment, Connection conn){
		this.calorieTotal = calorieTotal;
		this.date = date;
		this.comment = comment;
		this.conn = conn;
	}
	
	
	
	public int getCalorieTotal() {
		return calorieTotal;
	}



	public void setCalorieTotal(int calorieTotal) {
		this.calorieTotal = calorieTotal;
	}



	public Date getDate() {
		return date;
	}



	public void setDate(Date date) {
		this.date = date;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}



	public static List<TrendValue> getTrend(int userId, Connection conn){
		List<TrendValue> listOfTrend = new LinkedList<TrendValue>();
		String sql = "SELECT SUM(calorie*amount/100)  AS calorie_per_day , date FROM recipe_food WHERE user_id=? GROUP BY date";
		
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userId);
			
			ResultSet rs = stmt.executeQuery();
			while (rs.next()){
				int calorieTotal = rs.getInt("calorie_per_day");
				Date date = rs.getDate("date");
				String comment = "";
				if (calorieTotal>1757){
					comment="you ate too much";
				}else if (calorieTotal < 1757){
					comment = "you have a good control on food";
				}
				
				TrendValue trendValue = new TrendValue(calorieTotal,date,comment,conn);
				listOfTrend.add(trendValue);
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return listOfTrend;
	}
}
