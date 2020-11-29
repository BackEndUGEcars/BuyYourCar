package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyCar
 */
@WebServlet("/buyCar")
public class BuyCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session == null || session.getAttribute("app") == null) request.getRequestDispatcher("/Home.jsp").forward(request, response);
		Service app = (Service) session.getAttribute("app");
		if (app.buyCar((Long)session.getAttribute("buyCar"), request.getParameter("username"), request.getParameter("password"))) {
			request.getRequestDispatcher("/Validation.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/Invalidation.jsp").forward(request, response);
		}
	}

}
