package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.TimetableService;

@WebServlet("/DeleteAllTimetableServlet")
public class DeleteAllTimetableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TimetableService tservice = new TimetableService();
        
        try {
            boolean success = tservice.deleteAllTimetableRec();
            if (success) {
                response.sendRedirect(request.getContextPath() + "/views/create_timetable.jsp");
            } else {
                request.setAttribute("error", "Failed to delete timetable records.");
                request.getRequestDispatcher("/views/create_timetable.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/views/create_timetable.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}