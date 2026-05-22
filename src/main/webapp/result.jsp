<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>AI Resume Analysis Report</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#dbeafe,#93c5fd);
    font-family: 'Segoe UI', sans-serif;
}

.top-btn{
    display:flex;
    justify-content:flex-end;
    padding:20px 40px 0 40px;
}

.page-title{
    text-align:center;
    font-size:36px;
    font-weight:700;
    color:#1e40af;
    margin-top:20px;
}

.result-card{
    width:70%;
    margin:40px auto;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
}

.section-title{
    color:#1e40af;
    font-weight:600;
    margin-top:25px;
}

.progress{
    height:22px;
    width:60%;
}

.badge-role{
    font-size:16px;
    padding:8px 14px;
}

.job-btn{
    min-width:140px;
}

.ai-box{
    background:#f8fafc;
    border-left:5px solid #2563eb;
    padding:18px;
    border-radius:10px;
    margin-top:15px;
}
</style>
</head>

<body>

<div class="top-btn">
    <a href="dashboard.jsp" class="btn btn-primary">
        Back to Dashboard
    </a>
</div>

<div class="page-title">
    AI Resume Analysis Report
</div>

<div class="result-card">

<%
    List<String> skills = (List<String>) request.getAttribute("skills");
    Integer score = (Integer) request.getAttribute("score");
    String aiRole = (String) request.getAttribute("aiRole");
    String confidence = (String) request.getAttribute("confidence");
    List<String> gap = (List<String>) request.getAttribute("gap");

    String analysis = (String) request.getAttribute("analysis");
    String strengths = (String) request.getAttribute("strengths");
    String recommendations = (String) request.getAttribute("recommendations");

    int confValue = 0;
    if(confidence != null){
        confValue = (int) Double.parseDouble(confidence);
    }

    String encodedRole = "";
    if(aiRole != null){
        encodedRole = aiRole.replace(" ", "%20");
    }
%>

<!-- AI Predicted Role -->
<div class="section-title">AI Predicted Career Role:</div>
<div class="mt-2">
    <span class="badge bg-info text-dark badge-role">
        <%= aiRole %>
    </span>
</div>

<!-- AI Career Insight -->
<div class="section-title">AI Career Insight:</div>
<div class="ai-box">
    <strong>Analysis:</strong> <%= analysis %>
    <br><br>
    <strong>Strength Analysis:</strong> <%= strengths %>
    <br><br>
    <strong>AI Recommendations:</strong> <%= recommendations %>
</div>

<!-- Job Recommendations -->
<div class="section-title">Recommended Job Opportunities:</div>
<div class="mt-3">
    <a href="https://www.linkedin.com/jobs/search/?keywords=<%= encodedRole %>"
       target="_blank"
       class="btn btn-primary me-2 job-btn">
       LinkedIn Jobs
    </a>

    <a href="https://www.naukri.com/<%= aiRole.replace(" ", "-") %>-jobs"
       target="_blank"
       class="btn btn-info text-white me-2 job-btn">
       Naukri Jobs
    </a>

    <a href="https://in.indeed.com/jobs?q=<%= aiRole.replace(" ", "+") %>"
       target="_blank"
       class="btn btn-secondary job-btn">
       Indeed Jobs
    </a>
</div>

<!-- Confidence -->
<div class="section-title">Prediction Confidence:</div>
<div class="d-flex align-items-center gap-3 mt-2">
    <div class="progress">
        <div class="progress-bar bg-success"
             role="progressbar"
             style="width:<%= confValue %>%;">
            <%= confValue %>%
        </div>
    </div>
</div>

<!-- Resume Strength Score -->
<div class="section-title">Resume Strength Score:</div>
<div class="progress mt-2">
    <div class="progress-bar bg-primary"
         role="progressbar"
         style="width:<%= score %>%;">
        <%= score %>/100
    </div>
</div>

<!-- Detected Skills -->
<div class="section-title">Detected Skills:</div>
<div class="mt-2">
<% if(skills != null){
    for(String s : skills){ %>
        <span class="badge bg-success m-1"><%= s %></span>
<% } } %>
</div>

<!-- Skill Gap -->
<div class="section-title">AI Improvement Suggestions:</div>
<div class="mt-2">
<% if(gap != null && !gap.isEmpty()){
    for(String g : gap){ %>
        <span class="badge bg-warning text-dark m-1"><%= g %></span>
<% } } else { %>
        <span class="text-success">Your profile looks well balanced 🎉</span>
<% } %>
</div>

<!-- Buttons -->
<div class="text-center mt-4">
    <a href="resume.jsp" class="btn btn-secondary me-2">
        Analyze Another Resume
    </a>
    <a href="dashboard.jsp" class="btn btn-primary">
        Back to Dashboard
    </a>
</div>

</div>

</body>
</html>