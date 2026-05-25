package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;

import com.model.TimeSlot;
import com.model.TimetableSlot;

public class TimetableRowMapper implements RowMapper {

	@Override
	public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
		TimetableSlot slot = new TimetableSlot();
        
		slot.setClassId(rs.getInt("class_id"));
		slot.setClassName(rs.getString("class_name"));
        slot.setDay(rs.getString("day"));
        slot.setLectureName(rs.getString("lecture_name"));
        slot.setFacultyId(rs.getInt("faculty_id"));
        slot.setFacultyName(rs.getString("faculty_name"));
        
        Time startTime = rs.getTime("slot_start_time");
        Time endTime = rs.getTime("slot_end_time");
        
        TimeSlot timeSlot = new TimeSlot();
        timeSlot.setStartTime(startTime.toLocalTime());
        timeSlot.setEndTime(endTime.toLocalTime());
        
        slot.setSlot(timeSlot);
        
        return slot;
	}

}
