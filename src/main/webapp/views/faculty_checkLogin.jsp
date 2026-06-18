<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> Faculty Login Form | TTS </title>
<style>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial ;
        background: #92a9bf;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        
    }

    .login-card {
        background: white;
        padding: 25px 25px 25px 25px;
        border-radius: 15px;
        box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        width: 90%;
        max-width: 380px;
        text-align: center;
        border: 4px solid  rgba(10,17,69,0.3);
        
    }

   
    .icon-box {
        width: 110px;
        height: 110px;
        border-radius: 20px;
        margin: 0 auto 15px;
        display: flex;
        justify-content: center;
        align-items: center;
        border : 2px solid rgba(10, 17, 69, 0.3);
    }
    .icon-box img { 
          width: 100px;
        height: 100px;
    }
    .login-card h2 {
        margin-bottom: 5px;
        color: #120a62;
        font-family:  cursive;
    }

    .login-card p {
        font-size: 16px;
        color: #5969cb;
        margin-bottom: 20px;
    }
 
    label{ 
        display:block; 
       text-align: left;
       font-size: 16px;
       font-weight: bold;
       color:#120a62;
    } 

    input {
        width: 100%;
        padding: 12px;
        border-radius: 8px;
        border: 1px solid #bbb;
        margin: 8px 0;
    }
    

    .btn {
        width: 100%;
        padding: 12px;
        background: linear-gradient(135deg, #8599ff, #6eeaff);
        border: none;
        border-radius: 10px;
        font-size: 16px;
        color: white;
        margin-top: 10px;
        cursor: pointer;
    }
     
    .links {
        margin-top: 10px;
        font-size: 14px;
    }
.options {
    display:flex;
    justify-content : space-between;
    align-items: center;
    margin : 8px 0 15px 0 ;
}

.rem-box { 

    display: flex;
    align-items: center;
    gap: 6px;
    font-size: 16px;
    color: #120a62;
    font-weight: 500;
    cursor: pointer;
}
    .options a {
        color: #120a62;
        text-decoration: none;
        font-size: 16px;
        font-weight: 500;
    }
   
</style>

</head>
<body>

<div class="login-card">
    <h2>Check your account has been APPROVED or REGECTED by admin !!</h2>
<form action="${pageContext.request.contextPath}/show_msgServlet" method="post">
    <label  >Email</label>
    <input type="email" placeholder="Enter Email Id" name="email" required="required">

    <label>Password</label>
    <input type="password" placeholder="Enter password" name="password" required="required">


    <button class="btn">Check Account</button>
</form>
       <h3 style="color:green;">
            ${error1}
           </h3>
           <h3 style="color:red;">
            ${error2}
           </h3>
           <h3 style="color:blue;">
            ${error3}
           </h3>
          
    <div class="links">
  
      if your account has been APPROVED by admin then <a href="${pageContext.request.contextPath}/views/teacher_login.jsp">click here to login</a>
    </div>
</div>

</body>
</html>