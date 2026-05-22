package com.jobtracker.controller;

import java.io.IOException;
import java.sql.Date;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.jobtracker.dao.ApplicationDAO;
import com.jobtracker.model.Application;

@WebServlet("/edit")
public class EditApplicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ApplicationDAO dao = new ApplicationDAO();
        Application app = dao.getApplicationById(id);

        request.setAttribute("app", app);
        request.getRequestDispatcher("edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String company = request.getParameter("company");
        String role = request.getParameter("role");
        String location = request.getParameter("location");
        String status = request.getParameter("status");
        Date appliedDate = Date.valueOf(request.getParameter("applied_date"));

        ApplicationDAO dao = new ApplicationDAO();
        dao.updateApplication(id, company, role, location, status, appliedDate);

        response.sendRedirect(request.getContextPath() + "/view");

    }
}
