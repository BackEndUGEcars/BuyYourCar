package fr.uge.webservices;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveCart
 */
@WebServlet("/removeCart")
public class RemoveCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Service app = (Service) session.getAttribute("app");
		app.removeBasket(Long.valueOf(request.getParameter("removeButton")));
		request.getRequestDispatcher("/Cart.jsp").forward(request, response);
	}


}
