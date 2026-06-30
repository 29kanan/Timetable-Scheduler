package com.dao;

import java.util.List;

import com.model.Timetable;

public interface TimetableDao {

	boolean addTimetable(Timetable t);
	List<Timetable> getAllTimetables();
	Timetable getTimetableById(int id);
	boolean updateTimetable(Timetable t);
	boolean deleteTimetable(int id);

	boolean deleteAllTimetableRecords();
	boolean finalizeTimetable();

	List<Timetable> getTodaySchedule(int facId);
	
}
