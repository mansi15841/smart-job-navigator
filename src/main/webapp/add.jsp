<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job Application Tracker</title>

<!-- Bootstrap CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

<style>

    body {
        background: linear-gradient(135deg, #dbeafe, #bfdbfe, #93c5fd);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        font-family: 'Segoe UI', sans-serif;
    }

    .glass-card {
        background: rgba(255, 255, 255, 0.6);
        backdrop-filter: blur(12px);
        -webkit-backdrop-filter: blur(12px);
        border-radius: 20px;
        padding: 40px;
        width: 100%;
        max-width: 500px;
        color: #1e3a8a;
        box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15);
    }

    h3 {
        font-weight: 600;
    }

    .form-control {
        background: rgba(255, 255, 255, 0.9);
        border: 1px solid #93c5fd;
        color: #1e3a8a;
    }

    .form-control::placeholder {
        color: #3b82f6;
    }

    .form-control:focus {
        border-color: #2563eb;
        box-shadow: 0 0 8px rgba(37, 99, 235, 0.4);
    }

    .custom-btn {
        background: linear-gradient(45deg, #3b82f6, #2563eb);
        border: none;
        color: white;
        transition: 0.3s;
    }

    .custom-btn:hover {
        transform: scale(1.05);
        box-shadow: 0 0 12px rgba(37, 99, 235, 0.6);
    }

</style>

</head>
<body>

<div class="glass-card">

    <h3 class="text-center mb-4">💼 Add Job Application</h3>

    <% 
        String success = (String) session.getAttribute("successMessage");
        if (success != null) {
    %>
        <div id="successAlert" class="alert alert-primary text-center fw-bold" role="alert">
            <%= success %>
        </div>
    <%
            session.removeAttribute("successMessage");
        }
    %>

    <form action="${pageContext.request.contextPath}/add" method="post">

        <div class="mb-3">
            <input type="text" name="company" class="form-control" placeholder="Company Name" required>
        </div>

        <div class="mb-3">
            <input type="text" name="role" class="form-control" placeholder="Role" required>
        </div>

        <div class="mb-3">
            <input type="text" name="location" class="form-control" placeholder="Location" required>
        </div>

        <div class="mb-3">
            <input type="text" name="status" class="form-control" placeholder="Status (Applied / Interview / Rejected)" required>
        </div>

        <div class="mb-3">
            <input type="date" name="applied_date" class="form-control" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn custom-btn px-4">
                Save Application
            </button>
        </div>

    </form>

    <!-- ✅ View Applications Button -->
    <div class="text-center mt-3">
        <a href="${pageContext.request.contextPath}/view" 
           class="btn custom-btn px-4">
            View Applications
        </a>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script>
    setTimeout(function() {
        var alertBox = document.getElementById("successAlert");
        if(alertBox){
            alertBox.style.transition = "opacity 1s ease";
            alertBox.style.opacity = "0";

            setTimeout(function(){
                alertBox.style.display = "none";
            }, 1000);
        }
    }, 5000);
</script>

</body>
</html>
