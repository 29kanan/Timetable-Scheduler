<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.util.DBConnection , com.dao.*"%>
    <%@page import="java.sql.* , com.model.* , java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Registration Form</title>
    <style>
        body{
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container{
            background: #e3dcdc;
            width: 380px;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }
        h2{
            text-align: center;
            margin-bottom: 20px;
            color: #0c2258;
        }
        label{
            font-weight: bold;
        }
        input, select{
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button{
            width: 100%;
            padding: 12px;
            background: #2b528b;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        button:hover{
            background: #0a0547;
        }
    </style>
</head>
<body>

    <div class="container">
    <p align="left"> <a href="teacher_login.jsp">
 back
</a></p>
        <h2>Teacher Registration</h2>
       <form  action="${pageContext.request.contextPath}/RegisterFacServlet" method="post">
            

            <label for="name">Full Name</label>
            <input type="text" name="name" placeholder="Enter Full Name" required>

            <label for="email">Email</label>
            <input type="email" name="email" placeholder="Enter Email" required>

            <label for="phone">Phone Number</label>
            <input type="text" name="phone" placeholder="Enter Phone Number"
       pattern="[0-9]{10}" maxlength="10" required
       title="Phone number must be exactly 10 digits">

            <label for="password">Password</label>
            <input type="password" name="password" placeholder="Create Password" required>

            <label for="dept">Department</label>
            <select name="dept" required>
                <option value="">Select Department</option>
   
<%
    try {
    	 List<Department> dept=DAOFactory.getDepartmentDao().getAllDepartments();
        for(Department d : dept) {
%>
        <option value="<%= d.getDept_name() %>">
                <%= d.getDept_name() %>
        </option>

<%
        }
    } catch(Exception e) {
        out.println(e);
    }
%>

</select>


            <button type="submit">Register</button>
        </form>
        
        <%
    String msg = (String)request.getAttribute("msg");
    if(msg != null){
%>
<script>alert("<%=msg%>");</script>
<%
    }
%>
    </div>

</body>
</html>