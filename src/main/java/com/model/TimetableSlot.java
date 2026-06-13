package com.model;

public class TimetableSlot {

	private String day;
	private TimeSlot slot;
	private String lectureName;
	private int facultyId;
	private int classId;
	private String className;
	private String facultyName;

	public String getFacultyName() {
		return facultyName; 
	}
	
	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName; 
	}

	public int getClassId() {
		return classId; 
	}
	
	public void setClassId(int classId) {
		this.classId = classId; 
	}
	
	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public TimeSlot getSlot() {
		return slot;
	}

	public void setSlot(TimeSlot slot) {
		this.slot = slot;
	}

	public String getLectureName() {
		return lectureName;
	}

	public void setLectureName(String lectureName) {
		this.lectureName = lectureName;
	}

	@Override
	public String toString() {
	    return day + " " + slot.toString() + " " + facultyId + " " + lectureName + " classId=" + classId;
	}

	public int getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(int facultyId) {
		this.facultyId = facultyId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
	
}
