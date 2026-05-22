package com.jobtracker.controller;

import java.io.IOException;

import com.jobtracker.dao.ApplicationDAO;
import com.jobtracker.model.Application;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/add")
public class AddApplicationServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

    	System.out.println("Servlet is running...");

        String company = request.getParameter("company");
        String role = request.getParameter("role");
        String location = request.getParameter("location");
        String status = request.getParameter("status");
        String appliedDateStr = request.getParameter("applied_date");
        
        java.sql.Date sqlDate = java.sql.Date.valueOf(appliedDateStr);
        

        Application app = new Application(company, role, location, status, sqlDate);

        ApplicationDAO dao = new ApplicationDAO();
        dao.save(app);

        HttpSession session = request.getSession();
        session.setAttribute("successMessage", "Application Saved Successfully!");

        response.sendRedirect("dashboard.jsp");

    }
}

