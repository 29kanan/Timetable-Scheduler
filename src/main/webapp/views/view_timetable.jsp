<%@page import="com.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">

  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title> View Timetable | TTS </title>
  <meta content="width=device-width, initial-scale=1.0, shrink-to-fit=no" name="viewport" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
  <link rel="icon" href="${pageContext.request.contextPath}/assets/img/kaiadmin/favicon.ico" type="image/x-icon" />
  <script src="${pageContext.request.contextPath}/assets/js/plugin/webfont/webfont.min.js"></script>
  <script>
    WebFont.load({
      google: { families: ["Public Sans:300,400,500,600,700"] },
      custom: {
        families: ["Font Awesome 5 Solid", "Font Awesome 5 Regular", "Font Awesome 5 Brands", "simple-line-icons"],
        urls: ["${pageContext.request.contextPath}/assets/css/fonts.min.css"],
      },
      active: function () { sessionStorage.fonts = true; },
    });
  </script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/kaiadmin.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />
  <style>
    .tt-class-section { margin-bottom: 36px; }
    .tt-class-title {
      background: #0d52b3;
      color: white;
      padding: 12px 18px;
      border-radius: 8px 8px 0 0;
      font-size: 15px;
      font-weight: 700;
    }
    .tt-grid-table {
      width: 100%;
      border-collapse: collapse;
      font-size: 13px;
      border-radius: 0 0 8px 8px;
      overflow: hidden;
      box-shadow: 0 2px 8px rgba(13,82,179,0.08);
    }
    .tt-grid-table thead tr { background: #1a63c4; }
    .tt-grid-table th {
      padding: 10px 12px;
      text-align: center;
      font-weight: 600;
      font-size: 12px;
      color: #fff;
      border: 1px solid #1557b0;
      white-space: nowrap;
    }
    .tt-grid-table td {
      padding: 10px 8px;
      text-align: center;
      border: 1px solid #dce6f7;
      background: #fff;
      font-size: 13px;
      color: #222;
    }
    .tt-grid-table td.day-col {
      background: #0d52b3;
      color: #fff;
      font-weight: 600;
      min-width: 70px;
      white-space: nowrap;
    }
    .tt-grid-table td.lab-cell {
      background: #e8f5e9;
      color: #1b5e20;
      font-weight: 500;
    }
    .tt-grid-table td.theory-cell {
      background: #e3f2fd;
      color: #0d3b8a;
    }
    .tt-grid-table td.empty-cell {
      background: #f8fafc;
      color: #ccc;
    }
    .tt-legend {
      display: flex; gap: 14px; margin-bottom: 16px;
      font-size: 13px; align-items: center;
    }
    .tt-legend-badge {
      padding: 3px 12px; border-radius: 20px;
      font-size: 12px; font-weight: 600;
    }
    .legend-theory, .tt-badge-theory { background: #e3f2fd; color: #0d52b3; border: 1px solid #90caf9; }
    .legend-lab, .tt-badge-lab { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }
  </style>
</head>
<body>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma","no-cache");
  response.setHeader("Expires","0");
  if(session.getAttribute("username")==null){
    response.sendRedirect("admin_login.jsp");
  }
%>


<div class="wrapper">
  <!-- Sidebar -->
  <div class="sidebar" data-background-color="dark">
    <div class="sidebar-logo">
      <div class="logo-header" data-background-color="dark">
        <a href="index.html" class="logo"></a>
        <div class="nav-toggle">
          <button class="btn btn-toggle toggle-sidebar"><i class="gg-menu-right"></i></button>
          <button class="btn btn-toggle sidenav-toggler"><i class="gg-menu-left"></i></button>
        </div>
        
        <button class="topbar-toggler more"><i class="gg-more-vertical-alt"></i></button>
      </div>
    </div>
    <div class="sidebar-wrapper scrollbar scrollbar-inner">
      <div class="sidebar-content">
        <ul class="nav nav-secondary">
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/adminDashB.jsp">
              <i class="fas fa-home"></i><p>Dashboard</p>
            </a>
          </li>
          <li class="nav-section"><span class="sidebar-mini-icon"><i class="fa fa-ellipsis-h"></i></span></li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/add_Teacher.jsp">
              <i class="bi bi-person-plus"></i><p>Add Teacher</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/add_subject.jsp">
              <i class="bi bi-book"></i><p>Add Subject</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/add_dept.jsp">
              <i class="bi bi-building-add"></i><p>Add Department</p>
            </a>
          </li>
          <li class="nav-item" style="text-decoration: row; display:flex;">
                   
            <a class="nav-link" href="${pageContext.request.contextPath}/views/add_class.jsp">
              <i class="bi bi-calendar4"></i><p>Add Classes</p>
            </a>

          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/add_room.jsp">
              <i class="bi bi-door-open"></i><p>Add Room</p>
            </a>
          </li>
          <li class="nav-item" style="text-decoration: row; display:flex;">
                   
              <a 
              class="nav-link"
              href="${pageContext.request.contextPath}/views/Notification.jsp">
              <i class="bi bi-door-open"></i><p>Send Notification</p></a>

          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/create_timetable.jsp">
              <i class="bi bi-calendar-plus"></i><p>Create TimeTable</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/view_timetable.jsp">
              <i class="bi bi-calendar4"></i><p>View TimeTable</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>

  <div class="main-panel">
    <div class="main-header">
      <div class="main-header-logo">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">
              <a href="index.html" class="logo">
                <img
                  src="assets/img/kaiadmin/logo_light.svg"
                  alt="navbar brand"
                  class="navbar-brand"
                  height="20"
                />
              </a>
              <div class="nav-toggle">
                <button class="btn btn-toggle toggle-sidebar">
                  <i class="gg-menu-right"></i>
                </button>
                <button class="btn btn-toggle sidenav-toggler">
                  <i class="gg-menu-left"></i>
                </button>
              </div>
              <button class="topbar-toggler more">
                <i class="gg-more-vertical-alt"></i>
              </button>
            </div>
            <!-- End Logo Header -->
          </div>

     <!-- Navbar Header -->
          <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
            <div class="container-fluid">
              <nav
                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
              >
              <ul class="navbar-nav topbar-nav align-items-center" style="margin-left:0 ;">

                <!-- Admin User -->
             <li class="nav-item topbar-user dropdown hidden-caret d-flex align-items-center">

        <!-- Admin Image -->
        <div class="avatar-sm">
            <img
                src="${pageContext.request.contextPath}/assets/img/admin-icon.jpg"
                alt="Admin"
                class="avatar-img rounded-circle"
            />
        </div>

        <!-- Username -->
        <span class="profile-username ms-2 me-3">
            <span class="fw-bold">${username}</span>
        </span>
    </li>

</ul>
              </nav>
        
        
          
        <a href="Notification.jsp" class="nav-link me-3" title="Send Notifications" >
        <div class="d-flex align-items-center ms-auto">
    <i class="fa fa-envelope" ></i>
    </a>

     <form action="${pageContext.request.contextPath}/adminLogout" id="logoutForm">
                        <input type="hidden" name="logout" value="true">
                        </form>
    <a href="#" class="btn btn-primary btn-sm" onclick="document.getElementById('logoutForm').submit();"><i class="bi bi-box-arrow-right"></i>  Logout</a>
   

</div>
            </div>
          </nav>
          
          
  
          
          <!-- End Navbar -->
    </div>

    <div class="container">
      <div class="page-inner">
        <div class="page-header">
          <h3 class="fw-bold mb-3">View Timetables...</h3>
          <ul class="breadcrumbs mb-3">
            <li class="nav-home">
              <a href="${pageContext.request.contextPath}/views/adminDashB.jsp"><i class="icon-home"></i></a>
            </li>
            <li class="separator"><i class="icon-arrow-right"></i></li>
            <li class="nav-item"><a href="#">view timetable</a></li>
          </ul>

        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
                <h4 class="card-title mb-0">TimeTable</h4>
                <div class="d-flex align-items-center gap-3 flex-wrap">
                  <input type="text" id="ttSearch" class="form-control form-control-sm" style="width:200px;" placeholder="Search class or subject..." oninput="filterTimetable()" />
                  <div class="tt-legend mb-0">
                    <span class="tt-legend-badge tt-badge-theory">Theory</span>
                    <span class="tt-legend-badge tt-badge-lab">Lab</span>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <%
                try {
                  Connection con = DBConnection.getConnection();
                  Statement st = con.createStatement();
                  ResultSet rs = st.executeQuery(
                		  "SELECT t.*, c.class_name FROM final_timetable t " +
                          "JOIN classes_name c ON t.class_id = c.class_id " +
                          "ORDER BY c.class_name, t.day, t.slot_start_time"
                  );

                  // Group data: class -> day -> list of slots
                  Map<String, Map<String, Map<String, String>>> classMap = new LinkedHashMap<>();
                  while (rs.next()) {
                    String className = rs.getString("class_name");
                    String day = rs.getString("day");
                    String startTime = rs.getString("slot_start_time");
                    String endTime = rs.getString("slot_end_time");
                    String timeSlot = startTime + " - " + endTime;
                    String lectureName = rs.getString("lecture_name");

                    classMap.computeIfAbsent(className, k -> new LinkedHashMap<>())
                            .computeIfAbsent(day, k -> new LinkedHashMap<>())
                            .put(timeSlot, lectureName);
                  }
                  con.close();

                  String[] dayOrder = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                  String[] dayShort = {"Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};

                  // Safety check: if there is no schedule data available
                  if (classMap == null || classMap.isEmpty()) {
                %>
                    <div class="text-center p-5 my-4 bg-light border rounded-3 shadow-sm">
                      <i class="bi bi-calendar-x text-danger mb-3" style="font-size: 3rem; display: block;"></i>
                      <h5 class="fw-bold text-dark">Schedule Status: Incomplete</h5>
                      <p class="text-muted mb-0">
                        No timetable slots have been configured yet. Use the setup form above or click 
                        <strong class="text-primary"><i class="bi bi-cpu-fill"></i> Generate Automatic Timetable</strong> to build the schedule.
                      </p>
                    </div>
                <%
                  } else {
                    // Loop through your classes if data exists
                    for (Map.Entry<String, Map<String, Map<String, String>>> classEntry : classMap.entrySet()) {
                      String className = classEntry.getKey();
                      Map<String, Map<String, String>> dayMap = classEntry.getValue();

                      // Collect all unique time slots across all days, sorted
                      Set<String> timeSlotSet = new TreeSet<>();
                      for (Map<String, String> slots : dayMap.values()) {
                        timeSlotSet.addAll(slots.keySet());
                      }
                      List<String> timeSlots = new ArrayList<>(timeSlotSet);
                %>
                <div class="tt-class-section">
                  <div class="tt-class-title"><i class="bi bi-mortarboard me-2"></i><%= className %></div>
                    <div class="table-responsive">
                    <table class="tt-grid-table">
                      <thead>
                        <tr>
                          <th>Day</th>
                          <% for (String ts : timeSlots) { %>
                            <th><%= ts %></th>
                          <% } %>
                        </tr>
                      </thead>
                      <tbody>
                        <% for (int di = 0; di < dayOrder.length; di++) {
                          String day = dayOrder[di];
                          Map<String, String> slots = dayMap.get(day);
                          if (slots != null) { %>
                        <tr>
                          <td class="day-col"><%= dayShort[di] %></td>
                          <% for (String ts : timeSlots) {
                            String lectureName = slots.get(ts);
                            if (lectureName != null) {
                              boolean isLab = lectureName.toLowerCase().contains("lab") ||
                                             lectureName.toLowerCase().contains("workshop") ||
                                             lectureName.toLowerCase().contains("project") ||
                                             lectureName.toLowerCase().contains("internship");
                              String cellClass = isLab ? "lab-cell" : "theory-cell";
                          %>
                            <td class="<%= cellClass %>"><%= lectureName %></td>
                          <% } else { %>
                            <td class="empty-cell">—</td>
                          <% } 
                           } %>
                        </tr>
                        <% }
                         } %>
                      </tbody>
                    </table>
                  </div>
                </div>
                <%
                    } // End of classEntry loop
                  } // End of else block
                } catch(Exception e) {
                  out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
                %>

                <%
                String msg = (String)request.getAttribute("editmsg3");
                if(msg != null){ %><script>alert("<%=msg%>");</script><% }
                String msg2 = (String)request.getAttribute("addT");
                if(msg2 != null){ %><script>alert("<%=msg2%>");</script><% }
                String msg3 = (String)request.getAttribute("delmsg2");
                if(msg3 != null){ %><script>alert("<%=msg3%>");</script><% }
                %>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>

    <footer class="footer">
      <div class="container-fluid d-flex justify-content-between">
        <div class="text-muted">© 2026 <strong>SDITS</strong></div>
        <div class="footer-icons">
          <a href="https://www.sdits.org" target="_blank" class="me-3 text-dark"><i class="fa-solid fa-globe fa-lg"></i></a>
          <a href="https://www.linkedin.com" target="_blank" class="me-3 text-primary"><i class="fa-brands fa-linkedin fa-lg"></i></a>
          <a href="https://www.instagram.com" target="_blank" class="text-danger"><i class="fa-brands fa-instagram fa-lg"></i></a>
        </div>
        <div class="text-muted">Time Table Scheduler</div>
      </div>
    </footer>
  </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/core/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/kaiadmin.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/setting-demo2.js"></script>
<script>
function filterTimetable() {
    const query = document.getElementById('ttSearch').value.toLowerCase().trim();

    document.querySelectorAll('.tt-class-section').forEach(section => {
        if (!query) {
            section.style.display = 'block';
            section.querySelectorAll('tr').forEach(r => r.style.display = '');
            return;
        }

        const classTitle = section.querySelector('.tt-class-title').textContent.toLowerCase();
        let sectionVisible = classTitle.includes(query);

        // Also check individual cell content
        section.querySelectorAll('tbody tr').forEach(row => {
            const rowText = row.textContent.toLowerCase();
            if (rowText.includes(query) || classTitle.includes(query)) {
                row.style.display = '';
                sectionVisible = true;
            } else {
                row.style.display = 'none';
            }
        });

        section.style.display = sectionVisible ? 'block' : 'none';
    });
}
</script>
</body>
</html>
