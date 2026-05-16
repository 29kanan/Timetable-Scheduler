package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.dao.DAOFactory;
import com.dao.facultyDao;
import com.model.Faculty;


public class facultyLogin extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
        String password = request.getParameter("password");

        Faculty faculty = new Faculty(email,password);
        facultyDao dao = DAOFactory.getFacultyDao();
        
        if (dao.validate(faculty)) {
        	
            HttpSession session=request.getSession();
            session.setAttribute("email",email);
            request.setAttribute("email", email);
            
            String username=faculty.getUsername();
            request.setAttribute("username",username);
            session.setAttribute("username",username);
            
           int fid=faculty.getFac_id();
            request.setAttribute("fid",fid);
            session.setAttribute("fid",fid);
            
            RequestDispatcher rd = request.getRequestDispatcher("/views/facultyDashB.jsp");
            rd.forward(request, response);
            
        } else {
            request.setAttribute("status", "error");
            RequestDispatcher rd = request.getRequestDispatcher("/show_msgServlet");
            rd.forward(request, response);
        }
		
		
	}

}
