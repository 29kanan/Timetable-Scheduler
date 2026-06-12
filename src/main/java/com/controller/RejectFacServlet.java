package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.adminDao;
import com.dao.facultyDao;



public class RejectFacServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		        int id = Integer.parseInt(request.getParameter("facid"));

		        adminDao dao = DAOFactory.getAdminDao();
		        
	            if(dao.rejectFaculty(id)) {
	            	request.setAttribute("msg11", "Faculty Removed Succesfuly!!");
	            	 RequestDispatcher rd = request.getRequestDispatcher("/views/add_Teacher.jsp");
	                 rd.forward(request,response);

	            }
	            else{
	            	request.setAttribute("msg11", "some error occur");
	            	 RequestDispatcher rd = request.getRequestDispatcher("/views/add_Teacher.jsp");
	                 rd.forward(request,response);
	                 }
	      }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("facid"));

        facultyDao dao = DAOFactory.getFacultyDao();
        
        if(dao.deleteFaculty(id)) {
        	request.setAttribute("msg11", "Faculty Removed Succesfuly!!");
        	 RequestDispatcher rd = request.getRequestDispatcher("/views/registeredFaculty.jsp");
             rd.forward(request,response);

        }
        else{
        	request.setAttribute("msg11", "some error occur");
        	 RequestDispatcher rd = request.getRequestDispatcher("/views/registeredFaculty.jsp");
             rd.forward(request,response);
             }
  }
}


