<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.util.DBConnection"%>
<%@ page import="com.util.*"%>
<%@ page import="com.dao.*"%>
<%@ page import="com.model.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <title>View Timetable</title>
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
      display: flex; gap: 14px; margin-bottom: 0;
      font-size: 13px; align-items: center;
    }
    .tt-legend-badge {
      padding: 3px 12px; border-radius: 20px;
      font-size: 12px; font-weight: 600;
    }
    .legend-theory, .tt-badge-theory { background: #e3f2fd; color: #0d52b3; border: 1px solid #90caf9; }
    .legend-lab,    .tt-badge-lab    { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }
  </style>
</head>
<body>
<%
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
  response.setHeader("Pragma", "no-cache");
  response.setHeader("Expires", "0");
  if (session.getAttribute("username") == null) {
    response.sendRedirect("teacher_login.jsp");
  }

  // Fetch notifications once for the topbar bell
  List<Notification> notifications = DAOFactory.getNotificationDao().getNotificationsByRole("FACULTY");
  Integer lastSeenId = (Integer) session.getAttribute("facultyLastSeenNotification");
  if (lastSeenId == null) lastSeenId = 0;
  int newNotificationCount = 0;
  for (Notification n : notifications) {
    if (n.getId() > lastSeenId) newNotificationCount++;
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
            <a class="nav-link" href="${pageContext.request.contextPath}/views/facultyDashB.jsp">
              <i class="fas fa-home"></i><p>Dashboard</p>
            </a>
          </li>
          <li class="nav-section"><span class="sidebar-mini-icon"><i class="fa fa-ellipsis-h"></i></span></li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/viewFac_subject.jsp">
              <i class="bi bi-book"></i><p>Subject list</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/viewFac_class.jsp">
              <i class="bi bi-door-open"></i><p>Classes list</p>
            </a>
          </li>
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath}/views/viewFac_timetable.jsp">
              <i class="bi bi-calendar4"></i><p>View TimeTable</p>
            </a>
          </li>
          <li class="nav-item">
            <form action="${pageContext.request.contextPath}/facultyLogout" id="logoutForm">
              <input type="hidden" name="logout" value="true">
            </form>
            <a class="nav-link" href="#" onclick="document.getElementById('logoutForm').submit();">
              <i class="bi bi-box-arrow-right"></i><p>Logout</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <!-- End Sidebar -->

  <div class="main-panel">
    <div class="main-header">
      <div class="main-header-logo">
        <div class="logo-header" data-background-color="dark">
          <a href="index.html" class="logo"></a>
          <div class="nav-toggle">
            <button class="btn btn-toggle toggle-sidebar"><i class="gg-menu-right"></i></button>
            <button class="btn btn-toggle sidenav-toggler"><i class="gg-menu-left"></i></button>
          </div>
          <button class="topbar-toggler more"><i class="gg-more-vertical-alt"></i></button>
        </div>
      </div>

      <nav class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom">
        <div class="container-fluid">
          <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">

            <!-- Mobile search toggle -->
            <li class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none">
              <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#"
                 role="button" aria-expanded="false" aria-haspopup="true">
                <i class="fa fa-search"></i>
              </a>
              <ul class="dropdown-menu dropdown-search animated fadeIn">
                <form class="navbar-left navbar-form nav-search">
                  <div class="input-group">
                    <input type="text" placeholder="Search ..." class="form-control" />
                  </div>
                </form>
              </ul>
            </li>

            <!-- Messages Dropdown -->
            <li class="nav-item topbar-icon dropdown hidden-caret">
              <a class="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button"
                 data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-envelope"></i>
              </a>
              <ul class="dropdown-menu messages-notif-box animated fadeIn" aria-labelledby="messageDropdown">
                <li>
                  <div class="dropdown-title d-flex justify-content-between align-items-center">
                    Messages
                    <a href="#" class="small">Mark all as read</a>
                  </div>
                </li>
                <li>
                  <div class="message-notif-scroll scrollbar-outer">
                    <div class="notif-center">
                      <a href="#">
                        <div class="notif-img">
                          <img src="assets/img/jm_denis.jpg" alt="Img Profile" />
                        </div>
                        <div class="notif-content">
                          <span class="subject">Jimmy Denis</span>
                          <span class="block">How are you?</span>
                          <span class="time">5 minutes ago</span>
                        </div>
                      </a>
                      <a href="#">
                        <div class="notif-img">
                          <img src="assets/img/chadengle.jpg" alt="Img Profile" />
                        </div>
                        <div class="notif-content">
                          <span class="subject">Chad</span>
                          <span class="block">Ok, Thanks!</span>
                          <span class="time">12 minutes ago</span>
                        </div>
                      </a>
                      <a href="#">
                        <div class="notif-img">
                          <img src="assets/img/mlane.jpg" alt="Img Profile" />
                        </div>
                        <div class="notif-content">
                          <span class="subject">Jhon Doe</span>
                          <span class="block">Ready for the meeting today...</span>
                          <span class="time">12 minutes ago</span>
                        </div>
                      </a>
                      <a href="#">
                        <div class="notif-img">
                          <img src="assets/img/talha.jpg" alt="Img Profile" />
                        </div>
                        <div class="notif-content">
                          <span class="subject">Talha</span>
                          <span class="block">Hi, Apa Kabar?</span>
                          <span class="time">17 minutes ago</span>
                        </div>
                      </a>
                    </div>
                  </div>
                </li>
                <li>
                  <a class="see-all" href="javascript:void(0);">
                    See all messages <i class="fa fa-angle-right"></i>
                  </a>
                </li>
              </ul>
            </li>

            <!-- Notification Bell (JSP-powered) -->
            <li class="nav-item topbar-icon dropdown hidden-caret">
              <a class="nav-link dropdown-toggle" href="#" id="notifDropdown" role="button"
                 data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fa fa-bell"></i>
                <% if (newNotificationCount > 0) { %>
                  <span class="notification"><%= newNotificationCount %></span>
                <% } %>
              </a>
              <ul class="dropdown-menu notif-box animated fadeIn" aria-labelledby="notifDropdown">
                <li>
                  <div class="dropdown-title">
                    You have <%= notifications.size() %> new notification<%= notifications.size() != 1 ? "s" : "" %>
                  </div>
                </li>
                <li>
                  <div class="notif-scroll scrollbar-outer">
                    <div class="notif-center">
                      <% if (notifications.isEmpty()) { %>
                        <div class="text-center p-3 text-muted">No Notifications Available</div>
                      <% } else { for (Notification n : notifications) { %>
                        <a href="#">
                          <div class="notif-icon notif-primary"><i class="fa fa-bell"></i></div>
                          <div class="notif-content">
                            <span class="block"><%= n.getTitle() %></span>
                            <span class="block text-muted" style="font-size:12px;"><%= n.getMessage() %></span>
                            <span class="time"><%= n.getCreatedAt() %></span>
                          </div>
                        </a>
                      <% } } %>
                    </div>
                  </div>
                </li>
                <li>
                  <a class="see-all" href="${pageContext.request.contextPath}/views/Fac_notification.jsp">
                    See all notifications <i class="fa fa-angle-right"></i>
                  </a>
                </li>
              </ul>
            </li>

            <!-- Profile Dropdown -->
            <li class="nav-item topbar-user dropdown hidden-caret">
              <a class="dropdown-toggle profile-pic" data-bs-toggle="dropdown" href="#" aria-expanded="false">
                <div class="avatar-sm">
                  <img src="${pageContext.request.contextPath}/assets/img/admin-icon.svg"
                       alt="..." class="avatar-img rounded-circle" />
                </div>
                <span class="profile-username">
                  <span class="op-7">Hi,</span>
                  <span class="fw-bold">${username}</span>
                </span>
              </a>
              <ul class="dropdown-menu dropdown-user animated fadeIn">
                <div class="dropdown-user-scroll scrollbar-outer">
                  <li>
                    <div class="user-box">
                      <div class="avatar-lg">
                        <img src="${pageContext.request.contextPath}/assets/img/admin-icon.svg"
                             alt="image profile" class="avatar-img rounded" />
                      </div>
                      <div class="u-text">
                        <h4>${username}</h4>
                        <p class="text-muted">${email}</p>
                        <form action="${pageContext.request.contextPath}/ProfileServlet" id="pForm">
                          <input type="hidden" name="id" value="<%=session.getAttribute("fid")%>">
                        </form>
                        <a href="#" class="btn btn-xs btn-secondary btn-sm"
                           onclick="document.getElementById('pForm').submit();">View Profile</a>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">My Profile</a>
                    <a class="dropdown-item" href="#">My Balance</a>
                    <a class="dropdown-item" href="#">Inbox</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Account Setting</a>
                    <div class="dropdown-divider"></div>
                    <form action="${pageContext.request.contextPath}/facultyLogout" id="logoutFormNav">
                      <input type="hidden" name="logout" value="true">
                    </form>
                    <a class="dropdown-item" href="#"
                       onclick="document.getElementById('logoutFormNav').submit();">Logout</a>
                  </li>
                </div>
              </ul>
            </li>

          </ul>
        </div>
      </nav>
    </div>
    <!-- End Navbar -->

    <div class="container">
      <div class="page-inner">
        <div class="page-header">
          <h3 class="fw-bold mb-3">View Timetable</h3>
          <ul class="breadcrumbs mb-3">
            <li class="nav-home">
              <a href="${pageContext.request.contextPath}/views/facultyDashB.jsp"><i class="icon-home"></i></a>
            </li>
            <li class="separator"><i class="icon-arrow-right"></i></li>
            <li class="nav-item"><a href="#">View Timetable</a></li>
          </ul>
        </div>

        <div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
                <h4 class="card-title mb-0">Timetable</h4>
                <div class="d-flex align-items-center gap-3 flex-wrap">
                  <input type="text" id="ttSearch" class="form-control form-control-sm" style="width:200px;"
                         placeholder="Search class or subject..." oninput="filterTimetable()" />
                  <div class="tt-legend">
                    <span class="tt-legend-badge legend-theory">Theory</span>
                    <span class="tt-legend-badge legend-lab">Lab</span>
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

                  Map<String, Map<String, Map<String, String>>> classMap = new LinkedHashMap<>();
                  while (rs.next()) {
                    String className   = rs.getString("class_name");
                    String day         = rs.getString("day");
                    String startTime   = rs.getString("slot_start_time");
                    String endTime     = rs.getString("slot_end_time");
                    String timeSlot    = startTime + " - " + endTime;
                    String lectureName = rs.getString("lecture_name");

                    classMap.computeIfAbsent(className, k -> new LinkedHashMap<>())
                            .computeIfAbsent(day, k -> new LinkedHashMap<>())
                            .put(timeSlot, lectureName);
                  }
                  con.close();

                  String[] dayOrder = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                  String[] dayShort = {"Mon",    "Tue",     "Wed",       "Thu",      "Fri",    "Sat"};

                  if (classMap.isEmpty()) {
                %>
                  <div class="text-center p-5 my-4 bg-light border rounded-3 shadow-sm">
                    <i class="bi bi-calendar-x text-danger mb-3" style="font-size: 3rem; display: block;"></i>
                    <h5 class="fw-bold text-dark">Schedule Status: Incomplete</h5>
                    <p class="text-muted mb-0">No timetable slots have been configured yet.</p>
                  </div>
                <%
                  } else {
                    for (Map.Entry<String, Map<String, Map<String, String>>> classEntry : classMap.entrySet()) {
                      String className = classEntry.getKey();
                      Map<String, Map<String, String>> dayMap = classEntry.getValue();

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
                          <% } } %>
                        </tr>
                        <% } } %>
                      </tbody>
                    </table>
                  </div>
                </div>
                <%
                    } // end classEntry loop
                  } // end else
                } catch (Exception e) {
                  out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
                %>

                <%
                String msg  = (String) request.getAttribute("editmsg3");
                if (msg  != null) { %><script>alert("<%=msg%>");</script><% }
                String msg2 = (String) request.getAttribute("addT");
                if (msg2 != null) { %><script>alert("<%=msg2%>");</script><% }
                String msg3 = (String) request.getAttribute("delmsg2");
                if (msg3 != null) { %><script>alert("<%=msg3%>");</script><% }
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
      section.querySelectorAll('tbody tr').forEach(r => r.style.display = '');
      return;
    }

    const classTitle = section.querySelector('.tt-class-title').textContent.toLowerCase();
    let sectionVisible = classTitle.includes(query);

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
