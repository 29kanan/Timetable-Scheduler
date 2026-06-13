package com.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Comparator;
import java.util.List;

import com.algorithm.TimetableGenerator;
import com.model.AlgorithmInputModel;
import com.model.LectureDetailsImpl;
import com.model.TimetableFormInputDTO;
import com.model.TimetableResult;
import com.model.TimetableSlot;
import com.util.DBConnection;
import com.dao.LectureDetailsDAOImpl;
import com.dao.AutoTimetableDAO;
import com.dao.AutoTimetableDAOImpl;
import com.dao.TimetableDao;
import com.dao.TimetableDaoImpl;
import com.dao.LectureDetailsDAO;

public class TimetableService {
	
	LectureDetailsDAO ldao=new LectureDetailsDAOImpl();
	AutoTimetableDAO atdao=new AutoTimetableDAOImpl();
	TimetableDao tdao=new TimetableDaoImpl();
	
	
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
		boolean isSaved=atdao.saveTimetable(result);
		if(isSaved) {
			System.out.println("Timetable Saved Succesfully.");
		}
		else {
			System.out.println("Timetable Save Failed!!!");
		}
	}
	
	public List<TimetableSlot> showTimetable(){
		List<TimetableSlot> timetable=atdao.showAllTimetable();
		return timetable;
	}
	
	private static int getPriority(String type) {
	    switch(type) {
	        case "Lab":       return 0;
	        case "Theory":    return 1;
	        default:          return 2;
	    }
	}

	public boolean FinalizeTimetable() {
		
		boolean status = tdao.finalizeTimetable();
		
		try {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE timetable_status SET is_finalized = TRUE WHERE id = 1"
	        );
	        ps.executeUpdate();
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
		
		return status;
	}
	
	public boolean deleteAllTimetableRec() {
		
		boolean status = tdao.deleteAllTimetableRecords();

		return status;
	}
}
