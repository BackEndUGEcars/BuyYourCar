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
		int res = app.buyCar((Long)session.getAttribute("buyCar"), request.getParameter("username"), request.getParameter("password"));
		switch (res) {
		case 1: {
			request.getRequestDispatcher("/Validation.jsp").forward(request, response);
			break;
		} case -1: {
			request.getRequestDispatcher("/Invalidation.jsp").forward(request, response);
		} case -2: {
			request.getRequestDispatcher("/BadLogin.jsp").forward(request, response);
		}
		default:
			request.getRequestDispatcher("/Invalidation.jsp").forward(request, response);
			break;
		}
	}

}
