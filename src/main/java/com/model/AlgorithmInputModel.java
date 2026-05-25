package com.model;

import java.util.List;

public class AlgorithmInputModel {

	private List<LectureDetailsImpl> allLectures;
	private TimetableFormInputDTO timetableInp;
	
	private int totalFaculty;

	public List<LectureDetailsImpl> getAllLectures() {
		return allLectures;
	}

	public void setAllLectures(List<LectureDetailsImpl> allLectures) {
		this.allLectures = allLectures;
	}

	public TimetableFormInputDTO getTimetableInp() {
		return timetableInp;
	}

	public void setTimetableInp(TimetableFormInputDTO timetableInp) {
		this.timetableInp = timetableInp;
	}

	public int getTotalFaculty() {
		return totalFaculty;
	}

	public void setTotalFaculty(int totalFaculty) {
		this.totalFaculty = totalFaculty;
	}
	
}
