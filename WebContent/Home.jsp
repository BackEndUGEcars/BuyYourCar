<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css'>
<link
	href="https://fonts.googleapis.com/css?family=Alegreya+Sans&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="./style.css">

</head>
<%
if(session.getAttribute("app") == null) {
	Service app = (Service) new ServiceServiceLocator().getService();
	((ServiceSoapBindingStub) app).setMaintainSession(true);
	session.setAttribute("app", app);	
	session.setAttribute("currency", "EUR");
}
%>
<body>

	<script type="text/javascript">
	
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
						<strong>Available Cars</strong>
					</h2>
					<div
                            style="margin: auto; text-align: center; height: 30%; width: 50%;"
                            class="wrapper">
                            <form action="${pageContext.request.contextPath}/currencySelection" method="post">
	                            <label for="currency-select" style="color: white;"> <strong> Currency : </strong></label>
	                            <select name="currency" id="currency-select">
	                            	<% 
	                            		Service app = (Service)session.getAttribute("app"); 
	                            		List<String> list = new ArrayList<String>(Arrays.asList(app.getActiveCurrencies().split(";")));
	                      				for(int i = 0; i < list.size(); i++){
	                      					if (list.get(i).equals((String)session.getAttribute("currency"))){
	                      						out.println("<option selected=\"selected\" value=\""+ list.get(i) + "\">" + list.get(i) + "</option>");
	                      					}else{
		                      					out.println("<option value=\""+ list.get(i) + "\">" + list.get(i) + "</option>");
	                      					}
	                      				}
	                            	%>
	                               
	                            </select>
								<button type="submit" name="currencyButton" value="nothing" 
											style="background-color: #01D758; margin-left: 5px;" class="btn btn-dark">
									<strong>Change</strong>
								</button>
							</form>
                            
                        </div>
					<div class="cards">
					<%					
					String json = app.getBuyableCarsJson((String)session.getAttribute("currency"));
			        JSONParser parser = new JSONParser();
			        JSONObject jsonObject = (JSONObject) parser.parse(json);
			        JSONArray cars = (JSONArray) jsonObject.get("cars");
			        Iterator iterator = cars.iterator();
			        while (iterator.hasNext()) {
			        	
			            String s = iterator.next().toString();
			            JSONObject jo = (JSONObject) parser.parse(s);
			            %>
			            <figure class="card">
			            	<img src="<%out.print(jo.get("imagePath"));%>"/>
			            	<figcaption>
								<div>
									<strong> <% out.print(jo.get("model")); %> </strong><br><% out.print(jo.get("sellPrice") + " <strong>" + ((String)session.getAttribute("currency")) + "</strong>");%>
								</div>
								<div class="special-div">
									<form action="${pageContext.request.contextPath}/addToCart"
										method="post">
										<button type="submit" name="shopButton" value="<%out.print(jo.get("id"));%>" 
											style="background-color: #01D758" class="btn btn-dark" <% if(app.isInBasket((Long)jo.get("id"))) out.print("disabled"); %>>
											<strong>Add to basket</strong>
										</button>
									</form>
								</div>
							</figcaption>
						</figure>
					<%
			        }
					%>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
