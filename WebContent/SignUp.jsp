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
  <body class="login">
    <div class="container">    
        <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div style="font-size:22px"><img src="img/logo.jpg"  class="img-circle">&nbsp;Healthy Food Control</div>
                    </div>     
                    <div style="padding-top:10px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="signupform" class="form-horizontal" role="form" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dosignup") %>">
                        <div class="input-group panel-title" style="margin-bottom: 10px">Sign Up</div>
                            <!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="username">Username</label>  
				  <div class="col-md-4">
				  <input id="username" name="username" type="text" placeholder="username" class="form-control input-md" required>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="password">Password</label>  
				  <div class="col-md-4">
				  <input id="password" name="password" type="password" placeholder="password" class="form-control input-md" required>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="repeatpassword">Repeat Password</label>  
				  <div class="col-md-4">
				  <input id="repeatpassword" name="repeatpassword" type="password" placeholder="password" class="form-control input-md" required>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="firstname">Firstname</label>  
				  <div class="col-md-4">
				  <input id="firstname" name="firstname" type="text" placeholder="firstname" class="form-control input-md" required>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="lastname">Lastname</label>  
				  <div class="col-md-4">
				  <input id="lastname" name="lastname" type="text" placeholder="lastname" class="form-control input-md" required>
				  </div>
				</div>
				<!-- Multiple Radios (inline) -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="gender">Gender</label>
				  <div class="col-md-4"> 
				    <label class="radio-inline" for="radios-0">
				      <input type="radio" name="gender" id="radios-0" value="M">
				      Male
				    </label> 
				    <label class="radio-inline" for="radios-1">
				      <input type="radio" name="gender" id="radios-1" value="F">
				      Female
				    </label>
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="phone">Phone Number</label>  
				  <div class="col-md-4">
				  <input id="phone" name="phone" type="text" placeholder="phone number" class="form-control input-md">
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="address">Address</label>  
				  <div class="col-md-4">
				  <input id="address" name="address" type="text" placeholder="address" class="form-control input-md">
				  </div>
				</div>
				<!-- Text input-->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="zipcode">Zip Code</label>  
				  <div class="col-md-4">
				  <input id=""zipcode"" name="zipcode" type="text" placeholder="zipcode" class="form-control input-md">
				  </div>
				</div>
								 <!-- Button (Double) -->
				<div class="form-group">
				  <label class="col-md-4 control-label" for="save"></label>
				  <div class="col-md-8">
				    <input id="submit" name="submit" value="submit" type="submit" class="btn btn-success"></input>
				    <a href="index.jsp" id="cancel" name="cancel" class="btn btn-default">Cancel</a>
				    
				  </div>
				</div>  
                            </form>   
                        </div>                     
                    </div>  
        </div>
        							
                 
    </div>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
  </body>
</html>