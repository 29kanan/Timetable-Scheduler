<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.TimetableSlot" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Timetable</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #0d52b3;
            padding: 24px;
            min-height: 100vh;
        }
        .container {
            max-width: 1000px;
            margin: 0 auto;
            background: #ffffff;
            border-radius: 14px;
            padding: 28px;
            box-shadow: 0 8px 32px rgba(13,82,179,0.18);
        }
        h1 {
            text-align: center;
            color: #0d52b3;
            margin-bottom: 24px;
            font-size: 2em;
            font-weight: 700;
        }
        .filter-section {
            margin-bottom: 24px;
            padding: 16px 20px;
            background: #f4f6fb;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            border: 1px solid #dce6f7;
        }
        .filter-section label { font-weight: 600; color: #0d52b3; font-size: 14px; }
        .filter-section select {
            padding: 7px 14px;
            border: 1.5px solid #0d52b3;
            border-radius: 20px;
            font-size: 14px;
            color: #0d52b3;
            background: #fff;
            cursor: pointer;
        }
        .confirmtt-button {
            padding: 8px 22px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            font-weight: 600;
            color: white;
            background-color: #0d52b3;
            cursor: pointer;
            margin-left: auto;
            transition: background 0.2s;
        }
        .confirmtt-button:hover { background-color: #0a3f8a; }

        /* Legend */
        .legend {
            display: flex;
            gap: 16px;
            margin-bottom: 20px;
            font-size: 13px;
            align-items: center;
        }
        .legend-item { display: flex; align-items: center; gap: 6px; }
        .legend-badge {
            padding: 2px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }
        .legend-theory { background: #e3f2fd; color: #0d52b3; border: 1px solid #90caf9; }
        .legend-lab { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }

        /* Class section */
        .class-section { margin-bottom: 40px; }
        .class-title {
            background: #0d52b3;
            color: white;
            padding: 13px 20px;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 14px;
            letter-spacing: 0.3px;
        }

        /* Day card */
        .day-card {
            border: 1px solid #e0e8f7;
            border-radius: 10px;
            margin-bottom: 12px;
            overflow: hidden;
            box-shadow: 0 1px 4px rgba(13,82,179,0.07);
        }
        .day-card-header {
            background: #0d52b3;
            color: white;
            padding: 10px 18px;
            font-size: 14px;
            font-weight: 600;
            letter-spacing: 0.3px;
        }

        /* Slot row */
        .slot-row {
            display: flex;
            align-items: center;
            padding: 10px 18px;
            border-bottom: 1px solid #f0f4fc;
            gap: 12px;
            font-size: 13px;
        }
        .slot-row:last-child { border-bottom: none; }
        .slot-row.lab-row { background: #f6fff7; }
        .slot-row.theory-row { background: #ffffff; }
        .slot-row:hover { background: #f0f5ff; transition: background 0.15s; }

        .slot-time {
            color: #888;
            font-size: 12px;
            min-width: 110px;
            font-weight: 500;
        }
        .slot-name {
            flex: 1;
            color: #1a1a2e;
            font-weight: 600;
            font-size: 14px;
        }
        .slot-badge {
            padding: 3px 12px;
            border-radius: 20px;
            font-size: 11px;
            font-weight: 600;
        }
        .badge-theory { background: #e3f2fd; color: #0d52b3; border: 1px solid #90caf9; }
        .badge-lab { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }
        .slot-faculty {
            color: #666;
            font-size: 12px;
            min-width: 100px;
            text-align: right;
        }

        .no-data { text-align: center; padding: 50px; color: #999; font-size: 18px; }
    </style>
</head>
<body>

<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setHeader("Expires","0");
  if(session.getAttribute("username")==null){
    response.sendRedirect("admin_login.jsp");
  }
%>

<div class="container">
    <h1>Timetable Viewer</h1>

    <div class="filter-section">
        <form method="post" action="TimetableController" style="display:flex; align-items:center; gap:12px; flex-wrap:wrap; width:100%;">
            <label for="classFilter">Filter by Class:</label>
            <select name="className" id="classFilter" onchange="this.form.submit()">
                <option value="">All Classes</option>
                <option value="CS-1A">CS-1A</option>
                <option value="CS-1B">CS-1B</option>
                <option value="CS-3">CS-3</option>
                <option value="DS-3">DS-3</option>
                <option value="CS-5">CS-5</option>
                <option value="DS-5">DS-5</option>
                <option value="CS-7">CS-7</option>
                <option value="DS-7">DS-7</option>
            </select>
            <label for="semesterFilter">Filter by Semester:</label>
            <select name="semesterType" id="semesterFilter" onchange="this.form.submit()">
                <option value="">All Semesters</option>
                <option value="odd">Odd Semester</option>
                <option value="even">Even Semester</option>
            </select>
            <button formaction="ConfirmTimetableServlet" type="submit" class="confirmtt-button">Next &#8594;</button>
        </form>
    </div>

    <div class="legend">
        <div class="legend-item"><span class="legend-badge legend-theory">Theory</span></div>
        <div class="legend-item"><span class="legend-badge legend-lab">Lab</span></div>
    </div>

    <%
        List<TimetableSlot> timetableSlots = (List<TimetableSlot>) request.getAttribute("timetableSlots");
        if (timetableSlots == null || timetableSlots.isEmpty()) {
    %>
        <div class="no-data"><p>No timetable data available.</p></div>
    <%
        } else {
            Map<String, List<TimetableSlot>> slotsByClass = new LinkedHashMap<>();
            for (TimetableSlot slot : timetableSlots) {
                slotsByClass.computeIfAbsent(slot.getClassName(), k -> new ArrayList<>()).add(slot);
            }
            String[] dayOrder = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};

            for (Map.Entry<String, List<TimetableSlot>> entry : slotsByClass.entrySet()) {
                String className = entry.getKey();
                List<TimetableSlot> classSlots = entry.getValue();

                Map<String, List<TimetableSlot>> slotsByDay = new LinkedHashMap<>();
                for (String d : dayOrder) slotsByDay.put(d, new ArrayList<>());
                for (TimetableSlot slot : classSlots) {
                    if (slotsByDay.containsKey(slot.getDay())) slotsByDay.get(slot.getDay()).add(slot);
                }
    %>
    <div class="class-section">
        <div class="class-title">Class: <%= className %></div>

        <% for (String day : dayOrder) {
            List<TimetableSlot> daySlots = slotsByDay.get(day);
            if (!daySlots.isEmpty()) {
                Collections.sort(daySlots, (s1, s2) -> s1.getSlot().getStartTime().compareTo(s2.getSlot().getStartTime()));
        %>
        <div class="day-card">
            <div class="day-card-header"><%= day %></div>
            <% for (TimetableSlot slot : daySlots) {
                String name = slot.getLectureName();
                boolean isLab = name != null && (name.toLowerCase().contains("lab") ||
                    name.toLowerCase().contains("workshop") ||
                    name.toLowerCase().contains("project") ||
                    name.toLowerCase().contains("internship"));
                String rowClass = isLab ? "lab-row" : "theory-row";
                String badgeClass = isLab ? "badge-lab" : "badge-theory";
                String badgeText = isLab ? "Lab" : "Theory";
            %>
            <div class="slot-row <%= rowClass %>">
                <span class="slot-time"><%= slot.getSlot().getStartTime() %> – <%= slot.getSlot().getEndTime() %></span>
                <span class="slot-name"><%= name != null ? name : "-" %></span>
                <span class="slot-badge <%= badgeClass %>"><%= badgeText %></span>
                <span class="slot-faculty"><%= slot.getFacultyName() != null ? slot.getFacultyName() : "-" %></span>
            </div>
            <% } %>
        </div>
        <% } } %>
    </div>
    <% } } %>
</div>
</body>
</html>
