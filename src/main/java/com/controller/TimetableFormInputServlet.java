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
		
		int numOfBreaks=0;
		
		try {
			numOfBreaks = Integer.parseInt(numOfBreaksStr);
			timetableInp.setNumOfBreaks(numOfBreaks);
//			int[] breaksDurationArray = new int[numOfBreaks];
//			String durationStr1 = request.getParameter("break-duration-1");
//			String durationStr2 = request.getParameter("break-duration-2");
//			breaksDurationArray[0]=Integer.parseInt(durationStr1);
//			breaksDurationArray[1]=Integer.parseInt(durationStr2);
			
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
