package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.dao.DAOFactory;
import com.model.Notification;

public class viewNotification extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        List<Notification> list =
                DAOFactory.getNotificationDao()
                          .getAllNotification();

        request.setAttribute(
                "notificationList",
                list);

        request.getRequestDispatcher(
                "/views/viewfac_notification.jsp")
                .forward(request, response);
    }
}