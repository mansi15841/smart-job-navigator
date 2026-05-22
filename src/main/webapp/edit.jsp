<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.jobtracker.model.Application" %>

<%
Application app = (Application) request.getAttribute("app");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Edit Application</h2>
        <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>

    <form action="edit" method="post" class="card p-4 shadow">

        <input type="hidden" name="id" value="<%= app.getId() %>">

        <div class="mb-3">
            <label>Company</label>
            <input type="text" name="company" class="form-control" 
                   value="<%= app.getCompany() %>" required>
        </div>

        <div class="mb-3">
            <label>Role</label>
            <input type="text" name="role" class="form-control" 
                   value="<%= app.getRole() %>" required>
        </div>

        <div class="mb-3">
            <label>Location</label>
            <input type="text" name="location" class="form-control" 
                   value="<%= app.getLocation() %>" required>
        </div>

        <div class="mb-3">
            <label>Status</label>
            <input type="text" name="status" class="form-control" 
                   value="<%= app.getStatus() %>" required>
        </div>

        <div class="mb-3">
            <label>Applied Date</label>
            <input type="date" name="applied_date" class="form-control" 
                   value="<%= app.getAppliedDate() %>" required>
        </div>

        <button type="submit" class="btn btn-success">Update</button>
        <a href="view" class="btn btn-secondary">Cancel</a>
        <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>

    </form>
</div>

</body>
</html>