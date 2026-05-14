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

    padding:20px;

    background:linear-gradient(135deg,#dbeafe,#eff6ff,#bfdbfe);
}


/* MAIN CONTAINER */

.container{

    width:100%;

    max-width:900px;

    height:600px;

    background:white;

    border-radius:30px;

    overflow:hidden;

    display:grid;

    grid-template-columns:1fr 1fr;

    box-shadow:0 15px 45px rgba(0,0,0,0.12);
}


/* LEFT PANEL */

.left-panel{

    padding:50px;

    background:linear-gradient(135deg,#60a5fa,#93c5fd,#dbeafe);

    color:white;

    display:flex;

    flex-direction:column;

    justify-content:center;

    align-items:center;

    text-align:center;

    position:relative;
}


/* BACK BUTTON */

.back-btn{

    position:absolute;

    top:25px;

    left:25px;
}

.back-btn a{

    text-decoration:none;

    color:white;

    font-size:15px;

    font-weight:bold;
}


/* ICON */

.portal-icon{

    width:120px;

    height:120px;

    border-radius:50%;

    background:rgba(255,255,255,0.2);

    display:flex;

    justify-content:center;

    align-items:center;

    margin-bottom:30px;

    border:2px solid rgba(255,255,255,0.3);

    backdrop-filter:blur(10px);
}

.portal-icon i{

    font-size:55px;

    color:white;
}


/* LEFT TEXT */

.left-panel h1{

    font-size:42px;

    margin-bottom:18px;
}

.left-panel p{

    line-height:1.8;

    color:#eff6ff;

    font-size:17px;

    max-width:320px;
}


/* RIGHT PANEL */

.right-panel{

    padding:55px;

    background:white;

    display:flex;

    flex-direction:column;

    justify-content:center;
}


/* HEADING */

.right-panel h2{

    font-size:42px;

    color:#2563eb;

    margin-bottom:10px;
}

.right-panel p{

    color:#64748b;

    margin-bottom:30px;

    font-size:15px;
}


/* LABEL */

label{

    display:block;

    margin-bottom:8px;

    margin-top:15px;

    font-size:14px;

    color:#1e3a8a;

    font-weight:bold;

    letter-spacing:1px;
}


/* INPUT */

.input-box{

    position:relative;

    margin-bottom:22px;
}

.input-box input{

    width:100%;

    padding:16px;

    border-radius:14px;

    border:1px solid #cbd5e1;

    background:#f8fbff;

    color:#1e293b;

    font-size:15px;

    outline:none;

    transition:0.3s;
}

.input-box input:focus{

    border-color:#60a5fa;

    box-shadow:0 0 10px rgba(96,165,250,0.25);
}


/* INPUT ICON */

.input-box i{

    position:absolute;

    right:15px;

    top:18px;

    color:#3b82f6;
}


/* FORGOT PASSWORD */

.forgot-box{

    text-align:right;

    margin-top:-10px;

    margin-bottom:25px;
}

.forgot-box a{

    text-decoration:none;

    color:#2563eb;

    font-size:14px;

    font-weight:bold;
}

.forgot-box a:hover{

    text-decoration:underline;
}


/* LOGIN BUTTON */

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
}

.btn:hover{

    transform:translateY(-2px);

    box-shadow:0 10px 20px rgba(37,99,235,0.25);
}


/* OR TEXT */

.or{

    text-align:center;

    margin:25px 0;

    color:#64748b;

    font-weight:bold;
}


/* REGISTER BUTTON */

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


/* RESPONSIVE */

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

        <div class="back-btn">

            <a href="${pageContext.request.contextPath}/index.jsp">
                ← Back
            </a>

        </div>

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


            <!-- EMAIL -->

            <label>EMAIL</label>

            <div class="input-box">

                <input type="email"
                name="email"
                placeholder="you@example.com"
                required>

               

            </div>


            <!-- PASSWORD -->

            <label>PASSWORD</label>

            <div class="input-box">

                <input type="password"
                name="password"
                placeholder="Enter password"
                required>

              

            </div>


            <!-- FORGOT PASSWORD -->

            <div class="forgot-box">

                <a href="${pageContext.request.contextPath}/views/forgotPassword.jsp">

                    Forgot Password?

                </a>

            </div>


            <!-- LOGIN BUTTON -->

            <button class="btn" type="submit">

                Sign In →

            </button>

        </form>


        <!-- OR -->

        <div class="or">OR</div>


        <!-- REGISTER BUTTON -->

        <button class="secondary-btn"

        onclick="window.location.href='${pageContext.request.contextPath}/views/reg_faculty.jsp'">

            New? Register Here

        </button>

    </div>

</div>

</body>
</html>