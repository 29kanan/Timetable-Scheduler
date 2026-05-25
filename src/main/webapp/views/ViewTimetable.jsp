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
            max-width: 1200px;
            margin: 0 auto;
            background: #f4f6fb;
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
            background: #fff;
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
            background: #f0f5ff;
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
        .legend {
            display: flex;
            gap: 16px;
            margin-bottom: 16px;
            font-size: 13px;
            align-items: center;
        }
        .legend-item { display: flex; align-items: center; gap: 6px; }
        .legend-box { width: 16px; height: 16px; border-radius: 4px; }
        .legend-theory { background: #e3f2fd; border: 1px solid #90caf9; }
        .legend-lab { background: #e8f5e9; border: 1px solid #a5d6a7; }
        .class-section { margin-bottom: 40px; }
        .class-title {
            background: #0d52b3;
            color: white;
            padding: 13px 20px;
            border-radius: 10px 10px 0 0;
            font-size: 17px;
            font-weight: 700;
            text-align: center;
            letter-spacing: 0.5px;
        }
        .timetable-table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            border-radius: 0 0 10px 10px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(13,82,179,0.08);
        }
        .timetable-table thead tr { background: #1a63c4; }
        .timetable-table th {
            padding: 11px 14px;
            text-align: center;
            font-weight: 600;
            font-size: 12px;
            color: #fff;
            text-transform: uppercase;
            letter-spacing: 0.8px;
        }
        .timetable-table td {
            padding: 11px 14px;
            text-align: center;
            border: 1px solid #dce6f7;
            font-size: 13px;
            color: #222;
        }
        .day-header {
            background: #0d52b3;
            color: white !important;
            font-weight: 600;
            font-size: 13px;
            min-width: 100px;
        }
        .lab-slot {
            background: #e8f5e9 !important;
            border-left: 4px solid #2e7d32 !important;
            color: #1b5e20;
        }
        .theory-slot {
            background: #e3f2fd !important;
            border-left: 4px solid #1565c0 !important;
            color: #0d3b8a;
        }
        .timetable-table tbody tr:hover td { opacity: 0.92; transition: opacity 0.2s; }
        .no-data { text-align: center; padding: 50px; color: #999; font-size: 18px; }
    </style>
</head>
<body>
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
            <button formaction="ConfirmTimetableServlet" type="submit" class="confirmtt-button">Confirm</button>
        </form>
    </div>

    <div class="legend">
        <div class="legend-item"><div class="legend-box legend-theory"></div> Theory</div>
        <div class="legend-item"><div class="legend-box legend-lab"></div> Lab</div>
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
            for (Map.Entry<String, List<TimetableSlot>> entry : slotsByClass.entrySet()) {
                String className = entry.getKey();
                List<TimetableSlot> classSlots = entry.getValue();
    %>
    <div class="class-section">
        <div class="class-title">Class: <%= className %></div>
        <table class="timetable-table">
            <thead>
                <tr>
                    <th>Day</th>
                    <th>Lecture Name</th>
                    <th>Time Slot</th>
                    <th>Faculty Name</th>
                </tr>
            </thead>
            <tbody>
                <%
                    String[] dayOrder = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                    Map<String, List<TimetableSlot>> slotsByDay = new LinkedHashMap<>();
                    for (String d : dayOrder) slotsByDay.put(d, new ArrayList<>());
                    for (TimetableSlot slot : classSlots) {
                        if (slotsByDay.containsKey(slot.getDay())) slotsByDay.get(slot.getDay()).add(slot);
                    }
                    for (String day : dayOrder) {
                        List<TimetableSlot> daySlots = slotsByDay.get(day);
                        if (!daySlots.isEmpty()) {
                            Collections.sort(daySlots, (s1, s2) -> s1.getSlot().getStartTime().compareTo(s2.getSlot().getStartTime()));
                            for (int i = 0; i < daySlots.size(); i++) {
                                TimetableSlot slot = daySlots.get(i);
                                String name = slot.getLectureName();
                                boolean isLab = name != null && (name.toLowerCase().contains("lab") || name.toLowerCase().contains("workshop") || name.toLowerCase().contains("project") || name.toLowerCase().contains("internship"));
                                String rowClass = isLab ? "lab-slot" : "theory-slot";
                %>
                <tr class="<%= rowClass %>">
                    <% if (i == 0) { %>
                        <td rowspan="<%= daySlots.size() %>" class="day-header"><strong><%= day %></strong></td>
                    <% } %>
                    <td><%= name != null ? name : "-" %></td>
                    <td><%= slot.getSlot().getStartTime() %> - <%= slot.getSlot().getEndTime() %></td>
                    <td><%= slot.getFacultyName() != null ? slot.getFacultyName() : "-" %></td>
                </tr>
                <% } } } %>
            </tbody>
        </table>
    </div>
    <% } } %>
</div>
</body>
</html>
