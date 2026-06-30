package com.controller;
import java.util.List;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DAOFactory;
import com.model.Faculty;
import com.model.Timetable;

public class TodayScheduleServlet
extends HttpServlet {

    protected void doGet(
        HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session =
            request.getSession();

        Faculty faculty =
            (Faculty)session.getAttribute("faculty");

        int facId = faculty.getFac_id();

        List<Timetable> list =
            DAOFactory.getTimetableDao()
            .getTodaySchedule(facId);

        request.setAttribute(
            "scheduleList",
            list);

        request.getRequestDispatcher(
            "/views/allSchedule.jsp")
            .forward(request,response);
    }
}