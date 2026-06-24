package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.model.Timetable;
import com.util.DBConnection;

public class TimetableDaoImpl implements TimetableDao {

	
	
	
	public boolean addTimetable(Timetable t) {
                 boolean status=false;
                 int x=0;
        try (		  Connection con = DBConnection.getConnection();
        		 PreparedStatement ps1 = con.prepareStatement("select faculty_id from subjects where sub_abbr= '"+t.getSub_abbr()+"' AND dept_id= "+t.getDept_id()+";");
           	 ResultSet rs1 = ps1.executeQuery();
               ){
        	
        	 while (rs1.next()) {
            	 t.setFac_id(rs1.getInt("faculty_id"));
             }
        	
        	 String query = "INSERT INTO time_table(sem, day, time_slot, sub_abbr, fac_id, room_id, dept_id, year) VALUES(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, t.getSem());
            ps.setString(2, t.getDay());
            ps.setString(3, t.getTime_slot());
            ps.setString(4, t.getSub_abbr());
            ps.setInt(5, t.getFac_id());
            ps.setInt(6, t.getRoom_id());
            ps.setInt(7, t.getDept_id());
            ps.setString(8, t.getYear());
            x= ps.executeUpdate();
            if(x!=0)
            	status=true;
            
            
        } catch (Exception e) { e.printStackTrace(); }
        return status;
    }

    public List<Timetable> getAllTimetables() {
       
    	String query = "SELECT * FROM time_table";
        List<Timetable> list = new ArrayList<>();
        try (    	  Connection con = DBConnection.getConnection();
        		 PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();
               ){
            while (rs.next()) {
                Timetable t = new Timetable();
                t.setTt_id(rs.getInt(1));
                t.setSem(rs.getString(2));
                t.setDay(rs.getString(3));
                t.setTime_slot(rs.getString(4));
                t.setSub_abbr(rs.getString(5));
                t.setFac_id(rs.getInt(6));
                t.setRoom_id(rs.getInt(7));
                t.setDept_id(rs.getInt(8));
                t.setYear(rs.getString(9));
                list.add(t);
            }
        } catch (Exception e) {e.printStackTrace(); }
        return list;
    }

