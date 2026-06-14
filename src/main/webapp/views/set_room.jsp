<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.util.DBConnection" %>
<%
    /* ── handle POST (Save Rooms) ─────────────────────────────────── */

    if ("POST".equals(request.getMethod())) {
        Connection con = null;
        PreparedStatement fetchClasses = null;
        PreparedStatement upd = null;
        ResultSet rsClasses = null;
        try {
            con = DBConnection.getConnection();
            String semester = request.getParameter("semester");

            String semFilter = "odd".equals(semester)
            	    ? "SELECT class_id FROM classes_name WHERE sem IN ('1A','1B','3','5','7')"
            	    : "SELECT class_id FROM classes_name WHERE sem IN ('2','4','6','8')";

            	fetchClasses = con.prepareStatement(semFilter);
            	rsClasses = fetchClasses.executeQuery();

            upd = con.prepareStatement(
                "UPDATE classes_name SET room_id = ? WHERE class_id = ?"
            );
            while (rsClasses.next()) {
                int classId = rsClasses.getInt("class_id");
                String paramName = "room_" + classId;
                String roomIdStr = request.getParameter(paramName);
                if (roomIdStr != null && !roomIdStr.isEmpty()) {
                    upd.setInt(1, Integer.parseInt(roomIdStr));
                    upd.setInt(2, classId);
                    upd.addBatch();
                }
            }
            upd.executeBatch();
            response.sendRedirect(request.getContextPath() + "/FinalizeTimetable");
            return;
        } catch (Exception e) {
        		System.out.println(e.getMessage());
        } finally {
            DBConnection.clean(rsClasses, fetchClasses, con);
        }
    }

    /* ── fetch data for page render ───────────────────────────────── */
    String activeSem = request.getParameter("semester");
    if (activeSem == null) activeSem = "odd";

    java.util.List<String[]> roomListStr = new java.util.ArrayList<>(); // {room_id, room_num}
    java.util.List<String[]> classList   = new java.util.ArrayList<>(); // {class_id, class_name, room_id}
    String dbError = null;

    Connection con2 = null;
    PreparedStatement ps = null;
    ResultSet rsRooms = null, rsCls = null;
    try {
        con2 = DBConnection.getConnection();

        // fetch rooms
        Statement st = con2.createStatement();
        rsRooms = st.executeQuery("SELECT room_id, room_num FROM rooms ORDER BY room_num");
        while (rsRooms.next()) {
            roomListStr.add(new String[]{
                String.valueOf(rsRooms.getInt("room_id")),
                rsRooms.getString("room_num")
            });
        }
        rsRooms.close();
        st.close();

        // fetch classes for active semester
        ps = con2.prepareStatement(
            "SELECT class_id, class_name, room_id FROM classes_name WHERE sem = ? ORDER BY class_name"
        );String semFilter = "odd".equals(activeSem)
        ? "SELECT class_id, class_name, room_id FROM classes_name WHERE sem IN ('1A','1B','3','5','7') ORDER BY class_name"
        	    : "SELECT class_id, class_name, room_id FROM classes_name WHERE sem IN ('2','4','6','8') ORDER BY class_name";

        	ps = con2.prepareStatement(semFilter);
        	// remove the ps.setString(1, activeSem) line
        	rsCls = ps.executeQuery();
        while (rsCls.next()) {
            classList.add(new String[]{
                String.valueOf(rsCls.getInt("class_id")),
                rsCls.getString("class_name"),
                rsCls.getString("room_id") // may be null
            });
        }
    } catch (Exception e) {
        dbError = e.getMessage();
    } finally {
        DBConnection.clean(rsCls, ps, con2);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Assign Rooms</title>
<style>
    *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

    body {
        min-height: 100vh;
        background: #4a7fd4;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI', Arial, sans-serif;
        padding: 30px 16px;
    }

    .card {
        background: #fff;
        border-radius: 18px;
        padding: 40px 44px 44px;
        width: 100%;
        max-width: 560px;
        box-shadow: 0 8px 40px rgba(0,0,0,0.13);
        position: relative;
    }

    .back-btn { position: absolute; top: 25px; left: 28px; }
    .back-btn a {
        text-decoration: none;
        color: rgba(13, 82, 179, 0.75);
        font-size: 14px;
        font-weight: 700;
    }
    .back-btn a:hover { color: #0d52b3; }

    h1 {
        text-align: center;
        font-size: 26px;
        font-weight: 800;
        color: #1a1a2e;
        margin-top: 10px;
        margin-bottom: 4px;
    }
    .subtitle { text-align: center; color: #888; font-size: 14px; margin-bottom: 28px; }

    .sem-tabs {
        display: flex;
        background: #f0f4fb;
        border-radius: 50px;
        padding: 4px;
        margin-bottom: 28px;
    }
    .sem-tabs a {
        flex: 1; text-align: center; padding: 9px 0;
        border-radius: 50px; font-size: 14px; font-weight: 600;
        text-decoration: none; color: #555;
        transition: background .2s, color .2s;
    }
    .sem-tabs a.active {
        background: #1a4fba; color: #fff;
        box-shadow: 0 2px 8px rgba(26,79,186,.25);
    }

    .class-row { display: flex; align-items: center; gap: 14px; margin-bottom: 14px; }
    .class-label { width: 80px; flex-shrink: 0; font-size: 14px; font-weight: 700; color: #1a1a2e; }

    .room-select {
        flex: 1; padding: 11px 16px;
        border: none; border-radius: 50px;
        background: #f3f6fb; font-size: 14px; color: #333;
        appearance: none; -webkit-appearance: none;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='12' height='8' viewBox='0 0 12 8'%3E%3Cpath d='M1 1l5 5 5-5' stroke='%23666' stroke-width='1.5' fill='none' stroke-linecap='round'/%3E%3C/svg%3E");
        background-repeat: no-repeat; background-position: right 16px center;
        cursor: pointer; outline: none; transition: box-shadow .15s;
    }
    .room-select:focus { box-shadow: 0 0 0 3px rgba(26,79,186,.18); }

    .alert { padding: 11px 18px; border-radius: 10px; font-size: 14px; font-weight: 600; margin-bottom: 20px; text-align: center; }
    .alert.success { background: #e6f4ea; color: #2d7a3a; }
    .alert.error   { background: #fdecea; color: #c0392b; }

    .btn-save {
        display: block; width: 100%; margin-top: 28px; padding: 15px;
        background: #1a4fba; color: #fff; border: none; border-radius: 50px;
        font-size: 16px; font-weight: 700; cursor: pointer;
        transition: background .2s, transform .1s;
    }
    .btn-save:hover  { background: #1440a0; }
    .btn-save:active { transform: scale(.98); }

    .db-error { background: #fdecea; color: #c0392b; padding: 12px 18px; border-radius: 10px; font-size: 13px; margin-bottom: 16px; }
    .empty-msg { text-align: center; color: #999; font-size: 14px; padding: 20px 0; }
</style>
</head>
<body>
<div class="card">

    <div class="back-btn"><a href="views/create_timetable.jsp">← Back</a></div>

    <h1>Assign Rooms</h1>
    <p class="subtitle">Select a room for each class</p>

    <div class="sem-tabs">
        <a href="set_room.jsp?semester=odd"  class="<%= "odd".equals(activeSem)  ? "active" : "" %>">Odd Semester</a>
        <a href="set_room.jsp?semester=even" class="<%= "even".equals(activeSem) ? "active" : "" %>">Even Semester</a>
    </div>

    <% if (dbError != null) { %>
        <div class="db-error">⚠ Database error: <%= dbError %></div>
    <% } %>
    
    <form method="post" action="set_room.jsp?semester=<%= activeSem %>">
        <input type="hidden" name="semester" value="<%= activeSem %>">

        <% if (classList.isEmpty() && dbError == null) { %>
            <p class="empty-msg">No classes found for the <%= activeSem %> semester.</p>
        <% } %>

        <% for (String[] cls : classList) {
               String classId     = cls[0];
               String className   = cls[1];
               String currentRoom = cls[2]; // may be null
        %>
        <div class="class-row">
            <span class="class-label"><%= className %></span>
            <select name="room_<%= classId %>" class="room-select">
                <option value="">-- Select Room --</option>
                <% for (String[] room : roomListStr) {
                       String rId  = room[0];
                       String rNum = room[1];
                       boolean selected = rId.equals(currentRoom);
                %>
                <option value="<%= rId %>" <%= selected ? "selected" : "" %>><%= rNum %></option>
                <% } %>
            </select>
        </div>
        <% } %>

        <% if (!classList.isEmpty()) { %>
            <button type="submit" class="btn-save">Save And Finalize Timetable →</button>
        <% } %>
    </form>

</div>
</body>
</html>
