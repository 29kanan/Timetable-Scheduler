package com.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.util.DBConnection;

public class ForgotPasswordDAOImpl implements ForgotPasswordDAO {

    @Override
    public boolean verifyEmailAndPhone(String email, String phone) {

        boolean status = false;
        String query = "SELECT fac_id FROM login_teacher WHERE email = ? AND phone = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, email);
            ps.setString(2, phone);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                status = true; 
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

   
    @Override
    public boolean updatePassword(String email, String newPassword) {

        boolean status = false;
        String query = "UPDATE login_teacher SET password = ? WHERE email = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, newPassword);
            ps.setString(2, email);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true; 
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}