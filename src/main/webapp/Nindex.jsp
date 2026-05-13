<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jay shree ganesh</title>
    <link rel="stylesheet" href="assets/css/indexStyle.css" />
</head>
<body>
    <div class="container">
        <h1 class="headline">Who Are You?</h1>
        <div class="roles">
            <a href="${pageContext.request.contextPath}/views/admin_login.jsp" class="role-card admin">
                <img src="assets/img/admin-icon.svg" alt="Admin Icon">
                <h2>Admin</h2>
                <p>Manage faculty, lectures, department, and create and update timetables.</p>
                 <button class="continue-btn" onclick="window.location.href='${pageContext.request.contextPath}/views/admin_login.jsp'">Continue</button> 
             </a>
            <a href="${pageContext.request.contextPath}/views/teacher_login.jsp" class="role-card teacher">
                <img src="assets/img/teacher-icon.svg" alt="Teacher Icon">
                <h2>Teacher</h2>
                <p>See timetable, create or edit your profile, check day-wise lectures.</p>
                <button class="continue-btn" onclick="window.location.href='${pageContext.request.contextPath}/views/teacher_login.jsp'">Continue</button>
            </a>
            <a href="${pageContext.request.contextPath}/views/studentDashB.jsp" class="role-card student">
                <img src="assets/img/student-icon.svg" alt="Student Icon">
                <h2>Student</h2>
                <p>Search class timetable and day-wise schedule.</p>
                <button class="continue-btn" onclick="window.location.href='${pageContext.request.contextPath}/views/studentDashB.jsp'">Continue</button>
            </a>
        </div>
        <footer>
            SDITS KHANDWA 
        </footer>
    </div>
</body>
</html>