package com.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.AutoTimetableDAOImpl;

@WebServlet("/ConfirmTimetableServlet")
public class ConfirmTimetableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        AutoTimetableDAOImpl tdao = new AutoTimetableDAOImpl();
        
        try {
            boolean success = tdao.confirmTimetable();
            if (success) {
                response.sendRedirect(request.getContextPath() + "/views/view_timetable.jsp");
            } else {
                request.setAttribute("error", "Failed to confirm timetable. Please try again.");
                request.getRequestDispatcher("/views/ViewTimetable.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred: " + e.getMessage());
            request.getRequestDispatcher("/views/ViewTimetable.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}