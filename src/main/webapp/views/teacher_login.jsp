<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Faculty Login</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Arial, sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#0f172a;
    padding:20px;
}

/* Main Card */

.container{
    width:100%;
    max-width:1100px;
    background:rgba(255,255,255,0.05);
    backdrop-filter:blur(15px);
    border-radius:25px;
    overflow:hidden;
    display:grid;
    grid-template-columns:1fr 1fr;
    box-shadow:0 10px 40px rgba(0,0,0,0.4);
}

/* Left Side */

.left-panel{
    padding:50px;
    background:linear-gradient(135deg,#1e1b4b,#0f766e);
    color:white;
    position:relative;
}

.portal-icon{
    width:70px;
    height:70px;
    background:#ff6b6b;
    border-radius:15px;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:30px;
    margin-bottom:30px;
}

.left-panel h1{
    font-size:45px;
    margin-bottom:20px;
}

.left-panel p{
    line-height:1.8;
    color:#d1d5db;
    margin-bottom:35px;
}

.feature-box{
    background:rgba(255,255,255,0.12);
    border-radius:20px;
    padding:25px;
}

.feature-box h3{
    margin-bottom:20px;
    color:#fff;
}

.feature{
    display:flex;
    justify-content:space-between;
    margin:15px 0;
    color:#f3f4f6;
}

/* Right Side */

.right-panel{
    padding:50px;
    background:rgba(15,23,42,0.9);
    color:white;
}

.right-panel h2{
    font-size:40px;
    margin-bottom:10px;
}

.right-panel p{
    color:#cbd5e1;
    margin-bottom:30px;
}

label{
    display:block;
    margin-bottom:8px;
    font-size:14px;
    color:#cbd5e1;
    letter-spacing:1px;
}

.input-box{
    position:relative;
    margin-bottom:25px;
}

.input-box input{
    width:100%;
    padding:15px;
    border:none;
    outline:none;
    border-radius:12px;
    background:#1e293b;
    color:white;
    font-size:16px;
}

.input-box i{
    position:absolute;
    right:15px;
    top:17px;
    color:#94a3b8;
}

.demo{
    background:#1e3a8a;
    padding:12px;
    border-radius:12px;
    margin-bottom:25px;
    font-size:14px;
}

.btn{
    width:100%;
    padding:15px;
    border:none;
    border-radius:14px;
    background:linear-gradient(135deg,#38bdf8,#818cf8);
    color:white;
    font-size:18px;
    font-weight:bold;
    cursor:pointer;
    transition:0.3s;
}

.btn:hover{
    transform:translateY(-2px);
    opacity:0.9;
}

.or{
    text-align:center;
    margin:25px 0;
    color:#cbd5e1;
}

.secondary-btn{
    width:100%;
    padding:14px;
    border:1px solid rgba(255,255,255,0.2);
    background:transparent;
    color:white;
    border-radius:12px;
    margin-bottom:15px;
    cursor:pointer;
    font-size:16px;
}

.secondary-btn:hover{
    background:rgba(255,255,255,0.08);
}

/* Responsive */

@media(max-width:900px){

    .container{
        grid-template-columns:1fr;
    }

    .left-panel{
        display:none;
    }

    .right-panel{
        padding:35px;
    }
}

</style>

</head>

<body>

<div class="container">

    <!-- LEFT PANEL -->

    <div class="left-panel">
<p align="left"> <a href="${pageContext.request.contextPath}/index.jsp">
 back
</a></p>
        <div class="portal-icon">
            <i class="fa-solid fa-user-tie"></i>
        </div>

        <h1>Faculty Portal</h1>

        <p>
            Access your personal dashboard to view your schedule,
            assigned subjects and classroom information.
        </p>


    </div>

    <!-- RIGHT PANEL -->

    <div class="right-panel">

        <h2>Faculty Sign In</h2>

        <p>
            Enter your registered email and password
        </p>

        <form method="post"
        action="${pageContext.request.contextPath}/show_msgServlet">

            <label>EMAIL</label>

            <div class="input-box">
                <input type="email"
                name="email"
                placeholder="you@example.com"
                required>

                <i class="fa-solid fa-envelope"></i>
            </div>

            <label>PASSWORD</label>

            <div class="input-box">
                <input type="password"
                name="password"
                placeholder="Enter password"
                required>

                <i class="fa-solid fa-eye"></i>
            </div>


            <button class="btn" type="submit">
                Sign In →
            </button>

        </form>

        <div class="or">OR</div>

        <button class="secondary-btn"
        onclick="window.location.href='${pageContext.request.contextPath}/views/reg_faculty.jsp'">

            New? Register Here

        </button>

       

    </div>

</div>

</body>
</html>