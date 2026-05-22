<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Smart Job Navigator Dashboard</title>

<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    margin:0;
    padding:0;
    background: linear-gradient(135deg,#e0f2fe,#93c5fd);
    font-family: 'Segoe UI', sans-serif;
}

/* Main Heading */
.header{
    width:100%;
    text-align:center;
    font-size:38px;
    font-weight:700;
    color:#1e40af;
    margin-top:40px;
    letter-spacing:1px;
}

/* Sub Heading */
.sub-text{
    text-align:center;
    color:#1e3a8a;
    font-size:18px;
    margin-bottom:30px;
}

/* Card Section */
.dashboard-container{
    display:flex;
    justify-content:center;
    align-items:center;
    flex-wrap:wrap;
    gap:30px;
    padding:20px;
}

/* Card Styling */
.dashboard-card{
    width:280px;
    padding:25px;
    border-radius:15px;
    background:white;
    text-align:center;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
    transition:0.3s ease;
}

.dashboard-card:hover{
    transform:translateY(-8px);
}

/* Button Styling */
.option-btn{
    margin-top:15px;
    width:100%;
    border-radius:8px;
}
</style>

</head>
<body>

<div class="header">
     Smart Job Navigator
</div>

<div class="sub-text">
    Smart Resume Analysis • Intelligent Job Recommendation • Application Tracking
</div>

<div class="dashboard-container">

    <!-- Add Application -->
    <div class="dashboard-card">
        <h5>📌 Track Applications</h5>
        <p>Manage and monitor all your job applications efficiently.</p>
        <a href="add.jsp" class="btn btn-primary option-btn">
            Add Application
        </a>
    </div>

    <!-- View Applications -->
    <div class="dashboard-card">
        <h5>📄 View Applications</h5>
        <p>Check status, update progress and manage records.</p>
        <a href="view" class="btn btn-success option-btn">
            View Applications
        </a>
    </div>

    <!-- AI Resume Analyzer -->
    <div class="dashboard-card">
        <h5>🧠 AI Resume Analyzer</h5>
        <p>Upload resume and get skill analysis with score.</p>
        <a href="resume.jsp" class="btn btn-warning option-btn">
            Analyze Resume
        </a>
    </div>

    <!-- Job Recommendation -->
    <div class="dashboard-card">
        <h5>🚀 Job Recommendations</h5>
        <p>Find jobs from top job portals.</p>
        <a href="recommendation.jsp" class="btn btn-info option-btn">
            Get Job
        </a>
    </div>

    <!-- Logout -->
    <div class="dashboard-card">
        <h5>🚪 Logout</h5>
        <p>Securely exit from the system.</p>
        <a href="login.jsp" class="btn btn-danger option-btn">
            Logout
        </a>
    </div>

</div>

</body>
</html>