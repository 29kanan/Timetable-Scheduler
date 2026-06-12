package com.dao;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.Notification;
import com.util.DBConnection;

public class NotificationDaoImpl implements NotificationDAO {

	    // Insert Notification
	    public boolean addNotification(Notification n) {

	        boolean status = false;

	        try {
	            Connection con = DBConnection.getConnection();

	            String sql =
	                "INSERT INTO notifications(title,message,target_role) VALUES(?,?,?)";

	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, n.getTitle());
	            ps.setString(2, n.getMessage());
	            ps.setString(3, n.getTargetRole());

	            int rows = ps.executeUpdate();

	            if (rows > 0) {
	                status = true;
	            }

	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return status;
	    }

	    // Get Notifications by Role
	    public List<Notification> getNotificationsByRole(String role) {

	        List<Notification> list = new ArrayList<>();

	        try {

	            Connection con = DBConnection.getConnection();

	            String sql =
	                "SELECT * FROM notifications WHERE target_role=? OR target_role='ALL' ORDER BY created_at DESC";

	            PreparedStatement ps = con.prepareStatement(sql);

	            ps.setString(1, role);

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {

	                Notification n = new Notification();

	                n.setId(rs.getInt("id"));
	                n.setTitle(rs.getString("title"));
	                n.setMessage(rs.getString("message"));
	                n.setTargetRole(rs.getString("target_role"));
	                //n.setCreatedAt(rs.getString("created_at"));

	                n.setCreatedAt(
		                    rs.getTimestamp("created_at")
		                      .toLocalDateTime()
		                      .format(
		                        java.time.format.DateTimeFormatter
		                        .ofPattern("dd MMM yyyy hh:mm a")
		                      )
		                );
	                
	                list.add(n);
	            }

	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
	    
	    
	    public List<Notification> getAllNotification() {

	        List<Notification> list = new ArrayList<>();

	        try(Connection con = DBConnection.getConnection();
) {


	            String sql =
	                "SELECT * FROM notifications ORDER BY created_at DESC";

	            PreparedStatement ps =
	                con.prepareStatement(sql);

	            ResultSet rs = ps.executeQuery();

	            while (rs.next()) {

	                Notification n = new Notification();

	                n.setId(rs.getInt("id"));
	                n.setTitle(rs.getString("title"));
	                n.setMessage(rs.getString("message"));
	                n.setTargetRole(rs.getString("target_role"));

	                n.setCreatedAt(
	                    rs.getTimestamp("created_at")
	                      .toLocalDateTime()
	                      .format(
	                        java.time.format.DateTimeFormatter
	                        .ofPattern("dd MMM yyyy hh:mm a")
	                      )
	                );

	                list.add(n);
	            }

	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return list;
	    }
	    
	    
	    public boolean deleteNotification(int id) {

	        boolean status = false;
	        String sql =
	                "DELETE FROM notifications WHERE id=?";


	        try( Connection con =
	                DBConnection.getConnection();
	        		 PreparedStatement ps =
	     	                con.prepareStatement(sql);
                 ) {

	           
	            
	           
	            ps.setInt(1, id);

	            int rows = ps.executeUpdate();

	            if (rows > 0) {
	                status = true;
	            }

	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return status;
	    }
	    
	    public int getLatestNotificationIdByRole(String role) {

	        int latestId = 0;

	        try {

	            Connection con =
	                DBConnection.getConnection();

	            String sql =
	                "SELECT MAX(id) FROM notifications " +
	                "WHERE target_role=? OR target_role='ALL'";

	            PreparedStatement ps =
	                con.prepareStatement(sql);

	            ps.setString(1, role);

	            ResultSet rs = ps.executeQuery();

	            if(rs.next()) {

	                latestId = rs.getInt(1);
	            }

	            con.close();

	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return latestId;
	    }
	    
	    
	}