package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import bean.FoodCatalog;
import bean.FoodInfo;
import bean.TrendValue;
import bean.User;
import bean.UserRecipe;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;
	private HttpSession session;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String action = request.getParameter("action");
		if(action==null){
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		else if(action.equals("signup")){
			request.getRequestDispatcher("/SignUp.jsp").forward(request, response);
		}else if (action.equals("search")){
			Connection conn=null;
			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/healthyfood", "root", "891300");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			List<FoodCatalog> listOfCatalog = FoodCatalog.getCatalog(conn);
			request.setAttribute("listOfCatalog", listOfCatalog);
			request.getRequestDispatcher("/Search.jsp").forward(request, response);
			
		}else if (action.equals("dietaryfood")){
			Connection conn=null;
			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/healthyfood", "root", "891300");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			User currentUser = (User) session.getAttribute("user");
			Calendar calendar = Calendar.getInstance();
			Date date = new Date(calendar.getTime().getTime());
			List<FoodInfo> listOfDietaryFood = FoodInfo.getDietary(conn, currentUser.getId(), date);
			request.setAttribute("date", date);
			request.setAttribute("listOfDietaryFood", listOfDietaryFood);
			request.getRequestDispatcher("/DailyDietary.jsp").forward(request, response);
			
		}else if(action.equals("trend")){
			User currentUser = (User)session.getAttribute("user");
			Connection conn=null;
			try {
				conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/healthyfood", "root", "891300");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			};
			List<TrendValue> listOfTrend = TrendValue.getTrend(currentUser.getId(), conn);
			int averageCalorie=0;
			for (int i=0;i<listOfTrend.size();i++){
				averageCalorie+= listOfTrend.get(i).getCalorieTotal();
			}
			averageCalorie = averageCalorie/listOfTrend.size();
			request.setAttribute("averageCalorie", averageCalorie);
			request.setAttribute("listOfTrend", listOfTrend);
			request.getRequestDispatcher("/Trend.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		session= request.getSession();
		String action = request.getParameter("action");
		
		if(action==null){
			out.println("unrecognized action");
		} 
		
		Connection conn=null;
		try {
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/healthyfood", "root", "891300");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		};
		
		if (action.equals("dosignup")){
			String userName= request.getParameter("username");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String phone = request.getParameter("phone");
			String address= request.getParameter("address");
			String zipCode = request.getParameter("zipcode");
			String userFirstName = request.getParameter("firstname");
			String userLastName = request.getParameter("lastname");
			
			User newUser= new User(userName, password, gender, phone, address, zipCode, conn, userFirstName, userLastName);
			newUser.register();
			request.setAttribute("message", "Sign Up Successfully, Please Login with your new account");
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			
		}else if (action.equals("dologin")){
			String userName = request.getParameter("username");
			String password =request.getParameter("password");
			
			System.out.println(userName+" "+password);
			User user = new User(userName, password, conn);
			if(user.login()){
				session.setAttribute("user", user);
				request.getRequestDispatcher("/HomePage.jsp").forward(request, response);
				
			}else{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
		}else if (action.equals("doupdate")){
			Date date = Date.valueOf(request.getParameter("date"));
			User currentUser = (User)session.getAttribute("user");
			List<FoodInfo> listOfDietaryFood = FoodInfo.getDietary(conn, currentUser.getId(), date);
			request.setAttribute("listOfDietaryFood", listOfDietaryFood);
			request.setAttribute("date", date);
			request.getRequestDispatcher("/DailyDietary.jsp").forward(request, response);
			
		}else if(action.equals("dosearch")){
			String foodName = request.getParameter("foodname");
			int foodCatalogId = Integer.parseInt(request.getParameter("foodcatalog"));
			int calorieMin=Integer.parseInt(request.getParameter("caloriemin"));
			int calorieMax=Integer.parseInt(request.getParameter("caloriemax"));
			List<FoodInfo> listOfSearchFood = FoodInfo.search(conn, foodName, foodCatalogId, calorieMax, calorieMin);
			request.setAttribute("listOfSearchFood", listOfSearchFood);
			request.getRequestDispatcher("/SearchResult.jsp").forward(request, response);
		}else if (action.equals("doinsert")){
			int foodId = Integer.parseInt(request.getParameter("foodid"));
			User user1 = (User)session.getAttribute("user");
			int userId = user1.getId();
			int amount=0;
			String[] list = request.getParameterValues("amount");
			for(String s:list){
				if(!s.equals("")){
					amount= Integer.parseInt(s);
				}
			}
			Calendar calendar = Calendar.getInstance();
			Date date = new Date(calendar.getTime().getTime());
			UserRecipe userRecipe = new UserRecipe(userId,foodId,date, amount, conn);
			System.out.println(userId+" "+foodId+" "+amount);
			
			userRecipe.insert();
			List<FoodInfo> listOfDietaryFood = FoodInfo.getDietary(conn, userId, date);
			request.setAttribute("listOfDietaryFood", listOfDietaryFood);
			request.setAttribute("date", date);
			request.getRequestDispatcher("/DailyDietary.jsp").forward(request, response);
			
			
		}
	}

}
