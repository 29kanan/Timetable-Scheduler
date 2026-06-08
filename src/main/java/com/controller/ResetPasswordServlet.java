package com.controller;

// ================================================================
// FILE 4: ResetPasswordServlet.java  ← NEW FILE
// Path  : src/main/java/com/controller/ResetPasswordServlet.java
// Action: Naya file banao is path pe, yeh code paste karo
// ================================================================

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.ForgotPasswordDAO;
import com.dao.ForgotPasswordDAOImpl;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ----------------------------------------------------------------
    // POST: Faculty new password submit karta hai
    // ----------------------------------------------------------------
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Session check — seedha yahan nahi aa sakte
        if (session == null || session.getAttribute("resetEmail") == null) {
            response.sendRedirect(
                request.getContextPath() + "/views/forgot_password.jsp");
            return;
        }

        String email       = (String) session.getAttribute("resetEmail");
        String newPass     = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        // Empty check
        if (newPass == null || newPass.trim().isEmpty()) {
            request.setAttribute("error", "New password cannot be empty.");
            request.getRequestDispatcher("/views/Reset_password.jsp")
                   .forward(request, response);
            return;
        }

        // Length check
        if (newPass.trim().length() < 6) {
            request.setAttribute("error", "Password must be at least 6 characters.");
            request.getRequestDispatcher("/views/Reset_password.jsp")
                   .forward(request, response);
            return;
        }

        // Password match check
        if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Passwords do not match. Please try again.");
            request.getRequestDispatcher("/views/Reset_password.jsp")
                   .forward(request, response);
            return;
        }

        ForgotPasswordDAO dao = new ForgotPasswordDAOImpl();

        // login_teacher table mein password update karo
        boolean updated = dao.updatePassword(email, newPass.trim());

        if (updated) {

            // Session clear karo
            session.removeAttribute("resetEmail");
            session.invalidate();

            // reset_password.jsp pe success attribute bhejo
            // JSP mein JS alert dikhega phir login pe redirect hoga
            request.setAttribute("success", "true");
            request.getRequestDispatcher("/views/Reset_password.jsp")
                   .forward(request, response);

        } else {
            request.setAttribute("error", "Something went wrong. Please try again.");
            request.getRequestDispatcher("/views/Reset_password.jsp")
                   .forward(request, response);
        }
    }
}