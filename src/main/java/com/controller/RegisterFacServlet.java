package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.facultyDao;
import com.model.Faculty;


public class RegisterFacServlet extends HttpServlet {
	
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

		      
		     String username=request.getParameter("name");
		     String password=request.getParameter("password");
		    String email=request.getParameter("email");
		    String ph= request.getParameter("phone");
		    
		    String dept=request.getParameter("dept");
		    
            String aStart= request.getParameter("availStart");
		    
            String aEnd= request.getParameter("availEnd");
		    
	        Faculty f = new Faculty(username, password, email, ph, dept,aStart,aEnd);
	       
	        facultyDao dao = DAOFactory.getFacultyDao();
	        int status = dao.register(f);

	        if(status > 0) {
	        	request.setAttribute("msg", "Registration Successful!");
	        	RequestDispatcher rd = request.getRequestDispatcher("/views/teacher_login.jsp");
	            rd.forward(request, response);
	        } else {
	        	request.setAttribute("msg", "Registration Failed!");
	        	RequestDispatcher rd = request.getRequestDispatcher("/views/reg_faculty.jsp");
	            rd.forward(request, response);
	        }
	    }
}
