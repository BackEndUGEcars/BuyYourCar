package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CurrencySelection
 */
@WebServlet("/currencySelection")
public class CurrencySelection extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Service app = (Service) session.getAttribute("app");
		session.setAttribute("currency", request.getParameter("currency"));
		request.getRequestDispatcher("/Home.jsp").forward(request, response);
	}

}
