package com.model;

public class LectureDetailsImpl implements LectureDetailsTO {

	private String subjectShortName;
	private int FacultyId;
	private String semester;
	private int deptId;
	private String subjectType;
	private int frequency;
	private int classId;

	public int getClassId() { return classId; }
	public void setClassId(int classId) { this.classId = classId; }

	public int getFrequency() {
		return frequency; 
	}
	public void setFrequency(int frequency) {
		this.frequency = frequency; 
	}
	public String getSubjectShortName() {
		return subjectShortName;
	}
	public void setSubjectShortName(String subjectShortName) {
		this.subjectShortName = subjectShortName;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	public int getFacultyId() {
		return FacultyId;
	}
	public void setFacultyId(int facultyId) {
		FacultyId = facultyId;
	}
	public String getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(String subjectType) {
		this.subjectType = subjectType;
	}
	
}
