<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- ================================================================
     FILE 6: reset_password.jsp  ← NEW FILE
     Path  : src/main/webapp/views/reset_password.jsp
     Action: Naya file banao is path pe, yeh code paste karo
     Style : Exactly teacher_login.jsp jaisa (blue split panel)
     ================================================================ --%>

<%
    // Security: Seedha yahan nahi aa sakte bina verification ke
    HttpSession s = request.getSession(false);
    boolean sessionValid = (s != null && s.getAttribute("resetEmail") != null);
    boolean successFlag  = ("true".equals(request.getAttribute("success")));

    // Agar success nahi aur session bhi nahi → back to forgot page
    if (!sessionValid && !successFlag) {
        response.sendRedirect(request.getContextPath() + "/views/forgot_password.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password - Faculty Portal</title>

<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>

<style>

* { margin:0; padding:0; box-sizing:border-box; font-family:Arial, sans-serif; }

body {
    min-height: 100vh;
    display: flex; justify-content: center; align-items: center;
    padding: 20px;
    background: linear-gradient(135deg, #dbeafe, #eff6ff, #bfdbfe);
}

.container {
    width: 100%; max-width: 900px; height: 600px;
    background: white; border-radius: 30px; overflow: hidden;
    display: grid; grid-template-columns: 1fr 1fr;
    box-shadow: 0 15px 45px rgba(0,0,0,0.12);
}

/* LEFT PANEL */
.left-panel {
    padding: 50px;
    background: linear-gradient(135deg, #60a5fa, #93c5fd, #dbeafe);
    color: white;
    display: flex; flex-direction: column;
    justify-content: center; align-items: center;
    text-align: center; position: relative;
}
.portal-icon {
    width: 120px; height: 120px; border-radius: 50%;
    background: rgba(255,255,255,0.2);
    display: flex; justify-content: center; align-items: center;
    margin-bottom: 30px;
    border: 2px solid rgba(255,255,255,0.3);
    backdrop-filter: blur(10px);
}
.portal-icon i { font-size: 55px; color: white; }
.left-panel h1 { font-size: 36px; margin-bottom: 18px; }
.left-panel p  { line-height: 1.8; color: #eff6ff; font-size: 16px; max-width: 280px; }

.verified-chip {
    margin-top: 16px;
    background: rgba(255,255,255,0.2);
    border: 1px solid rgba(255,255,255,0.4);
    border-radius: 20px;
    padding: 7px 18px;
    font-size: 14px;
    display: inline-flex; align-items: center; gap: 7px;
}

/* RIGHT PANEL */
.right-panel {
    padding: 50px 55px; background: white;
    display: flex; flex-direction: column; justify-content: center;
}
.right-panel h2 { font-size: 36px; color: #2563eb; margin-bottom: 8px; }
.right-panel .sub { color: #64748b; margin-bottom: 20px; font-size: 15px; }

/* ERROR */
.msg-error {
    background: #fef2f2; color: #dc2626;
    border: 1px solid #fecaca;
    padding: 12px 16px; border-radius: 10px;
    font-size: 14px; margin-bottom: 16px;
    display: flex; align-items: center; gap: 8px;
}

/* LABEL — same as teacher_login.jsp */
label {
    display: block; margin-bottom: 8px; margin-top: 15px;
    font-size: 14px; color: #1e3a8a;
    font-weight: bold; letter-spacing: 1px;
}

/* INPUT BOX */
.input-box { position: relative; margin-bottom: 4px; }
.input-box input {
    width: 100%; padding: 16px 44px 16px 16px;
    border-radius: 14px; border: 1px solid #cbd5e1;
    background: #f8fbff; color: #1e293b;
    font-size: 15px; outline: none; transition: 0.3s;
}
.input-box input:focus {
    border-color: #60a5fa;
    box-shadow: 0 0 10px rgba(96,165,250,0.25);
}
.eye-btn {
    position: absolute; right: 14px; top: 17px;
    background: none; border: none; cursor: pointer;
    color: #3b82f6; font-size: 15px;
}

/* Password match indicator */
.match-msg { font-size: 12px; margin-top: 5px; margin-bottom: 2px; display: none; }
.match-ok   { color: #16a34a; }
.match-fail { color: #dc2626; }

/* BUTTON */
.btn {
    width: 100%; padding: 16px; border: none;
    border-radius: 15px;
    background: linear-gradient(135deg, #60a5fa, #2563eb);
    color: white; font-size: 17px; font-weight: bold;
    cursor: pointer; transition: 0.3s; margin-top: 18px;
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

<%-- ✅ SUCCESS: Password updated — JS alert dikhao phir login pe bhejo --%>
<% if ("true".equals(request.getAttribute("success"))) { %>
<script>
    alert("✅ Password updated successfully!\nPlease login with your new password.");
    window.location.href = "<%= request.getContextPath() %>/views/teacher_login.jsp";
</script>

<% } %>

<div class="container">

    <!-- LEFT PANEL -->
    <div class="left-panel">
        <div class="portal-icon">
            <i class="fa-solid fa-lock-open"></i>
        </div>
        <h1>New Password</h1>
        <p>Identity verified. Now set a strong new password for your Faculty account.</p>
        <span class="verified-chip">
            <i class="fa-solid fa-circle-check"></i> Identity Verified ✓
        </span>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right-panel">

        <h2>Reset Password</h2>
        <p class="sub">Enter and confirm your new password</p>

        <%-- Error message --%>
        <% if (request.getAttribute("error") != null) { %>
            <div class="msg-error">
                <i class="fa-solid fa-circle-exclamation"></i>
                <%= request.getAttribute("error") %>
            </div>
        <% } %>

        <form method="post"
              action="${pageContext.request.contextPath}/ResetPasswordServlet">

            <!-- NEW PASSWORD -->
            <label>NEW PASSWORD</label>
            <div class="input-box">
                <input type="password"
                       name="newPassword"
                       id="newPass"
                       placeholder="Enter new password"
                       minlength="6"
                       required
                       oninput="checkMatch()" />
                <button type="button" class="eye-btn" onclick="toggleEye('newPass', this)">
                    <i class="fa-regular fa-eye"></i>
                </button>
            </div>

            <!-- CONFIRM PASSWORD -->
            <label>CONFIRM PASSWORD</label>
            <div class="input-box">
                <input type="password"
                       name="confirmPassword"
                       id="confirmPass"
                       placeholder="Re-enter new password"
                       minlength="6"
                       required
                       oninput="checkMatch()" />
                <button type="button" class="eye-btn" onclick="toggleEye('confirmPass', this)">
                    <i class="fa-regular fa-eye"></i>
                </button>
            </div>

            <!-- Match indicator -->
            <div class="match-msg" id="matchMsg"></div>

            <button type="submit" class="btn">
                <i class="fa-solid fa-check"></i>&nbsp; Update Password
            </button>

        </form>

    </div>
</div>

<script>
    // Show/hide password toggle
    function toggleEye(fieldId, btn) {
        const field = document.getElementById(fieldId);
        const icon  = btn.querySelector('i');
        if (field.type === 'password') {
            field.type = 'text';
            icon.className = 'fa-regular fa-eye-slash';
        } else {
            field.type = 'password';
            icon.className = 'fa-regular fa-eye';
        }
    }

    // Live password match check
    function checkMatch() {
        const p1  = document.getElementById('newPass').value;
        const p2  = document.getElementById('confirmPass').value;
        const msg = document.getElementById('matchMsg');

        if (!p2) { msg.style.display = 'none'; return; }

        msg.style.display = 'block';
        if (p1 === p2) {
            msg.textContent = '✓ Passwords match';
            msg.className   = 'match-msg match-ok';
        } else {
            msg.textContent = '✗ Passwords do not match';
            msg.className   = 'match-msg match-fail';
        }
    }
</script>

</body>
</html>