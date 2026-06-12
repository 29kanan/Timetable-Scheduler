package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DAOFactory;
import com.dao.NotificationDAO;
import com.model.Notification;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    NotificationDAO dao = DAOFactory.getNotificationDao();

	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String title = request.getParameter("title");
        String message = request.getParameter("message");
        String role = request.getParameter("targetRole");

        Notification n =
            new Notification(title, message, role);


        boolean status = dao.addNotification(n);

        if (status) {
        	request.setAttribute("send", "Massege sended!!");

        	RequestDispatcher rd = request.getRequestDispatcher("/views/Notification.jsp?success=1");
        	rd.forward(request, response);
        } else {
        	request.setAttribute("error", "some error occure!!");

        	RequestDispatcher rd = request.getRequestDispatcher("/views/Notification.jsp?error=1");
        	rd.forward(request, response);
        }
    }
	
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");
	        int id = Integer.parseInt(request.getParameter("msg_id"));

	        if (action.equals("delete")) {
	            if(dao.deleteNotification(id)) {
	            request.setAttribute("delmsg", "Notification Deleted!!");
	        	RequestDispatcher rd = request.getRequestDispatcher("/views/Notification.jsp");
	            rd.forward(request, response);
	        }else {
	        	
	        	request.setAttribute("delmsg", "some error occur!!");
	        	RequestDispatcher rd = request.getRequestDispatcher("/views/Notification.jsp");
	            rd.forward(request, response);
	        }
	      }
	    }
}