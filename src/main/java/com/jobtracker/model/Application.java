package com.jobtracker.model;

public class Application {

    private int id;  // ✅ Added for view/edit/delete feature
    private String company;
    private String role;
    private String location;
    private String status;
    private java.sql.Date applied_date;

    // ✅ Constructor used while inserting (already working)
    public Application(String company, String role, String location,
                       String status, java.sql.Date applied_date) {

        this.company = company;
        this.role = role;
        this.location = location;
        this.status = status;
        this.applied_date = applied_date;
    }

    // ✅ NEW constructor (used while fetching from DB)
    public Application(int id, String company, String role,
                       String location, String status,
                       java.sql.Date applied_date) {

        this.id = id;
        this.company = company;
        this.role = role;
        this.location = location;
        this.status = status;
        this.applied_date = applied_date;
    }

    // ✅ Getters
    public int getId() {
        return id;
    }

    public String getCompany() {
        return company;
    }

    public String getRole() {
        return role;
    }

    public String getLocation() {
        return location;
    }

    public String getStatus() {
        return status;
    }

    public java.sql.Date getAppliedDate() {
        return applied_date;
    }
}
