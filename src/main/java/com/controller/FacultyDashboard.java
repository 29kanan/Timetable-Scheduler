package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// DAO Imports
import com.dao.DAOFactory;
import com.dao.facultyDao;

public class FacultyDashboard extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session check
        if (session == null) {
            response.sendRedirect("facultyLogin.jsp");
            return;
        }

        Integer facId =
        	    (Integer) session.getAttribute("fid");

        String email =
                (String) session.getAttribute("email");

        // Additional safety check
        if (facId == null || email == null) {
            response.sendRedirect("facultyLogin.jsp");
            return;
        }

        facultyDao dao = DAOFactory.getFacultyDao();

        // Fetch dynamic data
        int subjectCount =
                dao.getSubjectCount(facId);

        int weeklyClassCount =
                dao.getWeeklyClassCount(facId);

        int todayClassCount =
                dao.getTodayClassCount(facId);
        
        int notificationCount =
                dao.getNotificationCount();

      

        // Send data to JSP
        request.setAttribute(
                "subjectCount",
                subjectCount);

        request.setAttribute(
                "weeklyClassCount",
                weeklyClassCount);

        request.setAttribute(
                "todayClassCount",
                todayClassCount);

        request.setAttribute(
                "notificationCount",
                notificationCount);

        request.getRequestDispatcher(
                "/views/facultyDashB.jsp")
                .forward(request, response);
    }
  
    //Test
    
    
    
    
    
    
    
    
    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        doGet(request, response);
    }
}