<%@page import="com.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="com.dao.*" %>
<%@page import="com.model.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Dashboard</title>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />


  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/studentdashboard_style.css " />
</head>
<body>

<!--   HEADER  -->
<header>
<p align="left"> <a href="${pageContext.request.contextPath}/index.jsp"><font color=blue><b>Back</b></font>
 
</a></p>
  <div class="header-top">
    <div class="logo">
      <span class="icon">🎓</span>
      <span class="title">DASHBOARD</span>
    </div>
  </div>

  <!-- HORIZONTAL NAV -->
  <nav>
    <button  onclick="showPage('dashboard', this)"><i class="fas fa-graduation-cap"></i> 
     Dashboard</button>
    <button onclick="showPage('subjects', this)"><i class="fas fa-book"></i> Subjects</button>
    <button class="active" onclick="showPage('timetable', this)"><i class="fas fa-table"></i>  Time-Table</button>
    <button onclick="showPage('notifications', this)"> <i class="fas fa-bell"></i> Notifications</button>
   
  </nav>
</header>

<!-- ── MAIN ── -->
<main>

  <!-- ── DASHBOARD PAGE ── -->
  <div class="page " id="page-dashboard">
    <div class="hero">
      <h2>Student Dashboard</h2>
      <p>Welcome back! Use the menu to manage your courses, view your timetable, and stay up-to-date with announcements.</p>
    </div>
  </div>

  <!-- ── SUBJECTS PAGE ── -->
  <div class="page" id="page-subjects">
    <div class="card">
      <div class="card-title">
        <span style="font-size:24px">📘</span>
        <h2>Course Subjects</h2>
      </div>
      <p class="card-subtitle">View the subject list for your specific program and semester.</p>

      <div class="form-row">
        <div class="form-group">
          <label>Select Branch:</label>
          <select id="branchSelect" onchange="resetResult()">
            <option value="">-- Select Branch --</option>
            <option value="CSE">Computer Science Engineering</option>
            <option value="DS">Data Science </option>
            <option value="ECE">Electronics & Communication</option>
            <option value="ME">Mechanical Engineering</option>
            <option value="CIVIL">Civil Engineering</option>
          </select>
        </div>
        <div class="form-group">
          <label>Select Semester:</label>
          <select id="semesterSelect" onchange="resetResult()">
            <option value="">-- Select Semester --</option>
            <option value="1">Semester 1</option>
            <option value="2">Semester 2</option>
            <option value="3">Semester 3</option>
            <option value="4">Semester 4</option>
            <option value="5">Semester 5</option>
            <option value="6">Semester 6</option>
            <option value="6">Semester 7</option>
            <option value="6">Semester 8</option>
          </select>
        </div>
        <button class="btn-show" onclick="showSubjects()">Show Subjects</button>
      </div>

      <div id="subjectResult"></div>
    </div>
  </div>

  <!-- ── TIMETABLE PAGE ── -->
  <div class="page active" id="page-timetable">
    <div class="card">
      <div class="card-title">
        <span style="font-size:24px">📅</span>
        <h2>Class Time-Table</h2>
      </div>
      <p class="card-subtitle">Select your course details to view the weekly class schedule.</p>

      <!-- FILTER FORM -->
      <div class="form-row tt-form">
        <div class="form-group">
          <label>Select Branch:</label>
          <select id="ttBranch" onchange="resetTimetable()">
            <option value="">-- Select Branch --</option>
            <option value="CSE">Computer Science Engineering</option>
            <option value="DS">Data Science </option>
            <option value="ECE">Electronics & Communication</option>
            <option value="ME">Mechanical Engineering</option>
            <option value="CIVIL">Civil Engineering</option>
          </select>
        </div>
        <div class="form-group">
          <label>Select Semester:</label>
          <select id="ttSemester" onchange="resetTimetable()">
            <option value="">-- Select Semester --</option>
            <option value="1">Semester 1</option>
            <option value="2">Semester 2</option>
            <option value="3">Semester 3</option>
            <option value="4">Semester 4</option>
            <option value="5">Semester 5</option>
            <option value="6">Semester 6</option>
            <option value="6">Semester 7</option>
            <option value="6">Semester 8</option>
          </select>
        </div>
        <div class="form-group">
          <label>Year:</label>
          <input type="text" id="ttYear" placeholder="e.g. 2024-25" onchange="resetTimetable()" />
        </div>
        <button class="btn-show" onclick="showTimetable()">Show Time-Table</button>
      </div>

      <div id="timetableResult"></div>
    </div>
  </div>

   <!--  NOTIFICATIONS PAGE -->

<%

List<Notification> notifications =
DAOFactory.getNotificationDao()
          .getNotificationsByRole("STUDENT");

%>

<!-- NOTIFICATIONS PAGE -->
<div class="page" id="page-notifications">

    <div class="card">

        <!-- Header -->
        <div class="card-title">

            <h2>Notifications</h2>

        </div>

        <p class="card-subtitle">

            Stay updated with the latest announcements
            and reminders.

        </p>

        <!-- Notification List -->
        <div class="notif-list">

        <%

        if(notifications.isEmpty()){

        %>

            <!-- Empty -->
            <div class="notif-item">

                <div class="notif-body">

                    <div class="notif-title">

                        No Notifications Available

                    </div>

                </div>

            </div>

        <%

        } else {

            for(Notification n : notifications){

        %>

            <!-- Single Notification -->
            <div class="notif-item">

                <!-- Icon -->
                <div class="notif-icon">

                    🔔

                </div>

                <!-- Body -->
                <div class="notif-body">

                    <!-- Title -->
                    <div class="notif-title">

                        <%= n.getTitle() %>

                    </div>

                    <!-- Message -->
                    <div style="
                        font-size:14px;
                        color:#666;
                        margin-top:4px;
                        line-height:1.5;">

                        <%= n.getMessage() %>

                    </div>

                    <!-- Time -->
                    <div class="notif-time">

                        🕒 <%= n.getCreatedAt() %>

                    </div>

                </div>

                <!-- Type Badge -->
                <span class="notif-type">

                    notice

                </span>

            </div>

        <%

            }
        }

        %>

        </div>

    </div>

</div>

  
</main>

<script src="${pageContext.request.contextPath}/assets/js/st_dashboard.js "></script>
</body>
</html>