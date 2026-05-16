package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.facultyDao;


public class show_msgServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
      
        facultyDao dao = DAOFactory.getFacultyDao();
        String msg=dao.show_msg(email);
        
        if (msg!=null) {
        	
        	if(msg.contains("APPROVED"))
        	     { 
        		  request.setAttribute("status","approved");
        	     request.getRequestDispatcher("/facultyLogin").forward(request, response);
        	     }
        	else if(msg.contains("REJECTED"))
        	{ request.setAttribute("status","rejected"); 
        	RequestDispatcher rd = request.getRequestDispatcher("/views/fac_status_msg.jsp");
            rd.forward(request, response);
            }
        	else{
         		request.setAttribute("status", "pending");
        RequestDispatcher rd = request.getRequestDispatcher("/views/fac_status_msg.jsp");
        rd.forward(request, response);
         	}
        	
        } else {
            RequestDispatcher rd = request.getRequestDispatcher("/views/fac_status_msg.jsp");
            rd.forward(request, response);
        
        }
        	
      }
		
	}


