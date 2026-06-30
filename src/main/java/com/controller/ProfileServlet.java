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


public class ProfileServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

     
        int id = Integer.parseInt(request.getParameter("id"));

        Faculty f = new Faculty();
        f.setFac_id(id);
        facultyDao dao = DAOFactory.getFacultyDao();

        Faculty f1 = dao.getFacultyById(id);
    if(f1!=null) {
        request.setAttribute("profile", f1);
        RequestDispatcher rd = request.getRequestDispatcher("/views/profile.jsp");
        rd.forward(request, response);
    } else {
        request.setAttribute("error", "Invalid 	some error occured");
        RequestDispatcher rd = request.getRequestDispatcher("/views/profile.jsp");
        rd.forward(request, response);
    }
    
}

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ---------- UPDATE ----------
        int id = Integer.parseInt(request.getParameter("fac_id"));

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("pwd");
        String phone = request.getParameter("phone");
        

        Faculty f = new Faculty();
        
        f.setUsername(name);
           f.setPhone(phone);
            f.setPassword(password);
            
            f.setEmail(email);

            f.setFac_id(id);
        facultyDao dao = DAOFactory.getFacultyDao();
        
        boolean status = dao.updateFaculty(f);

        if (status) {
        	
            Faculty f1 = dao.getFacultyById(id);
        if(f1!=null) {
            request.setAttribute("profile", f1);
            request.setAttribute("error", "Data updated!!");
            RequestDispatcher rd = request.getRequestDispatcher("/views/profile.jsp");
            rd.forward(request, response);
        } else {
            request.setAttribute("error", "Invalid 	some error occured");
            RequestDispatcher rd = request.getRequestDispatcher("/views/profile.jsp");
            rd.forward(request, response);
        }
        
        } else {
            request.setAttribute("error", "Invalid 	some error occured");
            RequestDispatcher rd = request.getRequestDispatcher("/views/profile.jsp");
            rd.forward(request, response);
        }
        
    }
}