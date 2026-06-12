<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- ================================================================
     FILE 5: forgot_password.jsp
     Path  : src/main/webapp/views/forgot_password.jsp
     Action: Puri purani file REPLACE karo → yeh paste karo
     Style : Exactly teacher_login.jsp jaisa (blue split panel)
     ================================================================ --%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password - Faculty Portal</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

* { margin:0; padding:0; box-sizing:border-box; font-family:Arial, sans-serif; }

body {
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    background: linear-gradient(135deg, #dbeafe, #eff6ff, #bfdbfe);
}

/* MAIN CONTAINER — same as teacher_login.jsp */
.container {
    width: 100%;
    max-width: 900px;
    height: 600px;
    background: white;
    border-radius: 30px;
    overflow: hidden;
    display: grid;
    grid-template-columns: 1fr 1fr;
    box-shadow: 0 15px 45px rgba(0,0,0,0.12);
}

/* LEFT PANEL */
.left-panel {
    padding: 50px;
    background: linear-gradient(135deg, #60a5fa, #93c5fd, #dbeafe);
    color: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    text-align: center;
    position: relative;
}

.back-btn { position: absolute; top: 25px; left: 25px; }
.back-btn a { text-decoration: none; color: white; font-size: 15px; font-weight: bold; }

.portal-icon {
    width: 120px; height: 120px;
    border-radius: 50%;
    background: rgba(255,255,255,0.2);
    display: flex; justify-content: center; align-items: center;
    margin-bottom: 30px;
    border: 2px solid rgba(255,255,255,0.3);
    backdrop-filter: blur(10px);
}
.portal-icon i { font-size: 55px; color: white; }
.left-panel h1 { font-size: 36px; margin-bottom: 18px; }
.left-panel p  { line-height: 1.8; color: #eff6ff; font-size: 16px; max-width: 280px; }

/* RIGHT PANEL */
.right-panel {
    padding: 50px 55px;
    background: white;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.right-panel h2 { font-size: 36px; color: #2563eb; margin-bottom: 8px; }
.right-panel .sub { color: #64748b; margin-bottom: 20px; font-size: 15px; }

/* ALERT MESSAGES */
.msg-error {
    background: #fef2f2;
    color: #dc2626;
    border: 1px solid #fecaca;
    padding: 12px 16px;
    border-radius: 10px;
    font-size: 14px;
    margin-bottom: 16px;
    display: flex;
    align-items: center;
    gap: 8px;
}

/* LABEL — same as teacher_login.jsp */
label {
    display: block;
    margin-bottom: 8px;
    margin-top: 15px;
    font-size: 14px;
    color: #1e3a8a;
    font-weight: bold;
    letter-spacing: 1px;
}

/* INPUT BOX — same as teacher_login.jsp */
.input-box { position: relative; margin-bottom: 4px; }

.input-box input {
    width: 100%;
    padding: 16px;
    border-radius: 14px;
    border: 1px solid #cbd5e1;
    background: #f8fbff;
    color: #1e293b;
    font-size: 15px;
    outline: none;
    transition: 0.3s;
}
.input-box input:focus {
    border-color: #60a5fa;
    box-shadow: 0 0 10px rgba(96,165,250,0.25);
}
.input-box i { position: absolute; right: 15px; top: 18px; color: #3b82f6; }

/* BUTTON — same as teacher_login.jsp */
.btn {
    width: 100%;
    padding: 16px;
    border: none;
    border-radius: 15px;
    background: linear-gradient(135deg, #60a5fa, #2563eb);
    color: white;
    font-size: 17px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
    margin-top: 20px;
}
.btn:hover { transform: translateY(-2px); box-shadow: 0 10px 20px rgba(37,99,235,0.25); }

@media(max-width:900px) {
    .container { grid-template-columns: 1fr; height: auto; }
    .left-panel { display: none; }
    .right-panel { padding: 40px 35px; }
}

</style>
</head>

<body>
<div class="container">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <div class="back-btn">
            <a href="${pageContext.request.contextPath}/views/teacher_login.jsp">← Back</a>
        </div>
        <div class="portal-icon">
            <i class="fa-solid fa-key"></i>
        </div>
        <h1>Reset Password</h1>
        <p>Enter your registered email and phone number to verify your account and reset your password.</p>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <h2>Forgot Password?</h2>
        <p class="sub">Verify your identity to continue</p>

        <%-- Error message --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="msg-error">
                <i class="fa-solid fa-circle-exclamation"></i>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form method="post"
              action="${pageContext.request.contextPath}/ForgetPasswordServlet">

            <!-- EMAIL -->
            <label>REGISTERED EMAIL</label>
            <div class="input-box">
                <input type="email"
                       name="email"
                       placeholder="your.email@example.com"
                       value="<%= request.getAttribute("typedEmail") != null ? request.getAttribute("typedEmail") : "" %>"
                       required />
                <i class="fa-solid fa-envelope"></i>
            </div>

            <!-- PHONE -->
            <label>REGISTERED PHONE NUMBER</label>
            <div class="input-box">
                <input type="tel"
                       name="phone"
                       placeholder="Enter your phone number"
                       value="<%= request.getAttribute("typedPhone") != null ? request.getAttribute("typedPhone") : "" %>"
                       required />
                <i class="fa-solid fa-phone"></i>
            </div>

            <button type="submit" class="btn" 
            onclick="window.location.href='${pageContext.request.contextPath}/views/Reset_password.jsp'">
            
                Verify &amp; Continue &nbsp;<i class="fa-solid fa-arrow-right"></i>
            </button>

        </form>

    </div>
</div>
</body>
</html>