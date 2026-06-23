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

@WebServlet("/StudentGetTimetable")
public class StudentGetTimetableServlet extends HttpServlet {
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

        // If sem=1, match CS-1A and CS-1B, else match CS-3, CS-5 etc.
        String branchCode = branch.contains(" ") ? branch.split(" ")[0] : branch;
        String classPattern;
        if (sem.equals("1")) {
            classPattern = branchCode + "-1%";
        } else {
            classPattern = branchCode + "-" + sem;
        }

        String sql = "SELECT t.lecture_name, t.day, t.slot_start_time, t.slot_end_time, " +
                     "c.class_name " +
                     "FROM final_timetable t " +
                     "JOIN classes_name c ON t.class_id = c.class_id " +
                     "WHERE c.class_name LIKE ? " +
                     "ORDER BY c.class_name, t.day, t.slot_start_time";

        StringBuilder json = new StringBuilder("[");
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBConnection.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, classPattern);
            rs = ps.executeQuery();

            boolean first = true;
            while (rs.next()) {
                if (!first) json.append(",");
                json.append("{")
                    .append("\"lecture\":\"").append(escape(rs.getString("lecture_name"))).append("\",")
                    .append("\"day\":\"").append(escape(rs.getString("day"))).append("\",")
                    .append("\"start\":\"").append(escape(rs.getString("slot_start_time"))).append("\",")
                    .append("\"end\":\"").append(escape(rs.getString("slot_end_time"))).append("\",")
                    .append("\"class\":\"").append(escape(rs.getString("class_name"))).append("\"")
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