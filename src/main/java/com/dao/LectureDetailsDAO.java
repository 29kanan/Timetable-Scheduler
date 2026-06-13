package com.dao;

import java.util.List;

import com.model.LectureDetailsImpl;

public interface LectureDetailsDAO {
	
	List<LectureDetailsImpl> getLecturesBySemester(String semType);
	
	int getTotalFaculty(String semType);
	
	int getTotalLectures(String semType);
	
}
