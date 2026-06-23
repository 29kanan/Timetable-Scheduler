<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="com.dao.*"%>
<%@page import="com.model.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Faculty Registration</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial,sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
    background:linear-gradient(135deg,#dbeafe,#eff6ff,#bfdbfe);
}

.container{
    width:100%;
    max-width:650px;
    background:white;
    border-radius:30px;
    overflow:hidden;
    box-shadow:0 15px 45px rgba(0,0,0,0.12);
}

.right-panel{
    padding:45px;
    background:white;
}

.back-link{
    text-decoration:none;
    color:#2563eb;
    font-weight:bold;
    display:inline-block;
    margin-bottom:20px;
}

.right-panel h2{
    font-size:38px;
    color:#2563eb;
    margin-bottom:10px;
}

.right-panel p{
    color:#64748b;
    margin-bottom:25px;
    font-size:15px;
}

label{
    display:block;
    margin-bottom:8px;
    margin-top:12px;
    font-size:14px;
    color:#1e3a8a;
    font-weight:bold;
    letter-spacing:1px;
}

.input-box{
    position:relative;
    margin-bottom:18px;
}

.input-box input,
.input-box select{
    width:100%;
    padding:15px;
    border-radius:14px;
    border:1px solid #cbd5e1;
    background:#f8fbff;
    color:#1e293b;
    font-size:15px;
    outline:none;
    transition:0.3s;
}

.input-box input:focus,
.input-box select:focus{
    border-color:#60a5fa;
    box-shadow:0 0 10px rgba(96,165,250,0.25);
}

.input-box i{
    position:absolute;
    right:15px;
    top:18px;
    color:#3b82f6;
}

.time-row{
    display:flex;
    gap:15px;
}

.time-box{
    flex:1;
}

.btn{
    width:100%;
    padding:16px;
    border:none;
    border-radius:15px;
    background:linear-gradient(135deg,#60a5fa,#2563eb);
    color:white;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
    margin-top:10px;
}

.btn:hover{
    transform:translateY(-2px);
    box-shadow:0 10px 20px rgba(37,99,235,0.25);
}

.or{
    text-align:center;
    margin:20px 0;
    color:#64748b;
    font-weight:bold;
}

.secondary-btn{
    width:100%;
    padding:15px;
    border:1px solid #cbd5e1;
    background:white;
    color:#2563eb;
    border-radius:14px;
    font-size:16px;
    cursor:pointer;
    transition:0.3s;
}

.secondary-btn:hover{
    background:#eff6ff;
}

@media(max-width:900px){

    .container{
        max-width:95%;
    }

    .right-panel{
        padding:25px;
    }

    .time-row{
        flex-direction:column;
        gap:0;
    }
}

</style>
</head>

<body>
  <% 
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
        response.setHeader("Pragma","no-cache");//http 1.0
    	response.setHeader("Expires","0");// proxies
    	
     if(session.getAttribute("username")==null){
    	 
    	response.sendRedirect("teacher_login.jsp");
     }
  
  
 %>
<%
String msg = (String)request.getAttribute("msg");
if(msg != null){
%>
<script>
alert("<%=msg%>");
</script>
<%
}
%>

<div class="container">

    <div class="right-panel">

        <a class="back-link"
           href="../index.html">
            ← Back to Home
        </a>
      
        <h2 align="center">Faculty Registration</h2>

        <p align="center">
            Fill in your details to create your account.
        </p>
        
        <form action="${pageContext.request.contextPath}/RegisterFacServlet"
              method="post">

            <label>FULL NAME</label>
            <div class="input-box">
                <input type="text"
                       name="name"
                       placeholder="Enter Full Name"
                       required>
                <i class="fa-solid fa-user"></i>
            </div>

            <label>EMAIL</label>
            <div class="input-box">
                <input type="email"
                       name="email"
                       placeholder="you@example.com"
                       required>
                <i class="fa-solid fa-envelope"></i>
            </div>

            <label>PHONE NUMBER</label>
            <div class="input-box">
                <input type="text"
                       name="phone"
                       placeholder="Enter Phone Number"
                       pattern="[0-9]{10}"
                       maxlength="10"
                       required
                       title="Phone number must be exactly 10 digits">
                <i class="fa-solid fa-phone"></i>
            </div>

            <label>AVAILABILITY TIME</label>

            <div class="time-row">

                <div class="time-box">
                    <div class="input-box">
                        <input type="time"
                               name="availStart"
                               required>
                    </div>
                </div>

                <div class="time-box">
                    <div class="input-box">
                        <input type="time"
                               name="availEnd"
                               required>
                    </div>
                </div>

            </div>

            <label>PASSWORD</label>

            <div class="input-box">
                <input type="password"
                       name="password"
                       placeholder="Create Password"
                       required>
                <i class="fa-solid fa-lock"></i>
            </div>

            <label>DEPARTMENT</label>

            <div class="input-box">

                <select name="dept" required>

                    <option value="">Select Department</option>

                    <%
                    try{
                        List<Department> dept =
                            DAOFactory.getDepartmentDao().getAllDepartments();

                        for(Department d : dept){
                    %>

                    <option value="<%=d.getDept_name()%>">
                        <%=d.getDept_name()%>
                    </option>

                    <%
                        }
                    }catch(Exception e){
                        out.println(e);
                    }
                    %>

                </select>

                <i class="fa-solid fa-building"></i>

            </div>

            <button class="btn" type="submit">
                Register →
            </button>

        </form>

        <div class="or">OR</div>

        <button class="secondary-btn"
        onclick="window.location.href='${pageContext.request.contextPath}/views/teacher_login.jsp'">

            Already have an account? Sign In

        </button>

    </div>

</div>

</body>
</html>