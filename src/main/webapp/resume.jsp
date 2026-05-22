<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resume Analyzer</title>

<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    margin:0;
    padding:0;
    background: linear-gradient(135deg,#dbeafe,#93c5fd);
    font-family: 'Segoe UI', sans-serif;
}

/* Header Button */
.top-btn{
    display:flex;
    justify-content:flex-end;
    padding:20px 40px 0 40px;
}

/* Heading */
.page-title{
    text-align:center;
    font-size:36px;
    font-weight:700;
    color:#1e40af;
    margin-top:20px;
}

/* Subtitle */
.subtitle{
    text-align:center;
    font-size:16px;
    color:#1e3a8a;
    margin-bottom:40px;
}

/* Card */
.upload-card{
    width:550px;
    margin:0 auto;
    padding:35px;
    background:white;
    border-radius:15px;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
    text-align:center;
}

/* Button */
.btn-custom{
    margin-top:15px;
    padding:10px 25px;
    border-radius:8px;
    font-weight:600;
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
    Resume Analyzer & Job Recommendation System
</div>

<div class="subtitle">
    Upload your resume to get skill analysis, resume score & job suggestions
</div>

<div class="upload-card">

    <form action="uploadResume" method="post" enctype="multipart/form-data">

        <div class="mb-3">
            <input type="file" name="resume" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary btn-custom">
            Analyze Resume
        </button>

    </form>

</div>

</body>
</html>