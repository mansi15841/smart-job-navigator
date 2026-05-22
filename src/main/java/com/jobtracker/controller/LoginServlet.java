package com.jobtracker.controller;

import java.io.IOException;

import com.jobtracker.dao.UserDAO;
import com.jobtracker.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws IOException, ServletException {

	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    User user = new User(email, password);

	    UserDAO dao = new UserDAO();
	    boolean status = dao.login(user);

	    if (status) {

	        HttpSession session = request.getSession();
	        session.setAttribute("user", email);

	        response.sendRedirect("dashboard.jsp");

	    } else {

	        request.setAttribute("errorMessage", "Invalid Email or Password!");
	        request.getRequestDispatcher("login.jsp").forward(request, response);
	    }
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws IOException {
	    response.sendRedirect("login.jsp");
	}
}
