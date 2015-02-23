<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="CS509 Group1">
    <meta name="keywords" content="Abuse,Report,DDS">
    <title>Healthy Food Control System</title>
    <link rel="shortcut icon" href="img/icon.jpg">
    <!-- Bootstrap CSS-->
    <link rel="stylesheet" href="css/bootstrap.css">
  </head>
  <body class="login">
    <div class="container">    
        <div id="loginbox" style="margin-top:100px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div style="font-size:22px"><img src="img/logo.jpg"  class="img-circle">&nbsp;Healthy Food Control System</div>
                    </div>     
                    <div style="padding-top:10px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form" method="post" action="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=dologin") %>">
                            <div class="input-group panel-title" style="margin-bottom: 10px">Sign in</div>
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control" name="username" value="" placeholder="username">                                        
                                    </div>   
                            <div style="margin-bottom: 10px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password">
                                    </div>                             
                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->
                                    <div class="col-sm-12 controls" >
                                      <input id="btn-login" type="submit" value="Log in" class="btn btn-success"></input>
									  <a class="omb_forgotPwd" href="#" style="font-size:85%" onclick="$('#loginbox').hide();$('#getpasswordbox').show()">Forgot password?</a>
									  <div><a class="omb_forgotPwd" href="<%= response.encodeUrl(request.getContextPath() + "/Controller?action=signup") %>" style="font-size:85%" >Sign Up</a></div>
                                    </div>                                 				
								</div>
								   
                            </form>   
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
  </body>
</html>