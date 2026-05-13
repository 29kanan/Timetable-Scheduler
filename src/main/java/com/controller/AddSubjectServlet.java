package com.controller;


import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.SubjectDao;
import com.model.Subject;



public class AddSubjectServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SubjectDao dao = DAOFactory.getSubjectDao();

        Subject s = new Subject();
        s.setSub_name(request.getParameter("sub_name"));
        s.setSub_code(request.getParameter("sub_code"));
        s.setSub_abbr(request.getParameter("sub_abbr"));
        s.setSubject_type(request.getParameter("subject_type"));
        s.setFac_id(Integer.parseInt(request.getParameter("fac_id")));
        s.setSem(request.getParameter("sem"));
        s.setDept_id(Integer.parseInt(request.getParameter("dept_id")));
        s.setFrequency(Integer.parseInt(request.getParameter("frequency")));
        
        
        if (dao.addSubject(s)) {
        	request.setAttribute("addS", "Subject Added!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/viewFac_subject.jsp");
            rd.forward(request, response);
        } else {
        	request.setAttribute("addS", "some error occur!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/viewFac_subject.jsp");
            rd.forward(request, response);
        }
    }

}
