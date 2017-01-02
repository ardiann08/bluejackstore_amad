<%@include file="../helper/connect.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<title>Bluejack Store</title>		
	<script type="text/javascript" src="source/js/jquery-3.1.1.js"></script>
	<script type="text/javascript" src="source/js/jquery-3.1.1.min.js"></script>
	<script type="text/javascript" src="source/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="source/bootstrap/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css" href="source/css/header.css">
	<link rel="stylesheet" type="text/css" href="source/css/style.css">
	<link rel="stylesheet" type="text/css" href="source/bootstrap/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="source/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.7.0/css/font-awesome.css">
	<link rel="stylesheet" type="text/css" href="source/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>

<div class="menu">
    <div class="container-fluid">
		<div class="navbar-header">
			<a href="#">Bluejack Store</a>
		</div>
		<div>
			<%if(session.getAttribute("role") == null ){ %>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="register.jsp" ><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
					<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
				</ul>	
			<% }else if(session.getAttribute("role").equals("member")){ %>
				<ul class="nav navbar-nav">
					<li><a href="index.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="product.jsp"><span class="glyphicon glyphicon-tags"></span> Product</a></li>
					<li><a href="member.jsp"><span class="glyphicon glyphicon-eye-open"></span> Member</a></li>
					<li><a href="transaction.jsp"><span class="glyphicon glyphicon-tasks"></span> Transaction</a></li>			
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
					<li><a href="cart.jsp"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					<li><a href="doLogout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>					
				</ul>		
			<%} else if(session.getAttribute("role").equals("administrator")){ %>
				<ul class="nav navbar-nav">
					<li><a href="index.jsp" ><span class="glyphicon glyphicon-home"></span> Home</a></li>
					<li><a href="product.jsp"><span class="glyphicon glyphicon-tags"></span> Product</a></li>
					<li><a href="member.jsp"><span class="glyphicon glyphicon-eye-open"></span> Member</a></li>
					<li><a href="insertproduct.jsp"><span class="fa fa-plus"></span> Insert Product</a></li>	
					<li><a href="transactionadmin.jsp"><span class="glyphicon glyphicon-tasks"></span> Transaction</a></li>			
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="profile.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
					<li><a href="doLogout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>					
				</ul>
			<%}%>
				
		</div>
	</div>
</div>

