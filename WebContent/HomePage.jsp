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
          <a id="logo" class="navbar-brand" href="HomePage.jsp">Healthy Food Control</a>
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
    <div class="container" style="padding-top:80px">
<div class="container">
    <div class="row">
        <div class="col-md-12 col-xs-6" style="padding:0px">
            <legend><h3 class="text-left">
                Hello, <%=user.getUserFirstName() %>
            </h3></legend>
        </div>
       
      </div>
      <div class="panel panel-success">
		
		<div class="panel-heading"><p>General Information</p></div>
	  	<div class="panel-body">
    			<p>Account: <%=user.getUserName() %></p>
				<p>Name: <%=user.getUserFirstName() %>  <%=user.getUserLastName() %></p>
				<p>Gender: <%=user.getGender() %></p>
				<p>Address: <%=user.getAddress() %></p>
				<p>Daytime telephone: <%=user.getPhone() %></p>
  		</div>
	  
	  </div>
      
</div>  
    </div> 
    
    
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>