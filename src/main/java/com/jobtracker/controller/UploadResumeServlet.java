package com.jobtracker.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.jobtracker.dao.ApplicationDAO;
import com.jobtracker.model.Application;
import com.jobtracker.util.ResumeParser;

@WebServlet("/uploadResume")
@MultipartConfig
public class UploadResumeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        Part filePart = request.getPart("resume");

        String uploadPath = getServletContext()
                .getRealPath("") + File.separator + "uploads";

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        String fileName = filePart.getSubmittedFileName();
        String filePath = uploadPath + File.separator + fileName;

        filePart.write(filePath);

        // 📄 Extract Resume Text
        String resumeText = ResumeParser.extractText(filePath);

        // 🧠 Analyze Resume
        List<String> skills = ResumeParser.detectSkills(resumeText);
        int score = ResumeParser.calculateScore(skills);
        List<String> gap = ResumeParser.skillGap(skills);

        // 🤖 Predict Role
        String aiRole = predictRole(skills);

        // 💡 Suggest Job (No Selenium)
        String company = getSuggestedCompany(aiRole);
        String location = "Remote";

        // 💾 Save as Suggested Application
        ApplicationDAO dao = new ApplicationDAO();

        java.sql.Date sqlDate =
                java.sql.Date.valueOf(LocalDate.now());

        Application app = new Application(
                company,
                aiRole,
                location,
                "Suggested",
                sqlDate
        );

        dao.save(app);

        // 📊 Prepare Result Data
        String confidence = String.valueOf(Math.min(score, 95));

        String analysis = generateAIAnalysis(skills, aiRole, score);
        String strengths = generateStrengths(skills);
        String recommendations = generateRecommendations(gap);

        // 📦 Send Data to JSP
        request.setAttribute("skills", skills);
        request.setAttribute("score", score);
        request.setAttribute("aiRole", aiRole);
        request.setAttribute("confidence", confidence);
        request.setAttribute("gap", gap);
        request.setAttribute("analysis", analysis);
        request.setAttribute("strengths", strengths);
        request.setAttribute("recommendations", recommendations);

        // 💡 New Feature Output
        request.setAttribute("autoCompany", company);
        request.setAttribute("autoStatus", "Job Suggested Successfully");

        request.getRequestDispatcher("result.jsp")
               .forward(request, response);
    }

    private String predictRole(List<String> skills) {

        String skillText = skills.toString().toLowerCase();

        if (skillText.contains("java") ||
            skillText.contains("spring") ||
            skillText.contains("jdbc")) {
            return "Java Backend Developer";
        }

        else if (skillText.contains("python") ||
                 skillText.contains("machine learning") ||
                 skillText.contains("ai")) {
            return "AI / ML Developer";
        }

        else if (skillText.contains("html") ||
                 skillText.contains("css") ||
                 skillText.contains("javascript")) {
            return "Frontend / Web Developer";
        }

        else if (skillText.contains("sql") ||
                 skillText.contains("mysql")) {
            return "Database Developer";
        }

        return "Software Developer";
    }

    private String getSuggestedCompany(String role) {
        if (role.contains("Java")) return "Infosys";
        if (role.contains("AI")) return "TCS";
        if (role.contains("Frontend")) return "Wipro";
        if (role.contains("Database")) return "Accenture";
        return "Capgemini";
    }

    private String generateAIAnalysis(List<String> skills,
                                      String role,
                                      int score) {

        if (role.contains("Java")) {
            return "The resume shows strong backend development capability.";
        }

        if (role.contains("AI")) {
            return "The profile reflects strong AI/ML orientation.";
        }

        if (role.contains("Frontend")) {
            return "The resume demonstrates UI development strengths.";
        }

        if (score >= 80) {
            return "This resume indicates excellent employability potential.";
        }

        return "The profile has a solid technical base.";
    }

    private String generateStrengths(List<String> skills) {
        if (skills.size() >= 8)
            return "Strong multi-domain technical profile.";
        if (skills.size() >= 5)
            return "Good technical foundation.";
        return "Basic technical knowledge present.";
    }

    private String generateRecommendations(List<String> gap) {
        if (gap == null || gap.isEmpty()) {
            return "Your resume is highly optimized.";
        }
        return "Recommended focus areas: " + String.join(", ", gap);
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        response.sendRedirect("resume.jsp");
    }
}