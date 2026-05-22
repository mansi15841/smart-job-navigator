package com.jobtracker.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jobtracker.model.Application;

public class ApplicationDAO {

    // ✅ Save Method
    public void save(Application app) {

        String sql =
            "INSERT INTO applications (company, role, location, status, applied_date) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, app.getCompany());
            ps.setString(2, app.getRole());
            ps.setString(3, app.getLocation());
            ps.setString(4, app.getStatus());
            ps.setDate(5, app.getAppliedDate());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Get All Applications
    public List<Application> getAllApplications() {

        List<Application> list = new ArrayList<>();

        String sql = "SELECT * FROM applications ORDER BY id ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Application app = new Application(
                        rs.getInt("id"),
                        rs.getString("company"),
                        rs.getString("role"),
                        rs.getString("location"),
                        rs.getString("status"),
                        rs.getDate("applied_date")
                );

                list.add(app);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ✅ Delete Application
    public void deleteApplication(int id) {

        String sql = "DELETE FROM applications WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ✅ Get Application By ID
    public Application getApplicationById(int id) {

        Application app = null;
        String sql = "SELECT * FROM applications WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                app = new Application(
                    rs.getInt("id"),
                    rs.getString("company"),
                    rs.getString("role"),
                    rs.getString("location"),
                    rs.getString("status"),
                    rs.getDate("applied_date")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return app;
    }

    // ✅ Update Application
    public void updateApplication(int id, String company, String role,
                                  String location, String status,
                                  java.sql.Date appliedDate) {

        String sql = "UPDATE applications SET company=?, role=?, location=?, status=?, applied_date=? WHERE id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, company);
            ps.setString(2, role);
            ps.setString(3, location);
            ps.setString(4, status);
            ps.setDate(5, appliedDate);
            ps.setInt(6, id);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 🚀 Dashboard: Total Count
    public int getTotalApplications() {

        String sql = "SELECT COUNT(*) FROM applications";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // 🚀 Dashboard: Count By Status
    public int getCountByStatus(String status) {

        String sql = "SELECT COUNT(*) FROM applications WHERE status=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, status);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    // 🚀 NEW FEATURE: Search + Filter
    public List<Application> searchApplications(String company, String status, String location) {

        List<Application> list = new ArrayList<>();

        String sql = "SELECT * FROM applications " +
                     "WHERE company LIKE ? " +
                     "AND status LIKE ? " +
                     "AND location LIKE ? " +
                     "ORDER BY id ASC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, "%" + company + "%");
            ps.setString(2, "%" + status + "%");
            ps.setString(3, "%" + location + "%");

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    Application app = new Application(
                            rs.getInt("id"),
                            rs.getString("company"),
                            rs.getString("role"),
                            rs.getString("location"),
                            rs.getString("status"),
                            rs.getDate("applied_date")
                    );

                    list.add(app);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}