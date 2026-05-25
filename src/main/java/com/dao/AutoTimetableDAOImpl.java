package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.util.DBConnection;
import com.model.TimeSlot;
import com.model.TimetableResult;
import com.model.TimetableSlot;

public class AutoTimetableDAOImpl implements AutoTimetableDAO {
	
	private static final String SELECT_CLASS_INFO =
		    "SELECT sem, dept_id FROM classes_name WHERE class_id = ?";

	private static final String INSERT_TIMETABLE_SLOT = 
	        "INSERT INTO timetable (class_id, day, lecture_name, slot_start_time, " +
	        "slot_end_time, faculty_id, semester_type) VALUES (?, ?, ?, ?, ?, ?, ?)";
	
	private static final String TRANSFER_DATA = 
			"INSERT INTO time_table(sem, day, " + 
			"time_slot, sub_id, fac_id, dept_id) VALUES(?,?,?,?,?,?)";
	    
	private static final String SELECT_BY_CLASS =
		    "SELECT t.*, c.class_name FROM timetable t " +
		    "JOIN classes_name c ON t.class_id = c.class_id " +
		    "WHERE c.class_name = ? " +
		    "ORDER BY t.day, t.slot_start_time";
	    
	private static final String SHOW_ALL_TIMETABLE =
		    "SELECT t.*, c.class_name, f.username as faculty_name FROM timetable t " +
		    "JOIN classes_name c ON t.class_id = c.class_id " +
		    "JOIN faculties f ON t.faculty_id = f.fac_id " +
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
		public boolean confirmTimetable(TimetableResult timetableResult) throws SQLException {
			
			Connection conn = null;
	        PreparedStatement ps = null;
	        PreparedStatement ps1 = null;
	        ResultSet rs1 = null;
	        
	        try {
	            conn = DBConnection.getConnection();
	            conn.setAutoCommit(false); // Start transaction
	            
	            ps = conn.prepareStatement(TRANSFER_DATA);
	            ps1 = conn.prepareStatement(SELECT_CLASS_INFO );
	            
	            List<TimetableSlot> slots = timetableResult.getScheduledSlots();
	            
	            int batchSize = 0;
	            
	            // Use batch insert for better performance
	            for (TimetableSlot slot : slots) {
	                
	            	int classId = slot.getClassId();
	            	ps1.setInt(1, classId);
	            	rs1 = ps1.executeQuery();
	            	
	            	if (rs1.next()) {
	            	    String sem = rs1.getString("sem");
	            	    String dept_id = rs1.getString("dept_id");
	            	    
	            	    ps.setString(1, sem);
	            	    ps.setString(2, slot.getDay());
	            	    
	            	    TimeSlot timeSlot = slot.getSlot();
	            	    String ttslot = Time.valueOf(timeSlot.getStartTime()).toString() + "-" + 
	            	                    Time.valueOf(timeSlot.getEndTime()).toString();
	            	    ps.setString(3, ttslot);
	            	    
	            	    ps.setString(4, slot.getLectureName());
	            	    ps.setInt(5, slot.getFacultyId());
	            	    ps.setString(6, dept_id);
	            	    
	            	    ps.addBatch();
	            	    batchSize++;
	            	    
	            	    if (batchSize % 100 == 0) {
	            	        ps.executeBatch();
	            	        batchSize = 0;
	            	    }
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
	            ps1.close();
	            rs1.close();
	        }
	        
		}
	
}
