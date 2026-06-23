package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.DBConnection;

@WebServlet("/StudentGetSubjects")
public class StudentGetSubjectsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String branch = request.getParameter("branch"); // e.g. "CS"
        String sem = request.getParameter("sem");       // e.g. "1", "3", "5"

        if (branch == null || sem == null || branch.isEmpty() || sem.isEmpty()) {
            out.print("{\"error\":\"Missing parameters\"}");
            return;
        }

        // If sem is "1", query both 1A and 1B
        String semCondition;
        if (sem.equals("1")) {
            semCondition = "s.sem IN ('1A', '1B')";
        } else {
            semCondition = "s.sem = '" + sem + "'";
        }

        String sql = "SELECT DISTINCT s.sub_name, s.sub_abbr, s.subject_type, lt.username " +
                     "FROM subjects s " +
                     "JOIN departments d ON s.dept_id = d.dept_id " +
                     "JOIN login_teacher as lt ON s.faculty_id = lt.fac_id " +
                     "WHERE d.dept_name = ? AND " + semCondition +
                     " ORDER BY s.subject_type, s.sub_name";

        StringBuilder json = new StringBuilder("[");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, branch);
            rs = ps.executeQuery();

            boolean first = true;
            while (rs.next()) {
                if (!first) json.append(",");
                json.append("{")
                    .append("\"name\":\"").append(escape(rs.getString("sub_name"))).append("\",")
                    .append("\"abbr\":\"").append(escape(rs.getString("sub_abbr"))).append("\",")
                    .append("\"type\":\"").append(escape(rs.getString("subject_type"))).append("\",")
                    .append("\"faculty\":\"").append(escape(rs.getString("username"))).append("\"")
                    .append("}");
                first = false;
            }
            json.append("]");
            out.print(json.toString());

        } catch (Exception e) {
            e.printStackTrace();
            out.print("{\"error\":\"" + escape(e.getMessage()) + "\"}");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private String escape(String s) {
        if (s == null) return "";
        return s.replace("\\", "\\\\").replace("\"", "\\\"");
    }
}