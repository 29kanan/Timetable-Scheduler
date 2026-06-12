// ================== APP INIT ==================
document.addEventListener("DOMContentLoaded", () => {
    console.log("TimeTable Pro Loaded 🚀");
});

// ================== NAVIGATION ==================
function navigateTo(pageId) {
    document.querySelectorAll(".page").forEach(page => {
        page.classList.remove("active");
    });

    const page = document.getElementById("page-" + pageId);
    if (page) page.classList.add("active");

    // active nav link
    document.querySelectorAll(".nav-link").forEach(link => {
        link.classList.remove("active");
    });

    const activeLink = document.querySelector(`[data-page="${pageId}"]`);
    if (activeLink) activeLink.classList.add("active");
}

// ================== MOBILE MENU ==================
const hamburger = document.getElementById("hamburger");
const mobileMenu = document.getElementById("mobileMenu");

if (hamburger) {
    hamburger.addEventListener("click", () => {
        mobileMenu.classList.toggle("active");
    });
}

function closeMobileMenu() {
    mobileMenu.classList.remove("active");
}

// ================== THEME TOGGLE ==================
const themeToggle = document.getElementById("themeToggle");

if (themeToggle) {
    themeToggle.addEventListener("click", () => {
        const html = document.documentElement;
        const current = html.getAttribute("data-theme");

        html.setAttribute("data-theme", current === "dark" ? "light" : "dark");
    });
}

// ================== PASSWORD TOGGLE ==================
function togglePass(inputId, el) {
    const input = document.getElementById(inputId);

    if (input.type === "password") {
        input.type = "text";
        el.textContent = "🙈";
    } else {
        input.type = "password";
        el.textContent = "👁";
    }
}

// ================== ADMIN LOGIN ==================
function adminLogin() {
    const username = document.getElementById("admin-username").value;
    const password = document.getElementById("admin-password").value;

    if (username === "bhumika" && password === "bhumi@123") {
        navigateTo("admin-dashboard");
    } else {
        const err = document.getElementById("admin-error");
        err.style.display = "block";
        err.innerText = "Invalid username or password!";
    }
}

// ================== TEACHER LOGIN ==================
function teacherLogin() {
    const email = document.getElementById("teacher-email").value;
    const password = document.getElementById("teacher-password").value;

    if (email === "sachin@gmail.com" && password === "sc") {
        navigateTo("faculty-dashboard");
    } else {
        const err = document.getElementById("teacher-error");
        err.style.display = "block";
        err.innerText = "Invalid email or password!";
    }
}

// ================== REGISTER TEACHER ==================
function registerTeacher() {
    const name = document.getElementById("reg-name").value;

    const msg = document.getElementById("reg-success");
    msg.style.display = "block";
    msg.innerText = "Registration submitted! Waiting for admin approval.";
}

// ================== ADMIN SECTION SWITCH ==================
function adminSection(sectionId) {
    document.querySelectorAll(".dash-section").forEach(sec => {
        sec.classList.remove("active");
    });

    const sec = document.getElementById("section-" + sectionId);
    if (sec) sec.classList.add("active");

    document.querySelectorAll(".sb-link").forEach(link => {
        link.classList.remove("active");
    });

    const active = document.querySelector(`[data-section="${sectionId}"]`);
    if (active) active.classList.add("active");
}

// ================== FACULTY SECTION ==================
function facSection(sectionId) {
    document.querySelectorAll(".fac-section").forEach(sec => {
        sec.classList.remove("active");
    });

    const sec = document.getElementById("fsec-" + sectionId);
    if (sec) sec.classList.add("active");
}

// ================== LOGOUT ==================
function logout() {
    navigateTo("landing");
}

// ================== ADD TIMETABLE SLOT ==================
function addTimetableSlot() {
    const msg = document.getElementById("tt-add-msg");
    msg.style.display = "block";
    msg.innerText = "Time slot added successfully!";
}

// ================== LOAD SUBJECTS (DUMMY) ==================
function loadSubjectsForDept() {
    console.log("Subjects loaded for selected department");
}

// ================== STUDENT TIMETABLE ==================
function renderStudentTT() {
    const container = document.getElementById("full-tt-wrap");

    container.innerHTML = `
        <table border="1" style="width:100%;text-align:center;">
            <tr>
                <th>Day</th>
                <th>10:15</th>
                <th>11:10</th>
            </tr>
            <tr>
                <td>Monday</td>
                <td>DBMS</td>
                <td>TOC</td>
            </tr>
        </table>
    `;
}

// ================== WINDOW PRINT FIX ==================
window.onbeforeprint = () => {
    console.log("Printing timetable...");
};