package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.TimetableDao;
import com.util.DBConnection;


public class DeleteTimetableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("tt_id"));
        TimetableDao dao = DAOFactory.getTimetableDao();
        
        if(dao.deleteTimetable(id)) {
	        	try {
	    	        Connection con = DBConnection.getConnection();
	    	        PreparedStatement ps = con.prepareStatement(
	    	            "UPDATE timetable_status SET is_finalized = FALSE WHERE id = 1"
	    	        );
	    	        ps.executeUpdate();
	    	        con.close();
	    	    } catch (Exception e) {
	    	        e.printStackTrace();
	    	    }
            request.setAttribute("delmsg2", "Record Deleted!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/create_timetable.jsp");
            rd.forward(request, response);
        }else {
        	
        	request.setAttribute("delmsg2", "some error occur!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/create_timetable.jsp");
            rd.forward(request, response);
        }
	}


}
