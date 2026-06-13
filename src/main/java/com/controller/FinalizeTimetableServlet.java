package com.controller;

import javax.servlet.RequestDispatcher;


import javax.servlet.ServletException;


import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import com.service.TimetableService;

@WebServlet("/FinalizeTimetable")
public class FinalizeTimetableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FinalizeTimetableServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		TimetableService ttService=new TimetableService();
		Boolean status = ttService.FinalizeTimetable();
		
		if (status != null && status) {
	        request.setAttribute("message", "Timetable saved successfully!");
	        request.setAttribute("messageType", "success");
	    } else {
	        request.setAttribute("message", "Failed to save timetable. Please try again.");
	        request.setAttribute("messageType", "error");
	    }
		
		RequestDispatcher rd=request.getRequestDispatcher("/views/create_timetable.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}