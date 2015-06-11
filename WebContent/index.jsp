<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="CS509 Group1">
    <meta name="keywords" content="">
    <title>Healthy Food Control System</title>
    <link rel="shortcut icon" href="img/icon.jpg">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
  </head>
  <body class="login">
  <!------------------------------------------- Navigation Bar -------------------------------------------------------------->
	<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand labelfont" href="#"> Healthy Food Control</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" role="form" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dologin") %>">
            <div class="form-group">
              <input type="text" placeholder="Username" class="form-control" name = "username" required>
            </div>
            <div class="form-group">
              <input type="password" placeholder="Password" class="form-control" name = "password" required>
            </div>
			<div class= "form-group">
				<input type="submit" class="btn btn-success" value = "Sign in"/>
			</div>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>  
  <!------------------------------------------- Nevigation Bar End-------------------------------------------------------------->
  <% String message = (String)request.getAttribute("message");%>
    <div class="jumbotron">
      <div class="container">
        <div class="row">
          <div class="col-md-6 col-md-offset-1">
            <h1>Healthy Food Control</h1>
            <p>A System Helping You Keep Healthy</p>
            <ul>
              <li> <span class="glyphicon glyphicon-ok"></span> Retrieve food nutrient information </li>
              <li> <span class="glyphicon glyphicon-ok"></span>Control your daily dietary</li>
              <li> <span class="glyphicon glyphicon-ok"></span>Track your dietary</li>
            </ul>
          </div>
          <div class="col-md-5">
			<p id="signupbtn"><a class="btn btn-success btn-lg" href="#" role="button" data-toggle = "modal" data-target="#myModal">Get Started Today </a></p>
          </div>
        </div>
      </div>
    </div>
    <%if(!message.equals("none")) {%>
    	<div id = "signupdone" class="alert alert-success" role="alert" style="margin:0;padding:0;">
			<p>Sign Up Successfully, Please Login with your new account</p>
		</div><%} %>
    
    <div class = "modal fade" id="myModal">
		<div class= "modal-dialog">
			<div class= "modal-content">
			
				<div class = "modal-header">
					<button class="close" data-dismiss = "modal">x</button>
					<h4 class= "modal-title">Sign Up</h4>
				</div>
				
				<div class="modal-body">
					<form id="signupForm" role="form" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dosignup") %>">
						<div class="form-group">
							<label for="username" class="control-label">Username</label>
							<input type="text" id="username" name="username" class= "form-control" placeholder="Username" required/>
						</div>
						<div class="form-group">
							<label for="password" class="control-label">Password</label>
							<input type="password" id="password" name="password" class= "form-control" placeholder="Password" required/>
						</div>
						<div class="form-group">
							<label for="repeatpassword" class="control-label">Repeat Password</label>
							<input type="password" id="repeatpassword" name="repeatpassword" class= "form-control" placeholder="Repeat Password" required/>
						</div>
						<div class="form-group">
							<label for="firstname" class="control-label">First Name</label>
							<input type="text" id="firstname" name="firstname" class= "form-control" placeholder="First Name" required/>
						</div>
						<div class="form-group">
							<label for="lastname" class="control-label">Last Name</label>
							<input type="text" id="lastname" name="lastname" class= "form-control" placeholder="Last Name" required/>
						</div>
						<div class= "form-group">
							<label class="control-label" for="gender">Gender</label>
				  
				    		<label class="radio-inline" for="radios-0">
				      		<input type="radio" name="gender" id="radios-0" value="M">
				      		Male
				    		</label> 
				    		<label class="radio-inline" for="radios-1">
				      		<input type="radio" name="gender" id="radios-1" value="F">
				      		Female
				    		</label>
				  		</div>
				  		<div class="form-group">
						  <label class="control-label" for="phone">Phone Number</label>
						  <input id="phone" name="phone" type="text" placeholder="phone number" class="form-control input-md">
						</div>
						<div class="form-group">
						  <label class="control-label" for="address">Address</label>  
						  <input id="address" name="address" type="text" placeholder="address" class="form-control input-md">
						</div>
						<div class="form-group">
						  <label class="control-label" for="zipcode">Zip Code</label>  
						  <input id=""zipcode"" name="zipcode" type="text" placeholder="zipcode" class="form-control input-md">
						</div>
						<div class="form-group row">
							<input id="signingup" type="submit" value="Sign Up" class="btn btn-success col-md-2 col-md-offset-9" />
						</div>
					</form>
				</div>
				
				
			
			</div>
		</div>
	  </div>
    
        							
        <div id="getpasswordbox" style="display:none; margin-top:100px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Get Password Back</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"></div>
                        </div>  
                        <div class="panel-body" >
                            <form id="signupform" class="form-horizontal" role="form">
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input type="text" class="form-control" name="email" placeholder="Email Address">
                                    </div>
                                </div>
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-send" type="button" class="btn btn-info"><i class="icon-hand-right"></i>Send</button>
                                        <button id="btn-cancel" type="button" class="btn btn-default" onclick="$('#getpasswordbox').hide(); $('#loginbox').show()"><i class="icon-hand-right"></i>Cancel</button>
                                    </div>
                                </div>
                            </form>
                         </div>
                    </div>  
         </div>         
    </div>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
    </script>
  </body>
</html>