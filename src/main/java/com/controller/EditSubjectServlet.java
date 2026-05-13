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


public class EditSubjectServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Subject s = new Subject();
        s.setSub_id(Integer.parseInt(request.getParameter("sub_id")));
        s.setSub_name(request.getParameter("sub_name"));
        s.setSub_code(request.getParameter("sub_code"));
        s.setSub_abbr(request.getParameter("sub_abbr"));
        s.setSubject_type(request.getParameter("subject_type"));
        s.setSem(request.getParameter("sem"));
        s.setDept_id(Integer.parseInt(request.getParameter("dept_id")));
        s.setFac_id(Integer.parseInt(request.getParameter("fac_id")));
        s.setFrequency(Integer.parseInt(request.getParameter("frequency")));
        
        SubjectDao dao = DAOFactory.getSubjectDao();
        
        if (dao.updateSubject(s)) {
        	request.setAttribute("editmsg2", "Record Updated!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/add_subject.jsp");
            rd.forward(request, response);
        } else {
        	request.setAttribute("editmsg2", "some error occur!!");
        	RequestDispatcher rd = request.getRequestDispatcher("/views/add_subject.jsp");
            rd.forward(request, response);
        }
	}

}
