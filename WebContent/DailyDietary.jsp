<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="CS542">
    <meta name="keywords" content="Abuse,Report,DDS">
    <title>Healthy Food Control System</title>
    <link rel="shortcut icon" href="img/icon.jpg">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
  </head>
  <body>
  <!------------------------------------------- Navigation Bar -------------------------------------------------------------->
	<%@page import = "bean.*, java.util.List, java.sql.Date,java.util.Calendar" %>
	<%User user = (User)session.getAttribute("user"); %>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
      	<div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="HomePage.jsp">Healthy Food Control System</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
        	<li class="dropdown">
          	  <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><span class="glyphicon glyphicon-user"></span>Hi, <%=user.getUserFirstName() %><b class="caret"></b></a>
          	  <ul class="dropdown-menu">
                <li><a href="index.jsp">Log Out</a></li>
              </ul>
            </li>
          </ul>
          <ul class="nav navbar-nav">
           <li><a href="HomePage.jsp">User Info</a></li>
            <li><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=search") %>">Search Food Info</a></li>
			<li><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dietaryfood") %>">Daily Dietary</a></li>
            <li><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=trend") %>">Trend</a></li>
            
          </ul>

        </div><!--/.nav-collapse -->
      </div>
    </div>  
  <!------------------------------------------- Nevigation Bar End-------------------------------------------------------------->
     <%List<FoodInfo> listOfDietaryFood = (List<FoodInfo>)request.getAttribute("listOfDietaryFood"); %>
     <div class="container" style="padding-top:80px">
	  <div class="container">
		<div class="row">
          <div class="col-xs-6" style="padding:0px">
            <h3 class="text-left">
                User Daily Dietary
            </h3> 
          </div>
        </div>
		<div class="row">
      	  <form class="form-horizontal"  method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=doupdate") %>">
			<fieldset>
			
				<legend>Choose Date (Current Date: <%=request.getAttribute("date") %>) </legend><!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="date">Select Date</label>  
				  <div class="col-md-4">
				  <input id="date" name="date" type="text" placeholder="yyyy-mm-dd" class="form-control input-md"></input>
				  </div>
				  <input id="submit" type="submit" value= "update" class="btn btn-success" > </input>
				</div>
				
				
				<legend>Daily Dietary</legend>
				<%if(listOfDietaryFood.size()!=0){ %>
				<div class="row">
        <div id="no-more-tables">
            <table class="col-md-12 table-bordered table-striped table-condensed cf" style="padding:0px; width: 100%;">
        		<thead class="cf">
        			<tr>
        				<th>Food Name</th>
        				<th>Food Catalog</th>
        				<th>Calorie/100g</th>
        				<th>Fat/100g</th>
        				<th>Protein/100g</th>
        				<th>Carbonhydrate/100g</th>
        				<th>Fiber/100g</th>
        				<th>Ash/100g</th>
        				<th>Sugar/100g</th>
        				<th>Water/100g</th>
        				<th>Calcium(mg)/100g</th>
        				<th>Amount (unit: g)</th>
        				<th>Date</th>
        				
        			</tr>
        		</thead>
        		<tbody>
        		<%for(FoodInfo food : listOfDietaryFood){ %>
        			<tr>
        				<td data-title="Food Name"><%=food.getFoodName() %></td>
        				<td data-title="Food Catalog"><%=food.getCatalog() %></td>
        				<td data-title="Calorie/100g"><%=food.getCalorie() %></td>
        				<td data-title="Fat/100g"><%=food.getFat() %></td>
        				<td data-title="Protein/100g"><%=food.getProtein() %></td>
        				<td data-title="Carbonhydrate/100g"><%=food.getCarbhy() %></td>
        				<td data-title="Fiber/100g"><%=food.getFiber() %></td>
        				<td data-title="Ash/100g"><%=food.getAsh()%></td>
        				<td data-title="Sugar/100g"><%=food.getSugar() %></td>
        				<td data-title="Water/100g"><%=food.getWater()%></td>
        				<td data-title="Calcium(mg)/100g"><%=food.getCalcium()%></td>
        				<td data-title="Amount(unit: g)"><%=food.getAmount()%></td>
        				<td data-title="Date"><%=food.getDate() %></td>
        			</tr><%} %>
        			    </tbody>
        			    </table>    			
			<%}else if(listOfDietaryFood.size()==0){ %>
			<p><font color="red" >No Result Found On This Day, Please Change Another Day</font></p>
			<%} %>
			</fieldset>
			</form>
		</div>
   	 </div> 
   </div> 
    
    
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>