    public Timetable getTimetableById(int id) {
          String q = "SELECT * FROM time_table WHERE tt_id=?";

        Timetable t = null;
        try(    	  Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(q);
) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                t = new Timetable();
                t.setTt_id(rs.getInt(1));
                t.setSem(rs.getString(2));
                t.setDay(rs.getString(3));
                t.setTime_slot(rs.getString(4));
                t.setSub_abbr(rs.getString(5));
                t.setFac_id(rs.getInt(6));
                t.setRoom_id(rs.getInt(7));
                t.setDept_id(rs.getInt(8));
                t.setYear(rs.getString(9));
            }
        } catch (Exception e) {e.printStackTrace(); }
        return t;
    }

    public boolean updateTimetable(Timetable t) {
    	  boolean status=false;
          int x=0;
        try(    	  Connection con = DBConnection.getConnection();
        		 PreparedStatement ps1 = con.prepareStatement("select faculty_id from subjects where sub_abbr= '"+t.getSub_abbr()+"' AND dept_id="+t.getDept_id()+";");
           	 ResultSet rs1 = ps1.executeQuery();
               ) {
        	
        	 while (rs1.next()) {
            	 t.setFac_id(rs1.getInt("faculty_id"));
             }
        	
            String query = "UPDATE time_table SET sem=?, day=?, time_slot=?, sub_abbr=?, fac_id=?, room_id=?, dept_id=?, year=? WHERE tt_id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, t.getSem());
            ps.setString(2, t.getDay());
            ps.setString(3, t.getTime_slot());
            ps.setString(4, t.getSub_abbr());
            ps.setInt(5, t.getFac_id());
            ps.setInt(6, t.getRoom_id());
            ps.setInt(7, t.getDept_id());
            ps.setString(8, t.getYear());
            ps.setInt(9, t.getTt_id());
            
            x= ps.executeUpdate() ;
           
            if(x!=0)
            	status=true;
        } catch (Exception e) { e.printStackTrace();}
        return status;
    }

    public boolean deleteTimetable(int id) {
          String query = "DELETE FROM time_table WHERE tt_id=?";

	    	  boolean status=false;
	          int x=0;
	        try(    	  Connection con = DBConnection.getConnection();
	                PreparedStatement ps = con.prepareStatement(query);
	        		) {
	            ps.setInt(1, id);
	            x= ps.executeUpdate() ;
	            if(x!=0)
	            	status=true;
	        } catch (Exception e) { e.printStackTrace();}
	        return status;
	    }

	public boolean deleteAllTimetableRecords() {
		String query = "DELETE FROM time_table";
		
		boolean status=false;
		int x=0;
		
		try(    	  Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
        		) {
            x= ps.executeUpdate() ;
            if(x!=0)
            	status=true;
        } catch (Exception e) { e.printStackTrace();}

		return status;
	}
	
	public boolean finalizeTimetable(){
		String query = 
				"INSERT INTO final_timetable(class_id, day, lecture_name, slot_start_time, " +
				"slot_end_time, faculty_id) VALUES(?,?,?,?,?,?)";
		Connection conn = null;
	    PreparedStatement ps = null;

	    try {
	        conn = DBConnection.getConnection();
	        conn.setAutoCommit(false);
	        
	        // Clear old data first
	        Statement dltSt = conn.createStatement();
	        dltSt.executeUpdate("DELETE FROM final_timetable");
	        dltSt.close();
	    		
	        Statement st = conn.createStatement();
	        ResultSet rs = st.executeQuery(
	        		"SELECT tt.*, c.class_id AS class_id FROM time_table tt JOIN classes_name c " +
	        		"ON c.sem = tt.sem AND c.dept_id = tt.dept_id"
	        	);
	        ps = conn.prepareStatement(query);
	        int batchSize = 0;

	        while (rs.next()) {
	        		int class_id = rs.getInt("class_id");
	        		String day = rs.getString("day");
	        		String lecture_name = rs.getString("sub_abbr");
	        		
	        		java.time.LocalTime slot_start_time = null;
	        		java.time.LocalTime slot_end_time = null;
	        		
	        		String rawTimeString = rs.getString("time_slot");
	        		if (rawTimeString != null && !rawTimeString.trim().isEmpty()) {
	        			String[] parts = rawTimeString.split("-");
	        			String startTimeStr = parts[0].trim();
	        		    String endTimeStr = parts[1].trim();
	        		    slot_start_time = java.time.LocalTime.parse(startTimeStr);
	        		    slot_end_time = java.time.LocalTime.parse(endTimeStr);
	        		}
	        		int fac_id = rs.getInt("fac_id");
	        		
	        		ps.setInt(1, class_id);
		        ps.setString(2, day);
		        ps.setString(3, lecture_name);
		        ps.setObject(4, slot_start_time);
		        ps.setObject(5, slot_end_time);
		        ps.setInt(6, fac_id);

		        ps.addBatch();
		        batchSize++;

		        if (batchSize % 100 == 0) {
		            ps.executeBatch();
		            batchSize = 0;
		        }
		    }

		    if (batchSize > 0) ps.executeBatch();
		    conn.commit();
		    return true;
		    
	    } catch (SQLException e) {
	        e.printStackTrace();
	        if (conn != null) { try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); } }
	        return false;
	    } finally {
	        DBConnection.clean(ps, conn);
	    }
	}
	
    @Override
    public List<Timetable> getTodaySchedule(int facId) {

        List<Timetable> list = new ArrayList<>();

        String today =
            java.time.LocalDate.now()
            .getDayOfWeek()
            .getDisplayName(
                java.time.format.TextStyle.FULL,
                java.util.Locale.ENGLISH);

        try(Connection con =
                DBConnection.getConnection()) {

            String sql =
                "SELECT * FROM time_table " +
                "WHERE fac_id=? " +
                "AND UPPER(day)=UPPER(?)";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, facId);
            ps.setString(2, today);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Timetable t = new Timetable();

                t.setTt_id(rs.getInt("tt_id"));
                t.setSem(rs.getString("sem"));
                t.setDay(rs.getString("day"));
                t.setTime_slot(rs.getString("time_slot"));
                t.setSub_abbr(rs.getString("sub_abbr"));
                t.setFac_id(rs.getInt("fac_id"));
                t.setRoom_id(rs.getInt("room_id"));
                t.setDept_id(rs.getInt("dept_id"));
                t.setYear(rs.getString("year"));

                list.add(t);
            }

        } catch(Exception e) {
            e.printStackTrace();
        }

        return list;
    }
   

}
