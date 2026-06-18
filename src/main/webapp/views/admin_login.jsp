<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title> Admin Access | TTS </title>
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
    
    background: linear-gradient(135deg,#dbeafe,#eff6ff,#bfdbfe);
    
    padding:20px;
}

/* MAIN CARD */

.main-container{
    width:100%;
    max-width:900px;
    height : 550px;
    
    display:grid;
    grid-template-columns:1fr 1fr;
    
    background:white;
    
    border-radius:28px;
    
    overflow:hidden;
    
    box-shadow:0 10px 40px rgba(0,0,0,0.12);
}


/* LEFT SIDE */

.left-panel{
    
    background: linear-gradient(135deg,#60a5fa,#93c5fd,#dbeafe);
    
    color:white;
    
    padding:50px 40px;
    
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.icon-box{

    width:120px;
    height:120px;

    margin:0 auto 25px;

    border-radius:50%;

    background:rgba(255,255,255,0.25);

    display:flex;
    justify-content:center;
    align-items:center;

    backdrop-filter:blur(10px);

    border:2px solid rgba(255,255,255,0.4);
}

.icon-box i{

    font-size:55px;

    color:white;
}

.left-panel h1{
    font-size:42px;
    margin-bottom:15px;
}

.left-panel p{
    font-size:18px;
    line-height:1.7;
    color:#eef6ff;
}

.info-box{
    
    margin-top:35px;
    
    background:rgba(255,255,255,0.22);
    
    border-radius:18px;
    
    padding:25px;
    
    backdrop-filter:blur(8px);
}

.info-box h3{
    margin-bottom:15px;
    font-size:18px;
}

.info-item{
    
    display:flex;
    justify-content:space-between;
    
    margin:12px 0;
    
    font-size:16px;
}


/* RIGHT SIDE */

.right-panel{
    
    background:#ffffff;
    
    padding:50px 45px;
    
    display:flex;
    flex-direction:column;
    justify-content:center;
}

.right-panel h2{
    
    font-size:40px;
    
    color:#2563eb;
    
    margin-bottom:10px;
}

.sub-text{
    
    color:#64748b;
    
    margin-bottom:35px;
    
    font-size:16px;
}

label{
    
    display:block;
    
    margin-bottom:8px;
    
    margin-top:18px;
    
    color:#1e3a8a;
    
    font-weight:bold;
    
    font-size:15px;
}

input{
    
    width:100%;
    
    padding:15px;
    
    border-radius:14px;
    
    border:1px solid #cbd5e1;
    
    outline:none;
    
    font-size:15px;
    
    background:#f8fbff;
    
    transition:0.3s;
}

input:focus{
    
    border-color:#60a5fa;
    
    box-shadow:0 0 8px rgba(96,165,250,0.3);
}

.demo-box{
    
    margin-top:18px;
    
    background:#eff6ff;
    
    border-radius:14px;
    
    padding:14px;
    
    color:#1e40af;
    
    font-size:14px;
}

.login-btn{
    
    width:100%;
    
    margin-top:25px;
    
    padding:15px;
    
    border:none;
    
    border-radius:16px;
    
    background:linear-gradient(135deg,#60a5fa,#3b82f6);
    
    color:white;
    
    font-size:18px;
    
    cursor:pointer;
    
    transition:0.3s;
}

.login-btn:hover{
    
    transform:translateY(-2px);
    
    box-shadow:0 8px 20px rgba(59,130,246,0.3);
}

.back-btn{
    
    margin-top:20px;
    
    text-align:center;
}

.back-btn a{
    
    text-decoration:none;
    
    color:#2563eb;
    
    font-weight:bold;
}

.error{
    
    color:red;
    
    margin-top:15px;
    
    text-align:center;
}


/* MOBILE */

@media(max-width:768px){

    .main-container{
        grid-template-columns:1fr;
    }

    .left-panel{
        padding:35px;
    }

    .right-panel{
        padding:35px;
    }

    .left-panel h1{
        font-size:32px;
    }

    .right-panel h2{
        font-size:30px;
    }
}

</style>
</head>

<body>

<div class="main-container">

    <!-- LEFT SIDE -->

    <div class="left-panel">

        <div class="icon-box">
            <i class="fa-solid fa-user-shield"></i>
        </div>

        <h1>Admin Panel</h1>

        <p>
            Authorized administrators only.
            Manage faculty, departments,
            rooms and timetables.
        </p>

        </div>
        
    <!-- RIGHT SIDE -->

    <div class="right-panel">

        <h2>Welcome Back </h2>

        <div class="sub-text">
            Sign in to admin dashboard
        </div>

        <form action="${pageContext.request.contextPath}/adminLogin" method="post">

            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter Email"
                   required>

            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter Password"
                   required>

            

            <button type="submit" class="login-btn">
                Sign In →
            </button>

        </form>

        <div class="error">
            ${error}
        </div>

        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/index.jsp">
                ← Back to Home
            </a>
        </div>

    </div>

</div>

</body>
</html>