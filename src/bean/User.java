package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {

	private int id;
	private String userName;
	private String userFirstName;
	private String userLastName;
	private String password;
	private String gender;
	private String phone;
	private String address;
	private String zipcode;
	private Connection conn;
	
	public User(String userName, String password, String gender, String phone,
			String address, String zipcode, Connection conn, String userFirstName, String userLastName) {
		this.userName = userName;
		this.password = password;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.zipcode = zipcode;
		this.conn = conn;
		this.userFirstName = userFirstName;
		this.userLastName = userLastName;
	}
	
	public User(String userName, String password, Connection conn){
		this.userName = userName;
		this.password = password;
		this.conn = conn;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	public int getId(){
		return id;
	}
	
	public String getUserFirstName() {
		return userFirstName;
	}

	public void setUserFirstName(String userFirstName) {
		this.userFirstName = userFirstName;
	}

	public String getUserLastName() {
		return userLastName;
	}

	public void setUserLastName(String userLastName) {
		this.userLastName = userLastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public void register(){
		
		String sql = "INSERT INTO user_account(username, password, gender, phone_number, address, zipcode, firstname, lastname) VALUES(?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, userName);
			stmt.setString(2, password);
			stmt.setString(3, gender);
			stmt.setString(4, phone);
			stmt.setString(5, address);
			stmt.setString(6, zipcode);
			stmt.setString(7, userFirstName);
			stmt.setString(8, userLastName);
			stmt.executeUpdate();
			
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public boolean login(){
		
		String sql = "SELECT * FROM user_account WHERE username = ? AND password = ?";
		PreparedStatement stmt;
		try {
			stmt = conn.prepareStatement(sql);

			stmt.setString(1, userName);
			stmt.setString(2, password);
			
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()){
				setAddress(rs.getString("address"));
				String gender1 = rs.getString("gender");
				String gender=null;
				if (gender1.equals("M")){
					gender="Male";
				}else if (gender1.equals("F")){
					gender= "Female";
				}
				
				setGender(gender);
				setId(rs.getInt("user_id"));
				setPhone(rs.getString("phone_number"));
				setZipcode(rs.getString("zipcode"));
				setUserFirstName(rs.getString("firstname"));
				setUserLastName(rs.getString("lastname"));
				return true;
			}
			
			rs.close();
			stmt.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
}
