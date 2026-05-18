package com.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ForgotPasswordDAO;
import com.dao.ForgotPasswordDAOImpl;

@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ----------------------------------------------------------------
    // POST: Faculty email + phone submit karta hai
    // ----------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Empty check
        if (email == null || email.trim().isEmpty() ||
            phone == null || phone.trim().isEmpty()) {

            request.setAttribute("error", "Please fill in all fields.");
            request.getRequestDispatcher("/views/forgot_password.jsp")
                   .forward(request, response);
            return;
        }

        email = email.trim();
        phone = phone.trim();

        ForgotPasswordDAO dao = new ForgotPasswordDAOImpl();

        // login_teacher table mein email + phone verify karo
        boolean found = dao.verifyEmailAndPhone(email, phone);

        if (!found) {
            // Faculty not found — error show karo same page pe
            request.setAttribute("error",
                "No faculty found with this Email and Phone number. Please check and try again.");
            request.setAttribute("typedEmail", email);
            request.setAttribute("typedPhone", phone);
            request.getRequestDispatcher("/views/forgot_password.jsp")
                   .forward(request, response);
            return;
        }

        // ✅ Faculty verified — session mein email store karo
        HttpSession session = request.getSession();
        session.setAttribute("resetEmail", email);
        session.setMaxInactiveInterval(600); // 10 min session

        // Reset password page pe bhejo
        response.sendRedirect(
            request.getContextPath() + "/views/Reset_password.jsp");
    }

    // ----------------------------------------------------------------
    // GET: Directly forgot_password.jsp dikhao
    // ----------------------------------------------------------------
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/forgot_password.jsp")
               .forward(request, response);
    }
}