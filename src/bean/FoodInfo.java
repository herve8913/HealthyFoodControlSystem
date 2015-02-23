package bean;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

public class FoodInfo {

	private int foodId;
	private String userName;
	private String foodName;
	private String catalog;
	private int calorie;
	private int fat;
	private int protein;
	private int carbhy;
	private int fiber;
	private int water;
	private int sugar;
	private Date date;
	private int amount;
	private int ash;
	private int calcium;
	private Connection conn;
	
	public FoodInfo(int foodId, String foodName, String catalog, int calorie, int fat, int protein, int carbhy, int fiber, int water, int sugar, Date date, int ash, int calcium, int amount){
		this.foodId = foodId;
		this.foodName = foodName;
		this.catalog = catalog;
		this.calorie = calorie;
		this.fat = fat;
		this.protein = protein;
		this.carbhy = carbhy;
		this.fiber = fiber;
		this.water = water; 
		this.sugar = sugar;
		this.date = date;
		this.ash = ash;
		this.calcium = calcium;
		this.amount = amount;
	}
	
	public FoodInfo(int foodId, String foodName, String catalog, int calorie, int fat, int protein, int carbhy, int fiber, int water, int sugar, int ash, int calcium){
		this.foodId = foodId;
		this.foodName = foodName;
		this.catalog = catalog;
		this.calorie = calorie;
		this.fat = fat;
		this.protein = protein;
		this.carbhy = carbhy;
		this.fiber = fiber;
		this.water = water;
		this.sugar = sugar;
		this.ash = ash;
		this.calcium = calcium;
	}
	
	
	
	public int getAmount(){
		return amount;
	}
	public int getFoodId() {
		return foodId;
	}

	public void setFoodId(int foodId) {
		this.foodId = foodId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public String getCatalog() {
		return catalog;
	}

	public void setCatalog(String catalog) {
		this.catalog = catalog;
	}

	public int getCalorie() {
		return calorie;
	}

	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}

	public int getFat() {
		return fat;
	}

	public void setFat(int fat) {
		this.fat = fat;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getCarbhy() {
		return carbhy;
	}

	public void setCarbhy(int carbhy) {
		this.carbhy = carbhy;
	}

	public int getFiber() {
		return fiber;
	}

	public void setFiber(int fiber) {
		this.fiber = fiber;
	}

	public int getWater() {
		return water;
	}

	public void setWater(int water) {
		this.water = water;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public int getAsh() {
		return ash;
	}

	public void setAsh(int ash) {
		this.ash = ash;
	}

	public int getCalcium() {
		return calcium;
	}

	public void setCalcium(int calcium) {
		this.calcium = calcium;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public static List<FoodInfo> getDietary(Connection conn, int userId, Date date){
		List<FoodInfo> listOfFood = new LinkedList<FoodInfo>();
		String sql="SELECT * FROM recipe_food WHERE user_id= ? AND date=?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, userId);
			stmt.setDate(2, date);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				int foodId = rs.getInt("food_id");
				String foodName = rs.getString("food_name");
				String catalog = rs.getString("catalog");
				int calorie = rs.getInt("calorie");
				int fat = rs.getInt("fat");
				int protein = rs.getInt("protein");
				int carbhy = rs.getInt("carbhy");
				int fiber = rs.getInt("fiber");
				int water =rs.getInt("water");
				int sugar = rs.getInt("sugar");
				int ash = rs.getInt("ash");
				int calcium = rs.getInt("calcium");
				int amount = rs.getInt("amount");
				FoodInfo foodInfo = new FoodInfo(foodId, foodName, catalog, calorie, fat, protein, carbhy,fiber, water, sugar, date, ash, calcium, amount);
				
				listOfFood.add(foodInfo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return listOfFood;
	}
	
	public static List<FoodInfo> search(Connection conn, String foodName, int foodCatalogId, int calorieMax, int calorieMin){
		List<FoodInfo> listOfFood = new LinkedList<FoodInfo>();
		String sql="SELECT * FROM food_and_catalog WHERE food_name LIKE ? AND catalog_id=? AND (calorie BETWEEN ? AND ?)";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+foodName+"%");
			stmt.setInt(2, foodCatalogId);
			stmt.setInt(3, calorieMin);
			stmt.setInt(4, calorieMax);
			ResultSet rs = stmt.executeQuery();
			
			while(rs.next()){
				int foodId = rs.getInt("food_id");
				String foodRealName = rs.getString("food_name");
				int calorie = rs.getInt("calorie");
				int fat = rs.getInt("fat");
				int protein = rs.getInt("protein");
				int carbhy = rs.getInt("carbhy");
				int fiber = rs.getInt("fiber");
				int water =rs.getInt("water");
				int sugar = rs.getInt("sugar");
				int ash = rs.getInt("ash");
				int calcium = rs.getInt("calcium");
				
				String catalog = rs.getString("catalog_name");
				FoodInfo foodInfo = new FoodInfo( foodId, foodRealName, catalog, calorie, fat, protein, carbhy,fiber, water, sugar, ash, calcium);
				
				listOfFood.add(foodInfo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return listOfFood;
	}
	
	
	
}
