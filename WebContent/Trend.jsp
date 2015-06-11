<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="CS542">
    <meta name="keywords" content="">
    <title>Healthy Food Control System</title>
    <link rel="shortcut icon" href="img/icon.jpg">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body>
  <!------------------------------------------- Navigation Bar -------------------------------------------------------------->
	<%@page import = "bean.*,java.util.List" %>
	<%User user = (User)session.getAttribute("user"); %>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
      	<div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="HomePage.jsp">Healthy Food Control</a>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
        	<li class="dropdown">
          	  <a href="#" class="dropdown-toggle" data-toggle="dropdown" ><span class="glyphicon glyphicon-user"></span>Hi, <%=user.getUserFirstName() %><b class="caret"></b></a>
          	  <ul class="dropdown-menu">
                <li><a href="<%= response.encodeUrl(request.getContextPath() + "/Controller") %>">Log Out</a></li>
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
     <%List<TrendValue> listOfTrend = (List<TrendValue>)request.getAttribute("listOfTrend");
     int averageCalorie = (Integer)request.getAttribute("averageCalorie");%>
     <div class="container" style="padding-top:80px">
	  <div class="container">
		<div class="row">
          <div class="col-md-12 col-xs-6" style="padding:0px">
            <legend><h3 class="text-left">
                User Dietary Trend
            </h3> </legend>
          </div>
        </div>
		<div class="row">
      	  <form class="form-horizontal">
			<fieldset>
				
				<div class="row">
        <div id="no-more-tables">
        <br/>
            <table class="col-md-12 table-bordered table-striped table-condensed cf" style="padding:0px; width: 100%;">
        		<thead class="cf">
        			<tr>
        				<th>Account</th>
        				<th>FirstName</th>
        				<th>LastName</th>
        				<th>Calorie from food /day</th>
        				<th>Date</th>
        			</tr>
        		</thead>
        		<tbody>
        			<%for(TrendValue trendValue : listOfTrend){ %><tr>
        				<td data-title="Account"><%=user.getUserName() %></td>
        				<td data-title="FirstName"><%=user.getUserFirstName() %></td>
        				<td data-title="LastName"><%=user.getUserLastName() %></td>
        				<td class="warning" data-title="Calorie from food /day"><%=trendValue.getCalorieTotal() %></td>
        				<td data-title="Date"><%=trendValue.getDate() %></td>
        			</tr><%} %>
        			        			
			</tbody>
			</table>
			</div>
			</div>
			</fieldset>
			</form>
		</div>
   	 </div> 
   </div> 
    
    
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>