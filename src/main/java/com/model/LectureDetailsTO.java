package com.model;

public interface LectureDetailsTO {
	
	String getSubjectType();
	void setSubjectType(String subjectType);

	int getFrequency();
	void setFrequency(int frequency);
	
	String getSubjectShortName();
	void setSubjectShortName(String subjectShortName);
	
	int getFacultyId();
	void setFacultyId(int facultyName);
	
	int getDeptId();
	void setDeptId(int deptId);
	
	int getClassId();
	void setClassId(int classId);
	
	String getSemester();
	void setSemester(String Semester);
	
}
