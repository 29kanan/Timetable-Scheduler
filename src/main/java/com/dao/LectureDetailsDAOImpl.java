package com.dao;

import com.util.DBConnection;
import com.model.LectureDetailsImpl;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class LectureDetailsDAOImpl implements LectureDetailsDAO {
	
	private static final String SELECT_ALGORITHM_INPUT="Select c.class_id, s.sub_abbr, s.faculty_id, s.sem," + 
			"s.dept_id, s.subject_type, s.frequency "+
			"from classes_name as c "+
			"join Subjects as s on s.sem=c.sem and s.dept_id=c.dept_id "+
			"where s.sem in (?,?,?,?,?) "+
		   	"AND s.frequency IS NOT NULL "+
			"order by class_name";
	private static final String SELECT_TOTAL_FACULTY="SELECT COUNT(DISTINCT faculty_id) AS num_of_faculty FROM Subjects WHERE sem in (?,?,?,?,?)";
	private static final String SELECT_TOTAL_LEC="SELECT COUNT(*) AS num_of_labs FROM Subjects WHERE sem in (?,?,?,?,?)";
	private final RowMapper mapper=new LectureDetailsRowMapper();
	
	private void setSemesterParameters(PreparedStatement ps, String semType) throws SQLException {
	    if(semType.equals("odd")) {
	        ps.setString(1, "1A");
	        ps.setString(2, "1B");  // FIXED: was "1A"
	        ps.setString(3, "3");
	        ps.setString(4, "5");
	        ps.setString(5, "7");
	    }
	    else if(semType.equals("even")){
	        ps.setString(1, "2A");
	        ps.setString(2, "2B");  // FIXED: was "2A"
	        ps.setString(3, "4");
	        ps.setString(4, "6");
	        ps.setString(5, "8");
	    }
	}
	
	@Override
	public int getTotalFaculty(String semType) {
		
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int totalFaculty = 0;
		
		try {
			conn=DBConnection.getConnection();
			
//			if (conn == null) {
//			    System.err.println("DEBUG CHECK: Connection 'conn' is null after BasicDataSourceUtil.getConnection(). THE DATABASE CONFIGURATION IS THE PROBLEM.");
//			    throw new SQLException("Connection Failed at Source.");
//			}
			
			ps=conn.prepareStatement(SELECT_TOTAL_FACULTY);
			
			setSemesterParameters(ps,semType);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				totalFaculty=rs.getInt("num_of_faculty");
					
			}	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.clean(rs,ps,conn);
		}
		
		return totalFaculty;
		
	}

	@Override
	public List<LectureDetailsImpl> getLecturesBySemester(String semType) {
		
		List<LectureDetailsImpl> lecDetails = new ArrayList<LectureDetailsImpl>();
		int rowNum=0;
		
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		try {
			
			conn=DBConnection.getConnection();
			ps=conn.prepareStatement(SELECT_ALGORITHM_INPUT);
			
			setSemesterParameters(ps,semType);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				lecDetails.add((LectureDetailsImpl)mapper.mapRow(rs, rowNum++));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		finally {
			DBConnection.clean(rs,ps,conn);
		}
		
		return lecDetails;
	}


	@Override
	public int getTotalLectures(String semType) {
		Connection conn=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		int totalLabLecture = 0;
		
		try {
			conn=DBConnection.getConnection();
			ps=conn.prepareStatement(SELECT_TOTAL_LEC);
			
			System.out.println("DEBUG - SQL Query: " + SELECT_TOTAL_LEC);
			
			setSemesterParameters(ps,semType);
			
			rs=ps.executeQuery();
			
			while(rs.next()) {
				
				totalLabLecture=rs.getInt("num_of_labs");
					
			}	
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			DBConnection.clean(rs,ps,conn);
		}
		
		return totalLabLecture;
	}
	
}
