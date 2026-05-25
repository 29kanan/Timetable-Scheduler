package com.dao;

import java.sql.SQLException;
import java.util.List;

import com.model.TimetableResult;
import com.model.TimetableSlot;

public interface AutoTimetableDAO {
	
	boolean confirmTimetable(TimetableResult timetableResult) throws SQLException;

	// Save complete timetable result
    boolean saveTimetable(TimetableResult timetableResult);
    
    // Save individual timetable slot
    //boolean saveTimetableSlot(TimetableSlot slot, String semesterType);
    
    // Get all timetable slots for a specific class
    List<TimetableSlot> getTimetableByClass(String className);
    
    // Get all timetable slots for a specific day
    List<TimetableSlot> getTimetableByDay(String day);
    
    public List<TimetableSlot> showAllTimetable();
    
    // Delete all timetable data (for regeneration)
    //boolean deleteAllTimetable();
    
    // Delete timetable for specific semester
    //boolean deleteTimetableBySemester(String semesterType);
	
}
