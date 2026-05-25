package com.dao;

import java.sql.*;

import com.model.LectureDetailsImpl;

public class LectureDetailsRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		LectureDetailsImpl ldto=new LectureDetailsImpl();
		
		ldto.setSubjectShortName(rs.getString("sub_abbr"));
		ldto.setFacultyId(rs.getInt("faculty_id"));
		ldto.setDeptId(rs.getInt("dept_id"));
		ldto.setSemester(rs.getString("sem"));
		ldto.setClassId(rs.getInt("class_id"));
		ldto.setSubjectType(rs.getString("subject_type"));
		ldto.setFrequency(rs.getInt("frequency"));
		
		return ldto;
	}

}
