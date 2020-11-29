<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>UGE - RentYourCar</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
<link
	href="https://fonts.googleapis.com/css?family=Alegreya+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./style.css">

</head>
<body>

	<!-- partial:index.partial.html -->
	<div id="viewport">
		<!-- Sidebar -->
		<div id="sidebar">
			<header>
				<a href="Home.jsp">UGE CAR RENT</a>
			</header>
			<ul class="nav">
				<li><a href="Cart.jsp"> <i
						class="zmdi zmdi-shopping-basket"></i> Basket
				</a></li>
				<li><a href="About.jsp"> <i class="zmdi zmdi-info-outline"></i>
						About
				</a></li>
				<li><a href="Contacts.jsp"> <i class="zmdi zmdi-comment-more"></i>
						Contact
				</a></li>
			</ul>
		</div>
		<!-- Content -->
		<div id="content">
			<div class="container-fluid">
				<div class="wrapper">
					<h2>
						<strong>About</strong>
					</h2>
					<h3 style="text-align: center; color: #ccc;"><strong>UGE CARSHOP & UGE CARRENT</strong><br>A webservice project developped by : <br> Pierre-Jean Besnard<br> Louis Billaut <br> Armand Liegey</h3>
					<div
						style="margin: auto; text-align: center; height: 30%; width: 50%;"
						class="wrapper">
						<form class="form-signin" action="Home.jsp" method="post">
							<button
								style="color: #fff; background-color: #01D758; border-color: #01D758;"
								class="btn btn-lg btn-primary btn-block" type="submit">Return home</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>