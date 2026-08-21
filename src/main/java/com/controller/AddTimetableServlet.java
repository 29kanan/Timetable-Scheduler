package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.TimetableDao;
import com.model.Timetable;


public class AddTimetableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Timetable t = new Timetable();
        t.setSem(request.getParameter("sem"));
        t.setDay(request.getParameter("day"));
        String startTime = request.getParameter("slot_start_time");
        String endTime = request.getParameter("slot_end_time");
        t.setTime_slot(startTime + "-" + endTime);
        t.setSub_abbr(request.getParameter("sub_abbr"));
        //t.setFac_id(Integer.parseInt(request.getParameter("fac_id")));
        t.setRoom_id(Integer.parseInt(request.getParameter("room_id")));
        t.setDept_id(Integer.parseInt(request.getParameter("dept_id")));
        t.setYear(request.getParameter("year"));

        TimetableDao dao = DAOFactory.getTimetableDao();

        if (dao.addTimetable(t)) {
        	request.setAttribute("addT", "Time slot Added!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/create_timetable.jsp");
            rd.forward(request, response);
        } else {
        	request.setAttribute("addT", "some error occur!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/create_timetable.jsp");
            rd.forward(request, response);
        }
	}

}
