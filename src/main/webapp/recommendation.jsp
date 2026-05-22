<!DOCTYPE html>
<html>
<head>
<title>Job Recommendations</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(135deg,#dbeafe,#93c5fd);
    font-family: 'Segoe UI', sans-serif;
}

.page-title{
    text-align:center;
    font-size:32px;
    font-weight:700;
    color:#1e40af;
    margin-top:40px;
}

.container-box{
    width:70%;
    margin:50px auto;
    display:flex;
    justify-content:space-around;
    gap:20px;
}

.job-card{
    flex:1;
    padding:30px;
    text-align:center;
    border-radius:15px;
    background:white;
    box-shadow:0 6px 18px rgba(0,0,0,0.15);
    transition:0.3s;
}

.job-card:hover{
    transform:scale(1.05);
}

.job-btn{
    margin-top:15px;
}
</style>
</head>

<body>

<div class="page-title">
    Choose Job Platform
</div>

<div class="container-box">

    <!-- LinkedIn -->
    <div class="job-card">
        <h4>LinkedIn</h4>
        <p>Explore professional job opportunities</p>
        <a href="https://www.linkedin.com/jobs/" target="_blank"
           class="btn btn-primary job-btn">
            Open LinkedIn
        </a>
    </div>

    <!-- Naukri -->
    <div class="job-card">
        <h4>Naukri</h4>
        <p>Find jobs across India</p>
        <a href="https://www.naukri.com/" target="_blank"
           class="btn btn-info text-white job-btn">
            Open Naukri
        </a>
    </div>

    <!-- Indeed -->
    <div class="job-card">
        <h4>Indeed</h4>
        <p>Search millions of jobs</p>
        <a href="https://in.indeed.com/jobs" target="_blank"
           class="btn btn-secondary job-btn">
            Open Indeed
        </a>
    </div>

</div>

<!-- Back Button -->
<div class="text-center mt-4">
    <a href="dashboard.jsp" class="btn btn-primary">
        Back to Dashboard
    </a>
</div>

</body>
</html>