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
	<%@page import = "bean.*, java.util.List" %>
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
     <%List<FoodInfo> listOfSearchFood = (List<FoodInfo>) request.getAttribute("listOfSearchFood"); %>
     <div class="container" style="padding-top:80px">
	  <div class="container">
		<div class="row">
          <div class="col-md-8 col-xs-6" style="padding:0px">
            <h3 class="text-left">
                Food Search Result
            </h3> 
          </div>
          <div class="col-md-4" style="padding:3px">
 			 <input id="filter" type="text" class="form-control" placeholder="Search..." >
		</div>
        </div>
		<div class="row">
		<fieldset>
			<legend>Food Information</legend>
			<div id = "sliding" class="alert alert-success" role="alert" style="display:none;">
			<p>Successfully Added to your recipe :)</p>
			</div>
				<%if(listOfSearchFood.size()!=0) {%>
            <table class="col-md-12 table-bordered table-striped table-condensed cf" style="padding:0px; width: 100%;">
        		<thead class="cf">
        			<tr>
        				<th>Add</th>
        				<th>Food Name</th>
        				<th>Food Catalog</th>
        				<th>Calorie /100g</th>
        				<th>Fat /100g</th>
        				<th>Protein /100g</th>
        				<th>Carbonhydrate /100g</th>
        				<th>Fiber /100g</th>
        				<th>Ash /100g</th>
        				<th>Sugar /100g</th>
        				<th>Water /100g</th>
        				<th>Calcium(mg) /100g</th>
        				<th>Amount <br/>(Unit:g)</th>
        			</tr>
        		</thead>
        		<tbody class="searchable">
        		<%for (FoodInfo food : listOfSearchFood){ %>
        			<tr>
        				<td data-title="Add"><button class="btn btn-primary" id="<%= food.getFoodId()%>" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add</button></td>
        				<td data-title="Food Name"><%=food.getFoodName() %></td>
        				<td data-title="Food Catalog"><%=food.getCatalog() %></td>
        				<td data-title="Calorie/100g"><%=food.getCalorie() %></td>
        				<td data-title="Fat/100g"><%=food.getFat() %></td>
        				<td data-title="Protein/100g"><%=food.getProtein() %></td>
        				<td data-title="Carbonhydrate/100g"><%=food.getCarbhy() %></td>
        				<td data-title="Fiber/100g"><%=food.getFiber() %></td>
        				<td data-title="Ash/100g"><%=food.getAsh()%></td>
        				<td data-title="Sugar/100g"><%=food.getSugar() %></td>
        				<td data-title="Water/100g"><%=food.getWater() %></td>
        				<td data-title="Calcium(mg)/100g"><%=food.getCalcium()%></td>
        				<td data-title="Amount (Unit:g)"><input type="text" id="amt<%=food.getFoodId() %>" name="amount" value="100" placeholder="amount (unit: g)" style="width:100%;"></td>
        			</tr><%} %>
        	   		</tbody>
      	     	</table>
      	     	</div>
      	     	<legend></legend>
				
		</fieldset>
   	 </div> 
   </div> <%} else if (listOfSearchFood.size()==0){%>
   <p><font color="red" size="16">No Result Found</font></p>
   <legend></legend>
    <%} %>
    
    <script src="js/jquery-1.11.0.js"></script>
    <script src="js/bootstrap.js"></script>
    <script>
    $(document).ready(function () {
    	$("#sliding").css("display", "none");
		
	    (function ($) {
	
	        $('#filter').keyup(function () {
	
	            var rex = new RegExp($(this).val(), 'i');
	            $('.searchable tr').hide();
	            $('.searchable tr').filter(function () {
	                return rex.test($(this).text());
	            }).show();
	
	        })
	
	    }(jQuery));
	
	});
    
    	<%for (FoodInfo food : listOfSearchFood){%>
    		$("#<%=food.getFoodId()%>").click(function(){
    			var value = $("#amt<%=food.getFoodId()%>").val();
    			$.post("<%= response.encodeUrl(request.getContextPath() + "/Controller") %>",{
    				action:"doinsert",
    				foodid:"<%=food.getFoodId()%>",
    				amount: value
    			},function(data){
    				$("#sliding").css("display", "none");
    				$("#sliding").slideDown();
    			});
    			
    		});
    	<%}%>
    </script>
  </body>
</html>