package com.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalTime;
import java.time.format.DateTimeParseException;
import java.util.Arrays;
import java.util.List;

import com.model.TimetableFormInputDTO;

@WebServlet("/TimetableFormInputServlet")
public class TimetableFormInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		TimetableFormInputDTO timetableInp = new TimetableFormInputDTO();
		
		String semType=request.getParameter("semester");
		String lecDuration=request.getParameter("lec-duration");
		String numOfBreaksStr=request.getParameter("breaks");
		String startTimeStr=request.getParameter("start-time");
		String numOfLecturesStr=request.getParameter("lectures-per-day");
		String[] workingDaysArr=request.getParameterValues("working-days");
		
		if (semType != null && !semType.trim().isEmpty()) {
		    timetableInp.setSemType(semType.trim());
		} else {
		    out.print("Required field is missing!");
		}
		
		try {
		    timetableInp.setLecDuration(Integer.parseInt(lecDuration));
		} catch(NumberFormatException e) {
		    e.printStackTrace();
		}
		if (startTimeStr != null && !startTimeStr.trim().isEmpty()) {
			try {
				// HTML <input type="time"> submits values like "10:15"
				timetableInp.setStartTime(LocalTime.parse(startTimeStr.trim()));
			} catch(DateTimeParseException e) {
				e.printStackTrace();
				out.print("Invalid start time format!");
			}
		} else {
			out.print("Required field is missing: start time!");
		}
					
		try {
			timetableInp.setNumOfLectures(Integer.parseInt(numOfLecturesStr));
		} catch(NumberFormatException e) {
			e.printStackTrace();
			out.print("Required field is missing or invalid: lectures per day!");
		}
					
		if (workingDaysArr != null && workingDaysArr.length > 0) {
			List<String> workingDays = Arrays.asList(workingDaysArr);
			timetableInp.setWorkingDays(workingDays);
		} else {
			out.print("Required field is missing: working days!");
		}

		
		int numOfBreaks=0;
		
		try {
			numOfBreaks = Integer.parseInt(numOfBreaksStr);
			timetableInp.setNumOfBreaks(numOfBreaks);
			
			if(numOfBreaks>0) {
				int[] breaksDurationArray = new int[numOfBreaks];
				
				for(int n=0; n<numOfBreaks; n++) {
					String paramName = "break-duration-" + (n + 1);
		            String durationStr = request.getParameter(paramName.trim());
		            
		            if(durationStr != null && !durationStr.isEmpty()) {
		            	breaksDurationArray[n] = Integer.parseInt(durationStr);
		            } else {
		                System.err.println("Warning: Duration for " + paramName + " is missing or null.");
		                breaksDurationArray[n] = 0; 
		            }
				}
				timetableInp.setBreaksDuration(breaksDurationArray);
				
			}
			
		}catch(NumberFormatException e) {
		    e.printStackTrace();
		}
		
		HttpSession session=request.getSession();
		session.setAttribute("timetableInp", timetableInp);
		
		RequestDispatcher rd=request.getRequestDispatcher("TimetableController");
		rd.forward(request, response);
		
	}
	

}
