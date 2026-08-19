package com.model;

import java.time.LocalTime;
import java.util.List;

public class TimetableFormInputDTO {
	private String semType;
	private String mandLectureFacultyName;
	private int lecDuration;
	private int numOfBreaks;
	private int[] breaksDuration;
	private LocalTime startTime;
	private int numOfLectures;
	private List<String> workingDays;
	
	public String getSemType() {
		return semType;
	}
	public void setSemType(String semType) {
		this.semType = semType;
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
	public LocalTime getStartTime() {
		return startTime;
	}
	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}
	public int getNumOfLectures() {
		return numOfLectures;
	}
	public void setNumOfLectures(int numOfLectures) {
		this.numOfLectures = numOfLectures;
	}
	public List<String> getWorkingDays() {
		return workingDays;
	}
	public void setWorkingDays(List<String> workingDays) {
		this.workingDays = workingDays;
	}
}
