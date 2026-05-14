<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String status = (String) request.getAttribute("status"); 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Faculty Request Status</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: white;
            width: 420px;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 5px 25px rgba(0,0,0,0.1);
            text-align: center;
            border-top: 8px solid navy;
        }

        .icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        .pending { color: orange; }
        .rejected { color: red; }
        .notreq { color: gray; }
        .approved { color: green; }

        h2 {
            color: navy;
        }

        p {
            color: #555;
            font-size: 15px;
        }

        .btn {
            margin-top: 20px;
            padding: 10px 20px;
            background-color: navy;
            color: white;
            border-radius: 6px;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #001f4d;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="card">

        <% if ("pending".equals(status)) { %>
            <div class="icon pending">⏳</div>
            <h2>Request Pending</h2>
            <p>Your request is under admin review.<br>
               Please wait for approval.</p>

        <% } else if ("rejected".equals(status)) { %>
            <div class="icon rejected">❌</div>
            <h2>Request Rejected</h2>
            <p>Your request has been rejected by admin.<br>
               Contact admin for more info.</p>

        <% }  else { %>
        <div class="icon rejected">❌</div>
        <h2>Invalid Entry or No Request Found</h2>
        <p>Invalid 	Email or Password <br> plz try again!!</p>

    <% } %>
<div>
        <% if (!"approved".equals(status)) { %>
            <br><a href="views/teacher_login.jsp" class="btn">Go Back</a>
        <% } %>
</div>
    </div>
</div>

</body>
</html>