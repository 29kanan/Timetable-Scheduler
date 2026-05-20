package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.*;
import com.model.*;

@WebServlet("/ClassesServlet")
public class ClassesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	    protected void doGet(HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {

	        String action = request.getParameter("action");

	        // ================= DELETE =================
	        if(action.equals("delete")) {

	            int classId =
	                    Integer.parseInt(
	                            request.getParameter("class_id"));

	            boolean status =DAOFactory.getClassesDao().deleteClass(classId);

	            if(status) {

	                request.setAttribute(
	                        "msg",
	                        "Class Deleted Successfully");

	            } else {

	                request.setAttribute(
	                        "msg",
	                        "Failed To Delete Class");
	            }

	            request.getRequestDispatcher(
	                    "/views/add_class.jsp")
	                    .forward(request, response);
	        }

	        // ================= GET BY ID =================
	        else if(action.equals("edit")) {

	            int classId =
	                    Integer.parseInt(request.getParameter("class_id"));

	            Classes_name c =DAOFactory.getClassesDao().getClassById(classId);

	            request.setAttribute("classData", c);

	            request.getRequestDispatcher(
	                    "/views/edit_class.jsp")
	                    .forward(request, response);
	        }
	    }

	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response)
	            throws ServletException, IOException {

	        String action = request.getParameter("action");

	        // ================= ADD CLASS =================
	        if(action.equals("add")) {

	            String className =request.getParameter("class_name");

	            String sem = request.getParameter("sem");

	            int deptId = Integer.parseInt(request.getParameter("dept_id"));

	            Classes_name c = new Classes_name();

	            c.setClassName(className);
	            c.setSem(sem);
	            c.setDeptId(deptId);

	            boolean status =DAOFactory.getClassesDao().addClass(c);

	            if(status) {

	                request.setAttribute(
	                        "msg",
	                        "Class Added Successfully");

	            } else {

	                request.setAttribute(
	                        "msg",
	                        "Failed To Add Class");
	            }

	            request.getRequestDispatcher(
	                    "/views/add_class.jsp")
	                    .forward(request, response);
	        }

	        // ================= UPDATE CLASS =================
	        else if(action.equals("update")) {

	            int classId =Integer.parseInt(request.getParameter("class_id"));

	            String className =request.getParameter("class_name");

	            String sem =request.getParameter("sem");

	            int deptId =Integer.parseInt(request.getParameter("dept_id"));

	            Classes_name c = new Classes_name();

	            c.setClassId(classId);
	            c.setClassName(className);
	            c.setSem(sem);
	            c.setDeptId(deptId);

	            boolean status =DAOFactory.getClassesDao().updateClass(c);

	            if(status) {

	                request.setAttribute(
	                        "msg",
	                        "Class Updated Successfully");

	            } else {

	                request.setAttribute(
	                        "msg",
	                        "Failed To Update Class");
	            }

	            request.getRequestDispatcher("/views/add_class.jsp")
	                    .forward(request, response);
	        }
	    }
	}