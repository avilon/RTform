package org.endevel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.endevel.logic.DBManagement;
import org.endevel.logic.PersonInfo;

import java.io.PrintWriter;
import java.util.List;


@WebServlet(description = "Обработчик запроса на поиск данных", urlPatterns = { "/DataMiner" })
public class DataMiner extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		
		
		String family = request.getParameter("Family");
		String firstName = request.getParameter("FirstName");
		String lastName = request.getParameter("LastName");
		String city = request.getParameter("City");
		String brand = request.getParameter("Brand");
		
		PrintWriter out = response.getWriter(); 
        out.println("<b>Список тех, кто попался</b><br><br>");
        /*
        out.println("Фамилия: [ " + family + " ]");
        out.println("Имя: [ " + firstName + " ]");
        out.println("Отчество: [" + lastName + " ]");
        out.println("Город: [ " + city + " ]");        
        out.println("Машина: [ " + brand + " ]");
        */
        
        String st = "    <style>\n" +
                "      table {\n" +
                "        width: 70%;\n" +
                "        border-collapse: collapse;\n" +
                "      }\n" +
                "      td, th {\n" +
                "        border: 1px solid #98bf21;\n" +
                "        padding: 3px 7px 2px 7px;\n" +
                "      }\n" +
                "      th {\n" +
                "        text-align: left;\n" +
                "        padding: 5px;\n" +
                "        background-color: #A7C942;\n" +
                "        color: #fff;\n" +
                "      }\n" +
                "      .alt td { background-color: #EAF2D3; }\n" +
                "    </style>";
        
        out.println(st);
        
        out.println("<table border=1>");
		
		if ((family.length() > 0)    || 
			(firstName.length() > 0) ||
			(lastName.length() > 0)  ||
			(city.length() > 0)      ||
			(brand.length() > 0)) {
			try {
				DBManagement dbm = DBManagement.getInstance();
				
				List<PersonInfo> list = (List<PersonInfo>) dbm.getSubjects(family, firstName, lastName, city, brand);
				
                out.println("<tr><th>Фамилия</th>"  +
                           "<th>Имя</th>"           +
                           "<th>Отчество</th>"      +
                		   "<th>Город</th>"         +
                           "<th>Улица</th>"         +
                		   "<th>Дом</th>"           +
                           "<th>Квартира</th>"      +
                		   "<th>Модель машины</th>" +
                           "<th>Марка машины</th></tr>");	                
                
                int i = 0;
				for (PersonInfo sbj : list) {
					i++;
					if ((i%2) == 0)
						out.println("<tr class=\"alt\">");
					else
						out.println("<tr>");

					out.println("<td>" + sbj.getFamily() + "</td>");
	                out.println("<td>" + sbj.getFirstName() + "</td>");
	                out.println("<td>" + sbj.getLastName() + "</td>");
	                out.println("<td>" + sbj.getCity() + "</td>");
	                out.println("<td>" + sbj.getStreet() + "</td>");
	                out.println("<td>" + sbj.getHouse() + "</td>");
	                out.println("<td>" + sbj.getFlat() + "</td>");
	                out.println("<td>" + sbj.getBrand() + "</td>");
	                out.println("<td>" + sbj.getModel() + "</td>");

	                out.println("</tr>");
				}
		        out.println("</table><br><br>");
				out.println("<a href=\"http://localhost:8080/WebApp/NewFile.html\">Новый запрос</a>");		        
			} catch (Exception e) {				
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
