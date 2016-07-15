package org.endevel;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("FirstName");
		
		PrintWriter out = response.getWriter();
		out.println("<h3>Привет, сервлет работает . . .</h3><br>Все понятно, " + name + " ?<br>");
		out.println("<a href=\"http://localhost:8080/WebApp/NewFile.html\">Возврат</a>");
		out.close();
	}

}
