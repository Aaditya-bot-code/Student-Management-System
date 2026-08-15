package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import dao.AdminDAO;
import model.Admin;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username =request.getParameter("username");
		String password =request.getParameter("password");
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);
		Admin admin=new Admin();
		admin.setUsername(username);
		admin.setPassword(password);
		AdminDAO dao=new AdminDAO();
		boolean status =dao.validate(admin);
		System.out.println("Login status="+status);
		if(status)
		{
		    HttpSession session = request.getSession();
		    session.setAttribute("admin", username);

		    response.sendRedirect("HomeServlet");
		}
		else
		{
			response.sendRedirect("Login.jsp");
		}
		
	}

}
