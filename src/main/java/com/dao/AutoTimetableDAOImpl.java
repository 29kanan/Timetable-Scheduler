package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConnection;
import com.model.TimeSlot;
import com.model.TimetableResult;
import com.model.TimetableSlot;

public class AutoTimetableDAOImpl implements AutoTimetableDAO {

	private static final String INSERT_TIMETABLE_SLOT = 
	        "INSERT INTO timetable (class_id, day, lecture_name, slot_start_time, " +
	        "slot_end_time, faculty_id, semester_type) VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	private static final String TRANSFER_DATA = 
			"INSERT INTO time_table(sem, day, " + 
			"time_slot, sub_abbr, fac_id, dept_id, year) VALUES(?,?,?,?,?,?,?)";
	    
	private static final String SELECT_BY_CLASS =
		    "SELECT t.*, c.class_name FROM timetable t " +
		    "JOIN classes_name c ON t.class_id = c.class_id " +
		    "WHERE c.class_name = ? " +
		    "ORDER BY t.day, t.slot_start_time";
	    
	private static final String SHOW_ALL_TIMETABLE =
		    "SELECT t.*, c.class_name, f.username as faculty_name FROM timetable t " +
		    "JOIN classes_name c ON t.class_id = c.class_id " +
		    "JOIN login_teacher f ON t.faculty_id = f.fac_id " +
		    "ORDER BY c.class_name, t.day, t.slot_start_time";
	    
	    private static final String SELECT_BY_DAY =
	    	    "SELECT t.*, c.class_name FROM timetable t " +
	    	    "JOIN classes_name c ON t.class_id = c.class_id " +
	    	    "WHERE t.day = ? " +
	    	    "ORDER BY c.class_name, t.slot_start_time";
//	    private static final String DELETE_ALL = "DELETE FROM timetable";
//	    
//	    private static final String DELETE_BY_SEMESTER = 
//	        "DELETE FROM timetable WHERE semester_type = ?";
	    
