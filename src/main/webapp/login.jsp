<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:linear-gradient(135deg,#dbeafe,#93c5fd);
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    flex-direction:column;
}

.project-title{
    text-align:center;
    margin-bottom:25px;
}

.card{
    padding:30px;
    border-radius:20px;
    width:400px;
}
</style>
</head>
<body>

<!-- Project Name Outside Card -->
<div class="project-title">
    <h1 class="fw-bold text-primary mb-2">
        Smart Job Navigator
    </h1>

    <p class="text-muted">
        Track applications | Analyze resumes | Discover opportunities
    </p>
</div>

<!-- Login Card -->
<div class="card shadow">
    <h3 class="text-center mb-3">Login</h3>

    <form action="login" method="post">
        <input type="email" name="email" class="form-control mb-3" placeholder="Email" required>
        <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

        <%
            String error = (String) request.getAttribute("errorMessage");
            if (error != null) {
        %>
            <div style="color:red; margin-top:10px;">
                <%= error %>
            </div>
        <%
            }
        %>

        <button type="submit" class="btn btn-primary w-100">Login</button>
    </form>

    <p class="text-center mt-3">
        New user? <a href="register.jsp">Register</a>
    </p>
</div>

</body>
</html>