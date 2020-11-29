<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="fr.uge.webservices.Service"%>
<%@page import="fr.uge.webservices.ServiceServiceLocator"%>
<%@page import="fr.uge.webservices.ServiceSoapBindingStub"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.parser.ParseException"%>
<%@page import="org.apache.commons.io.IOUtils"%>
<%@page import="java.util.*"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>UGE - BuyYourCar</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
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
	<script>
		
	</script>


	<!-- partial:index.partial.html -->
	<div id="viewport">
		<!-- Sidebar -->
		<div id="sidebar">
			<header>
				<a href="Home.jsp">UGE CARSHOP</a>
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
						<strong>Your saved cars </strong>
					</h2>
					<div class="cards">
						<%
					Service app = (Service) session.getAttribute("app");
					
					String json = app.basketToJson();
			        JSONParser parser = new JSONParser();
			        JSONObject jsonObject = (JSONObject) parser.parse(json);
			        JSONArray cars = (JSONArray) jsonObject.get("cars");
			        Iterator iterator = cars.iterator();
			        int i = 0;
			        while (iterator.hasNext()) {
			        	i++;
			            String s = iterator.next().toString();
			            JSONObject jo = (JSONObject) parser.parse(s);
			            %>
			            <figure class="card">
			            	<img src="<%out.print(jo.get("imagePath"));%>"/>
			           	<figcaption>
								<div>
									<strong> <% out.print(jo.get("model")); %> </strong><br><% out.print(jo.get("sellPrice")); %>EUR
								</div>
								<div class="special-div">
									<form action="${pageContext.request.contextPath}/connection"
										method="post">
										<button type="submit" name="buyButton" value="<%out.print(jo.get("id"));%>" 
											style="background-color: #01D758" class="btn btn-dark">
											<strong>Buy</strong>
										</button>
									</form>
									<form action="${pageContext.request.contextPath}/removeCart"
										method="post">
										<button type="submit" name="removeButton" value="<%out.print(jo.get("id"));%>" 
											style="background-color: #01D758" class="btn btn-dark">
											<strong>Remove</strong>
										</button>
									</form>
								</div>
							</figcaption>
						</figure>
					<%
			        }
			        if (i == 0) {
			        	out.println("</div><div class=\"wrapper\">\n" +
			                    "\t\t\t\t\t<h3 style=\"text-align: center; color: #ccc;\">Oops, your basket is empty</h3>\n" +
			                    "\t\t\t\t\t<div\n" +
			                    "\t\t\t\t\t\tstyle=\"margin: auto; text-align: center; height: 30%; width: 50%;\"\n" +
			                    "\t\t\t\t\t\tclass=\"wrapper\">\n" +
			                    "\t\t\t\t\t\t<form class=\"form-signin\" action=\"Home.jsp\">\n" +
			                    "\t\t\t\t\t\t\t<button\n" +
			                    "\t\t\t\t\t\t\t\tstyle=\"color: #fff; background-color: #01D758; border-color: #01D758;\"\n" +
			                    "\t\t\t\t\t\t\t\tclass=\"btn btn-lg btn-primary btn-block\" type=\"submit\">Back to home</button>\n" +
			                    "\t\t\t\t\t\t</form>\n" +
			                    "\t\t\t\t\t</div>\n" +
			                    "\t\t\t\t</div>");
			        }
					%>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>