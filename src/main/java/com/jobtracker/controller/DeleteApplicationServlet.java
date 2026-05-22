package com.jobtracker.controller;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.jobtracker.dao.ApplicationDAO;

@WebServlet("/delete")
public class DeleteApplicationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        ApplicationDAO dao = new ApplicationDAO();
        dao.deleteApplication(id);

        response.sendRedirect(request.getContextPath() + "/view");

    }
}