	    private final RowMapper mapper = new TimetableRowMapper();
	    
	    
	    @Override
	    public boolean saveTimetable(TimetableResult timetableResult) {
	        Connection conn = null;
	        PreparedStatement ps = null;
	        
	        try {
	            conn = DBConnection.getConnection();
	            conn.setAutoCommit(false); // Start transaction
	            Statement delStmt = null;
	            
	            delStmt = conn.createStatement();
	            delStmt.executeUpdate("DELETE FROM timetable");
	            
	            ps = conn.prepareStatement(INSERT_TIMETABLE_SLOT);
	            
	            List<TimetableSlot> slots = timetableResult.getScheduledSlots();
	            String semesterType = timetableResult.getSemesterType();
	            
	            int batchSize = 0;
	            
	            // Use batch insert for better performance
	            for (TimetableSlot slot : slots) {
	                
	            	ps.setInt(1, slot.getClassId());
	                ps.setString(2, slot.getDay());
	                ps.setString(3, slot.getLectureName());
	                
	                TimeSlot timeSlot = slot.getSlot();
	                ps.setTime(4, Time.valueOf(timeSlot.getStartTime()));
	                ps.setTime(5, Time.valueOf(timeSlot.getEndTime()));
	                
	                ps.setInt(6, slot.getFacultyId());
	                ps.setString(7, semesterType);
	                
	                ps.addBatch();
	                batchSize++;
	                
	                // Execute batch every 100 records for memory efficiency
	                if (batchSize % 100 == 0) {
	                    ps.executeBatch();
	                    batchSize = 0;
	                }
	            }
	            
	            // Execute remaining batch
	            if (batchSize > 0) {
	                ps.executeBatch();
	            }
	            
	            conn.commit(); // Commit transaction
	            
	            System.out.println("✓ Successfully saved " + slots.size() + 
	                             " timetable slots to database");
	            return true;
	            
	        } catch (SQLException e) {
	            System.err.println("Error saving timetable to database");
	            e.printStackTrace();
	            
	            // Rollback on error
	            if (conn != null) {
	                try {
	                    conn.rollback();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            return false;
	            
	        } finally {
	        	DBConnection.clean(ps, conn);
	        }
	    }
	    
	    @Override
	    public List<TimetableSlot> getTimetableByClass(String className) {
	        List<TimetableSlot> timetableSlots = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int rowNum = 0;
	        
	        try {
	            conn = DBConnection.getConnection();
	            ps = conn.prepareStatement(SELECT_BY_CLASS);
	            ps.setString(1, className);
	            
	            rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                timetableSlots.add((TimetableSlot) mapper.mapRow(rs, rowNum++));
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        	DBConnection.clean(rs, ps, conn, null);
	        }
	        
	        return timetableSlots;
	    }
	    
	    
	    @Override
	    public List<TimetableSlot> getTimetableByDay(String day) {
	        List<TimetableSlot> timetableSlots = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int rowNum = 0;
	        
	        try {
	            conn = DBConnection.getConnection();
	            ps = conn.prepareStatement(SELECT_BY_DAY);
	            ps.setString(1, day);
	            
	            rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                timetableSlots.add((TimetableSlot) mapper.mapRow(rs, rowNum++));
	            }
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	        	DBConnection.clean(rs, ps, conn);
	        }
	        
	        return timetableSlots;
	    }

		@Override
		public List<TimetableSlot> showAllTimetable() {
			List<TimetableSlot> timetableSlots = new ArrayList<>();
	        Connection conn = null;
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        int rowNum = 0;
	        
	        try {
		        conn=DBConnection.getConnection();
				ps=conn.prepareStatement(SHOW_ALL_TIMETABLE);
				rs=ps.executeQuery();
				
				while (rs.next()) {
	                timetableSlots.add((TimetableSlot) mapper.mapRow(rs, rowNum++));
	            }
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBConnection.clean(rs, ps, conn);
	        }
	        
			return timetableSlots;
		}

		@Override
		public boolean confirmTimetable() throws SQLException {
		    Connection conn = null;
		    PreparedStatement ps = null;

		    try {
		        conn = DBConnection.getConnection();
		        conn.setAutoCommit(false);

		        // Read from timetable table
		        Statement st = conn.createStatement();
		        ResultSet rs = st.executeQuery(
		            "SELECT t.*, c.sem, c.dept_id FROM timetable t " +
		            "JOIN classes_name c ON t.class_id = c.class_id"
		        );

		        ps = conn.prepareStatement(TRANSFER_DATA);
		        int batchSize = 0;

		        while (rs.next()) {
		            String sem = rs.getString("sem");
		            String dept_id = rs.getString("dept_id");
		            String day = rs.getString("day");
		            String startTime = rs.getString("slot_start_time");
		            String endTime = rs.getString("slot_end_time");
		            String ttslot = startTime + "-" + endTime;
		            String lectureName = rs.getString("lecture_name");
		            int facultyId = rs.getInt("faculty_id");

		            ps.setString(1, sem);
		            ps.setString(2, day);
		            ps.setString(3, ttslot);
		            ps.setString(4, lectureName);
		            ps.setInt(5, facultyId);
		            ps.setString(6, dept_id);
		            ps.setString(7, "2025-26");

		            ps.addBatch();
		            batchSize++;

		            if (batchSize % 100 == 0) {
		                ps.executeBatch();
		                batchSize = 0;
		            }
		        }

		        if (batchSize > 0) ps.executeBatch();
		        conn.commit();
		        System.out.println("✓ Timetable confirmed successfully");
		        return true;

		    } catch (SQLException e) {
		        e.printStackTrace();
		        if (conn != null) { try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); } }
		        return false;
		    } finally {
		        DBConnection.clean(ps, conn);
		    }
		}
	
}
