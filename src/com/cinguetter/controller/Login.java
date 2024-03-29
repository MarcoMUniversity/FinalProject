package com.cinguetter.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cinguetter.model.UserFactory;

/**
 * Servlet implementation class Login
 */
@WebServlet("/index.html")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if(session == null || session.getAttribute("email") == null || session.getAttribute("password") == null) {
			
			if(session != null && session.getAttribute("success") != null) {
				String success = (String) session.getAttribute("success");
				session.removeAttribute("success");
				request.setAttribute("success", success);
			}
			request.getRequestDispatcher("WEB-INF/JSP/login.jsp").forward(request, response);
			
		}else {
			
			String email = (String) session.getAttribute("email");
			String password = (String) session.getAttribute("password");
			session.removeAttribute("success");
			
			if (email!= null && password != null && 
				!email.isEmpty() && !password.isEmpty() && 
				UserFactory.getInstance().login(email, password) == true){
				String logout = request.getParameter("logout");
				if (logout != null) {
					session.invalidate();
					request.getRequestDispatcher("WEB-INF/JSP/login.jsp").forward(request, response);
				} else {
					response.sendRedirect("home.html");
				}
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email!= null && password != null && 
			!email.isEmpty() && !password.isEmpty() && 
			UserFactory.getInstance().login(email, password) == true) {
			HttpSession session = request.getSession();
			session.setAttribute("email", email);
			session.setAttribute("password", password);
			response.sendRedirect("home.html");

		} else {
			request.setAttribute("error", "Wrong credentials");
			request.setAttribute("logged", false);
			request.getRequestDispatcher("WEB-INF/JSP/login.jsp").forward(request, response);
		}

	}

}
