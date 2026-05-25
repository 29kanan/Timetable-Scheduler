package com.service;

import java.util.Comparator;
import java.util.List;

import com.algorithm.TimetableGenerator;
import com.model.AlgorithmInputModel;
import com.model.LectureDetailsImpl;
import com.model.TimetableFormInputDTO;
import com.model.TimetableResult;
import com.model.TimetableSlot;
import com.dao.LectureDetailsDAOImpl;
import com.dao.AutoTimetableDAO;
import com.dao.AutoTimetableDAOImpl;
import com.dao.LectureDetailsDAO;

public class TimetableService {
	
	LectureDetailsDAO ldao=new LectureDetailsDAOImpl();
	AutoTimetableDAO tdao=new AutoTimetableDAOImpl();
	
	public TimetableResult generateAndFinalizeTimetable(TimetableFormInputDTO constraints){
		
		AlgorithmInputModel model=this.buildAlgorithmInput(constraints);
		TimetableResult result=TimetableGenerator.generate(model);
		
		return result;
		
	}
	
	public AlgorithmInputModel buildAlgorithmInput(TimetableFormInputDTO constraints) {
		
		String semType=constraints.getSemType();
		List<LectureDetailsImpl> allLectures = ldao.getLecturesBySemester(semType);
		allLectures.sort(Comparator.comparingInt(l -> getPriority(l.getSubjectType())));
		int totalFaculty=ldao.getTotalFaculty(semType);
//		int totalLectures=allLectures.size();
		
		AlgorithmInputModel inputModel=new AlgorithmInputModel();
		
		inputModel.setAllLectures(allLectures);
		inputModel.setTimetableInp(constraints);
		inputModel.setTotalFaculty(totalFaculty);
//		inputModel.setTotalLectures(totalLectures);
		
		return inputModel;
		
	}
	
	public void saveTimetable(TimetableResult result) {
		boolean isSaved=tdao.saveTimetable(result);
		if(isSaved) {
			System.out.println("Timetable Saved Succesfully.");
		}
		else {
			System.out.println("Timetable Save Failed!!!");
		}
	}
	
	public List<TimetableSlot> showTimetable(){
		List<TimetableSlot> timetable=tdao.showAllTimetable();
		return timetable;
	}
	
	private static int getPriority(String type) {
	    switch(type) {
	        case "Lab":       return 0;
	        case "Theory":    return 1;
	        default:          return 2;
	    }
	}
	
}
