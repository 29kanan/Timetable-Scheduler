package com.controller;

import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.model.TimetableFormInputDTO;
import com.model.TimetableResult;
import com.model.TimetableSlot;
import com.service.TimetableService;

@WebServlet("/TimetableController")
public class TimetableControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TimetableControllerServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		TimetableFormInputDTO timetableInp = (TimetableFormInputDTO) session.getAttribute("timetableInp");
		TimetableService ttService=new TimetableService();
		TimetableResult result =ttService.generateAndFinalizeTimetable(timetableInp);
		ttService.saveTimetable(result);
		List<TimetableSlot> timetable=ttService.showTimetable();
		
		request.setAttribute("timetableSlots", timetable);
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/ViewTimetable.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
