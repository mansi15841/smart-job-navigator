package com.jobtracker.controller;

import java.io.IOException;
import java.util.List;

import com.jobtracker.dao.ApplicationDAO;
import com.jobtracker.model.Application;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/view")
public class ViewApplicationsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ApplicationDAO dao = new ApplicationDAO();
        List<Application> list;

        // 🚀 Get search/filter values
        String company = request.getParameter("company");
        String status = request.getParameter("status");
        String location = request.getParameter("location");

        // Handle null values
        if (company == null) company = "";
        if (status == null) status = "";
        if (location == null) location = "";

        // 🚀 Search + Filter Logic
        if (!company.isEmpty() || !status.isEmpty() || !location.isEmpty()) {
            list = dao.searchApplications(company, status, location);
        } else {
            list = dao.getAllApplications();
        }

        // 🚀 Dashboard Analytics
        int total = dao.getTotalApplications();
        int applied = dao.getCountByStatus("Applied");
        int interview = dao.getCountByStatus("Interview");
        int selected = dao.getCountByStatus("Selected");
        int rejected = dao.getCountByStatus("Rejected");

        // 🚀 Send values back to JSP
        request.setAttribute("applications", list);
        request.setAttribute("total", total);
        request.setAttribute("applied", applied);
        request.setAttribute("interview", interview);
        request.setAttribute("selected", selected);
        request.setAttribute("rejected", rejected);

        // Keep filter values in form
        request.setAttribute("company", company);
        request.setAttribute("status", status);
        request.setAttribute("location", location);

        // 🚀 Forward to JSP
        request.getRequestDispatcher("/view.jsp").forward(request, response);
    }
}