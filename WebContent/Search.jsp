<!DOCTYPE html>
<html lang="en">
  <head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- or use local jquery -->
<script src="/js/jqBootstrapValidation.js"></script>
<script>
  $(function () { $("input,select,textarea").not("[type=submit]").jqBootstrapValidation(); } );
</script>
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
	<%@page import = "bean.*" %>
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
     <%@page import="java.util.List,bean.*" %>
     <%List<FoodCatalog> listOfCatalog = (List<FoodCatalog>)request.getAttribute("listOfCatalog"); %>
     <div class="container" style="padding-top:80px">
	  <div class="container">
		<div class="row">
          <div class="col-xs-6" style="padding:0px">
            <h3 class="text-left">
                New Food Search
            </h3> 
          </div>
        </div>
		<div class="row">
      	  <form class="form-horizontal" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dosearch") %>">
			<fieldset>
			<legend>Food Information</legend>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="foodname">Food Name</label>  
				  <div class="col-md-4">
				  <input id="foodname" name="foodname" type="text" placeholder="foodname" class="form-control input-md" required>
				    
				  </div>
				</div>
				
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="calorierange">Calorie Range</label>  
				  <div class="col-md-4">
				  From: <input id="caloriemin" name="caloriemin" type="text" placeholder="minimum calorie (0~9999)" value="0" class="form-control input-md" required>
				  To: <input id="caloriemax" name="caloriemax" type="text" placeholder="maximum calorie (0~9999)" value="9999" class="form-control input-md" required>
				  </div>
				</div>
				
				<!-- Select Basic -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="selectbasic">Food Catalog</label>
				  <div class="col-md-4">
				    <select id="foodcatalog" name="foodcatalog" class="form-control">
				      <%for(FoodCatalog catalog:listOfCatalog){ %><option value="<%=catalog.getId()%>"><%=catalog.getCatalog() %></option><%} %>
				    </select>
				  </div>
				</div>
				
				<div class="form-group">
				  <label class="col-md-4 control-label" for="save"></label>
				  <div class="col-md-8">
				    <input  id="search" type="submit" name="search" value="Search" class="btn btn-success"></input>
				  </div>
				</div>
			
			</fieldset>
			</form>
		</div>
   	 </div> 
   </div> 
   
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>