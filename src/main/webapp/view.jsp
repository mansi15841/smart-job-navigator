<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobtracker.model.Application" %>

<!DOCTYPE html>
<html>
<head>
    <title>View Applications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .stat-card {
            border-radius: 12px;
            border: none;
        }

        .card-total {
            background-color: #5c7cfa;
            color: white;
        }

        .card-applied {
            background-color: #4dabf7;
            color: white;
        }

        .card-interview {
            background-color: #ffd43b;
            color: #212529;
        }

        .card-selected {
            background-color: #51cf66;
            color: white;
        }

        .card-rejected {
            background-color: #ff6b6b;
            color: white;
        }

        .filter-card {
            border-radius: 12px;
        }
    </style>
</head>
<body class="bg-light">

<div class="container mt-5">

    <!-- Header with dashboard button -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0">Job Applications Dashboard</h2>
        <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>

    <!-- Dashboard Cards -->
    <div class="row mb-4 text-center">
        <div class="col">
            <div class="card stat-card card-total shadow-sm py-2">
                <div class="card-body p-2">
                    <h6 class="mb-1">Total</h6>
                    <h5 class="mb-0"><%= request.getAttribute("total") %></h5>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card stat-card card-applied shadow-sm py-2">
                <div class="card-body p-2">
                    <h6 class="mb-1">Applied</h6>
                    <h5 class="mb-0"><%= request.getAttribute("applied") %></h5>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card stat-card card-interview shadow-sm py-2">
                <div class="card-body p-2">
                    <h6 class="mb-1">Interview</h6>
                    <h5 class="mb-0"><%= request.getAttribute("interview") %></h5>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card stat-card card-selected shadow-sm py-2">
                <div class="card-body p-2">
                    <h6 class="mb-1">Selected</h6>
                    <h5 class="mb-0"><%= request.getAttribute("selected") %></h5>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="card stat-card card-rejected shadow-sm py-2">
                <div class="card-body p-2">
                    <h6 class="mb-1">Rejected</h6>
                    <h5 class="mb-0"><%= request.getAttribute("rejected") %></h5>
                </div>
            </div>
        </div>
    </div>

    <!-- Search + Filter Panel -->
    <div class="card filter-card shadow-sm border-0 mb-4">
        <div class="card-body">
            <form action="view" method="get" class="row g-3 align-items-center">

                <div class="col-md-4">
                    <input type="text" name="company" class="form-control"
                           placeholder="Search by company"
                           value="<%= request.getAttribute("company") != null ? request.getAttribute("company") : "" %>">
                </div>

                <div class="col-md-3">
                    <select name="status" class="form-select">
                        <option value="">All Status</option>
                        <option value="Applied">Applied</option>
                        <option value="Interview">Interview</option>
                        <option value="Selected">Selected</option>
                        <option value="Rejected">Rejected</option>
                    </select>
                </div>

                <div class="col-md-3">
                    <input type="text" name="location" class="form-control"
                           placeholder="Filter by location"
                           value="<%= request.getAttribute("location") != null ? request.getAttribute("location") : "" %>">
                </div>

                <div class="col-md-2 d-grid">
                    <button type="submit" class="btn btn-dark">
                        Search
                    </button>
                </div>

            </form>
        </div>
    </div>

    <!-- Applications Table -->
    <table class="table table-bordered table-striped table-hover shadow">
        <thead class="table-dark">
            <tr>
                <th>Sr No</th>
                <th>Company</th>
                <th>Role</th>
                <th>Location</th>
                <th>Status</th>
                <th>Applied Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>

<%
List<Application> list = (List<Application>) request.getAttribute("applications");

if (list != null && !list.isEmpty()) {
    int srNo = 1;

    for (Application app : list) {

        String badgeClass = "bg-primary";

        if (app.getStatus().equalsIgnoreCase("Interview")) {
            badgeClass = "bg-warning text-dark";
        } 
        else if (app.getStatus().equalsIgnoreCase("Selected")) {
            badgeClass = "bg-success";
        } 
        else if (app.getStatus().equalsIgnoreCase("Rejected")) {
            badgeClass = "bg-danger";
        }
%>
        <tr>
            <td><%= srNo++ %></td>
            <td><%= app.getCompany() %></td>
            <td><%= app.getRole() %></td>
            <td><%= app.getLocation() %></td>
            <td>
                <span class="badge <%= badgeClass %>">
                    <%= app.getStatus() %>
                </span>
            </td>
            <td><%= app.getAppliedDate() %></td>
            <td>
                <a href="edit?id=<%= app.getId() %>" class="btn btn-sm btn-warning">Edit</a>
                <a href="delete?id=<%= app.getId() %>"
                   class="btn btn-sm btn-danger"
                   onclick="return confirm('Are you sure you want to delete?');">
                   Delete
                </a>
            </td>
        </tr>
<%
    }
} else {
%>
        <tr>
            <td colspan="7" class="text-center">No Applications Found</td>
        </tr>
<%
}
%>

        </tbody>
    </table>

    <div class="text-center mt-4">
        <a href="view" class="btn btn-secondary">Reset Filters</a>
        <a href="dashboard.jsp" class="btn btn-primary">Back to Dashboard</a>
    </div>
</div>

</body>
</html>