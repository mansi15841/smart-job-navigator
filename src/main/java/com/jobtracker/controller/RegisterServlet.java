package com.jobtracker.controller;

import java.io.IOException;

import com.jobtracker.dao.UserDAO;
import com.jobtracker.model.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = new User(name, email, password);

        UserDAO dao = new UserDAO();
        boolean status = dao.register(user);

        if (status) {
            response.sendRedirect("login.jsp");
        } else {
            response.getWriter().println("Registration Failed");
        }
    }
}
