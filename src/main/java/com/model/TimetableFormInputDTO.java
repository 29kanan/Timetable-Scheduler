package com.model;

public class TimetableFormInputDTO {
	private String semType;
	private String mandLectureName;
	private String mandLectureSlot;
	private String mandLectureFacultyName;
	private int lecDuration;
	private int numOfBreaks;
	private int[] breaksDuration;
	
	public String getSemType() {
		return semType;
	}
	public void setSemType(String semType) {
		this.semType = semType;
	}
	public String getMandLectureName() {
		return mandLectureName;
	}
	public void setMandLectureName(String mandLectureName) {
		this.mandLectureName = mandLectureName;
	}
	public String getMandLectureSlot() {
		return mandLectureSlot;
	}
	public void setMandLectureTime(String mandLectureSlot) {
		this.mandLectureSlot = mandLectureSlot;
	}
	public int getLecDuration() {
		return lecDuration;
	}
	public void setLecDuration(int lecDuration) {
		this.lecDuration = lecDuration;
	}
	public int[] getBreaksDuration() {
		return breaksDuration;
	}
	public void setBreaksDuration(int[] breaksDuration) {
		this.breaksDuration = breaksDuration;
	}
	public int getNumOfBreaks() {
		return numOfBreaks;
	}
	public void setNumOfBreaks(int numOfBreaks) {
		this.numOfBreaks = numOfBreaks;
	}
	public String getMandLectureFacultyName() {
		return mandLectureFacultyName;
	}
	public void setMandLectureFacultyName(String mandLectureFacultyName) {
		this.mandLectureFacultyName = mandLectureFacultyName;
	}
}
