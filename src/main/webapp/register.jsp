<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link href="assets/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
background:linear-gradient(135deg,#dbeafe,#93c5fd);
height:100vh;
display:flex;
justify-content:center;
align-items:center;
}
.card{
padding:30px;
border-radius:20px;
}
</style>
</head>
<body>

<div class="card shadow" style="width:400px;">
<h3 class="text-center mb-3">Register</h3>

<form action="register" method="post">
<input type="text" name="name" class="form-control mb-3" placeholder="Name" required>
<input type="email" name="email" class="form-control mb-3" placeholder="Email" required>
<input type="password" name="password" class="form-control mb-3" placeholder="Password" required>
<button type="submit" class="btn btn-primary w-100">Register</button>
</form>

<p class="text-center mt-3">
Already have account? <a href="login.jsp">Login</a>
</p>

</div>

</body>
</html>
