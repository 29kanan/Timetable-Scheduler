<%@page import="com.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title> add department </title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
   
    
    <link
      rel="icon"
      href="${pageContext.request.contextPath}/assets/img/kaiadmin/favicon.ico"
      type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="${pageContext.request.contextPath}/assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["${pageContext.request.contextPath}/assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/plugins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />
    <style>
	    /* Card per day timetable layout elements */
	    .tt-class-section { margin-bottom: 36px; display: block !important; }
	    .tt-class-title {
	      background: rgba(13, 82, 179, 0.08);
	      color: #0d52b3;
	      padding: 12px 18px;
	      border-radius: 8px;
	      font-size: 15px;
	      font-weight: 700;
	      margin-bottom: 12px;
	      border-left: 4px solid #0d52b3;
	    }
	    .tt-day-card {
	      border: 1px solid #e8eef7;
	      border-radius: 10px;
	      margin-bottom: 10px;
	      overflow: hidden;
	      box-shadow: 0 1px 4px rgba(13,82,179,0.06);
	      display: block !important;
	    }
	    .tt-day-header {
	      background: #0d52b3;
	      color: white;
	      padding: 9px 16px;
	      font-size: 13px;
	      font-weight: 600;
	      letter-spacing: 0.3px;
	    }
	    .tt-slot-row {
		  display: flex;
		  align-items: center;
		  padding: 12px 16px;
		  border: 1px solid #e8eef7;
		  border-radius: 8px;
		  margin-bottom: 8px;
		  gap: 12px;
		  font-size: 13px;
		  background: #fff;
		  box-shadow: 0 1px 3px rgba(13,82,179,0.04);
		}
		.tt-slot-row.lab-row { 
		  background: #f6fff7; 
		  border-color: #a5d6a7;
		}
		.tt-slot-row:hover { 
		  background: #f0f5ff; 
		  transition: background 0.15s; 
		}
		.tt-time { color: #888; font-size: 12px; min-width: 140px; font-weight: 500; }
		.tt-subject { flex: 1; color: #1a1a2e; font-weight: 600; font-size: 14px; }
		.tt-badge { padding: 3px 12px; border-radius: 20px; font-size: 11px; font-weight: 600; text-align: center; min-width: 70px; }
		.tt-badge-theory { background: #e3f2fd; color: #0d52b3; border: 1px solid #90caf9; }
		.tt-badge-lab { background: #e8f5e9; color: #2e7d32; border: 1px solid #a5d6a7; }
		.tt-teacher { color: #666; font-size: 12px; min-width: 150px; }
		.tt-actions { display: flex; gap: 8px; border-left: 1px solid #e8eef7; padding-left: 10px; margin-left: 4px; }
		.tt-actions .btn-link { background: none; border: none; padding: 0; cursor: pointer; }
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
	  
	  boolean isFinalized = false;
	  try {
	    Connection conStatus = DBConnection.getConnection();
	    ResultSet rs0 = conStatus.createStatement()
	        .executeQuery("SELECT is_finalized FROM timetable_status WHERE id = 1");
	    if (rs0.next()) isFinalized = rs0.getBoolean("is_finalized");
	    conStatus.close(); // its own separate connection, safe to close
	  } catch (Exception e) {
	    e.printStackTrace();
	  }
	%>
    
    
    
    <div class="wrapper">
      <!-- Sidebar -->
      <div class="sidebar" data-background-color="dark">
        <div class="sidebar-logo">
          <!-- Logo Header -->
          <div class="logo-header" data-background-color="dark">
            <a href="index.html" class="logo">
             <!--  <img
                src="${pageContext.request.contextPath}/assets/img/kaiadmin/logo_light.svg"
                alt="navbar brand"
                class="navbar-brand"
                height="20"
              /> -->
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
        <div class="sidebar-wrapper scrollbar scrollbar-inner">
          <div class="sidebar-content">
             <ul class="nav nav-secondary">
              <li class="nav-item">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/adminDashB.jsp">
                  <i class="fas fa-home"></i>
                  <p>Dashboard</p>
                </a>
              </li>
       
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_Teacher.jsp">
                  <i class="bi bi-person-plus"></i><p>Add Teacher</p></a>

              </li>
              
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_subject.jsp">
                  <i class="bi bi-book"></i><p>Add Subject</p></a>
                </a>

              </li>
                
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_dept.jsp">
                  <i class="bi bi-building-add"></i><p>Add Department</p></a>
                </a>

              </li>
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a class="nav-link" href="${pageContext.request.contextPath}/views/add_class.jsp">
                  <i class="bi bi-calendar4"></i><p>Add Classes</p></a>

              </li>
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_room.jsp">
                  <i class="bi bi-door-open"></i><p>Add Room</p></a>

              </li>
               <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/Notification.jsp">
                  <i class="bi bi-door-open"></i><p>Send Notification</p></a>

              </li>
              
              <li class="nav-item active" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/create_timetable.jsp">
                  <i class="bi bi-calendar-plus"></i><p>Create TimeTable</p></a>

              </li>
             <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a href="${pageContext.request.contextPath}/views/view_timetable.jsp">
                  <i class="bi bi-calendar4"></i><p>View TimeTable</p></a>

              </li>
              
             <!--   <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a href="Login.jsp"><i class="bi bi-box-arrow-in-left"></i><p>Login</p></a>

              </li>-->
              
              
            </ul>
          </div>
        </div>
      </div>
      
      <!-- End Sidebar -->

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
          <nav
            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
          >
            <div class="container-fluid">
              <nav
                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
              >
                <div class="input-group">
                  <div class="input-group-prepend">
                    <button type="submit" class="btn btn-search pe-1">
                      <i class="fa fa-search search-icon"></i>
                    </button>
                  </div>
                  <input
                    type="text"
                    placeholder="Search ..."
                    class="form-control"
                  />
                </div>
              </nav>

              <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                <li
                  class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                >
                  <a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown"
                    href="#"
                    role="button"
                    aria-expanded="false"
                    aria-haspopup="true"
                  >
                    <i class="fa fa-search"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-search animated fadeIn">
                    <form class="navbar-left navbar-form nav-search">
                      <div class="input-group">
                        <input
                          type="text"
                          placeholder="Search ..."
                          class="form-control"
                        />
                      </div>
                    </form>
                  </ul>
                </li>
                <li class="nav-item topbar-icon dropdown hidden-caret">
                  <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    id="messageDropdown"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="fa fa-envelope"></i>
                  </a>
                  <ul
                    class="dropdown-menu messages-notif-box animated fadeIn"
                    aria-labelledby="messageDropdown"
                  >
                    <li>
                      <div
                        class="dropdown-title d-flex justify-content-between align-items-center"
                      >
                        Messages
                        <a href="#" class="small">Mark all as read</a>
                      </div>
                    </li>
                    <li>
                      <div class="message-notif-scroll scrollbar-outer">
                        <div class="notif-center">
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/jm_denis.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Jimmy Denis</span>
                              <span class="block"> How are you ? </span>
                              <span class="time">5 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/chadengle.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Chad</span>
                              <span class="block"> Ok, Thanks ! </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/mlane.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Jhon Doe</span>
                              <span class="block">
                                Ready for the meeting today...
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/talha.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Talha</span>
                              <span class="block"> Hi, Apa Kabar ? </span>
                              <span class="time">17 minutes ago</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </li>
                    <li>
                      <a class="see-all" href="javascript:void(0);"
                        >See all messages<i class="fa fa-angle-right"></i>
                      </a>
                    </li>
                  </ul>
                </li>
                <li class="nav-item topbar-icon dropdown hidden-caret">
                  <a
                    class="nav-link dropdown-toggle"
                    href="#"
                    id="notifDropdown"
                    role="button"
                    data-bs-toggle="dropdown"
                    aria-haspopup="true"
                    aria-expanded="false"
                  >
                    <i class="fa fa-bell"></i>
                    <span class="notification">4</span>
                  </a>
                  <ul
                    class="dropdown-menu notif-box animated fadeIn"
                    aria-labelledby="notifDropdown"
                  >
                    <li>
                      <div class="dropdown-title">
                        You have 4 new notification
                      </div>
                    </li>
                    <li>
                      <div class="notif-scroll scrollbar-outer">
                        <div class="notif-center">
                          <a href="#">
                            <div class="notif-icon notif-primary">
                              <i class="fa fa-user-plus"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block"> New user registered </span>
                              <span class="time">5 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-icon notif-success">
                              <i class="fa fa-comment"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block">
                                Rahmad commented on Admin
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="assets/img/profile2.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="block">
                                Reza send messages to you
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-icon notif-danger">
                              <i class="fa fa-heart"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block"> Farrah liked Admin </span>
                              <span class="time">17 minutes ago</span>
                            </div>
                          </a>
                        </div>
                      </div>
                    </li>
                    <li>
                      <a class="see-all" href="javascript:void(0);"
                        >See all notifications<i class="fa fa-angle-right"></i>
                      </a>
                    </li>
                  </ul>
                </li>
                

                <li class="nav-item topbar-user dropdown hidden-caret">
                  <a
                    class="dropdown-toggle profile-pic"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                    <div class="avatar-sm">
                      <img
                        src="${pageContext.request.contextPath}/assets/img/admin-icon.svg"
                        alt="..."
                        class="avatar-img rounded-circle"
                      />
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
                            <img
                              src="${pageContext.request.contextPath}/assets/img/admin-icon.svg"
                              alt="image profile"
                              class="avatar-img rounded"
                            />
                          </div>
                          <div class="u-text">
                            <h4>${username}</h4>
                            <p class="text-muted">${email}</p>
                            <a
                              href="profile.html"
                              class="btn btn-xs btn-secondary btn-sm"
                              >View Profile</a
                            >
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
                        <form action="${pageContext.request.contextPath}/adminLogout" id="logoutForm">
                        <input type="hidden" name="logout" value="true">
                        </form>
                        <a class="dropdown-item" href="#" onclick="document.getElementById('logoutForm').submit();">
                        Logout
                        </a>
                      </li>
                    </div>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          
          
  
          
          <!-- End Navbar -->
        </div>

     <div class="container">
          <div class="page-inner">
            <div class="d-flex justify-content-between align-items-center mb-4">
			    <!-- Left Side: Title & Breadcrumbs -->
			    <div class="page-header">
			        <h3 class="fw-bold mb-1">Create Timetable...</h3>
			        <ul class="breadcrumbs mb-0 list-unstyled d-flex align-items-center">
			            <li class="nav-home">
			                <a href="#"><i class="bi bi-house-door-fill"></i></a>
			            </li>
			            <li class="separator mx-2"><i class="bi bi-chevron-right"></i></li>
			            <li class="nav-item">
			                <a href="#" class="text-muted text-decoration-none">create timetable</a>
			            </li>
			        </ul>
			    </div>
			
			    <!-- Right Side: Action Button -->
			    <div>
			        <a href="${pageContext.request.contextPath}/views/GenerateTimetable.jsp" class="btn btn-primary d-flex align-items-center gap-2 shadow-sm">
			            <i class="bi bi-cpu-fill"></i> Generate Automatic Timetable
			        </a>
			    </div>
			</div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">Add Timetable's Slot</div>
                  </div>
                 
                      <!--   <label class="mt-3 mb-3"
                          ><b>Form Floating Label</b></label>
                          --> 
                   <form action="${pageContext.request.contextPath}/AddTimetableServlet" method="post">
                         
                         
                         <div class="form-group">
                          <label for="defaultSelect">Department</label>
                          <select
                          name="dept_id"
                            required="required"
                            class="form-select form-control"
                            id="defaultSelect"
                          >
                            <%
                            
                            Connection con1 = DBConnection.getConnection();
    try {

         PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM departments");
        ResultSet rs1 = ps1.executeQuery();

        while(rs1.next()) {
%>
        <option value="<%= rs1.getInt("dept_id") %>">
                <%= rs1.getString("dept_name") %>
        </option>

<%
        }
       
    } catch(Exception e) {
        out.println(e);
    }
%>

                          </select>
                          </div>
                         
                         
                         
                          <div class="form-group">
                          <label for="defaultSelect">Semester</label>
                          <select
                            class="form-select form-control"
                            id="defaultSelect"
                             name="sem"
                            required="required"
                              
                          >
                            <option value="1 sem">1 sem</option>
                            <option value="2 sem">2 sem</option>
                            <option value="3 sem">3 sem</option>
                            <option value="4 sem">4 sem</option>
                            <option value="5 sem">5 sem</option>
                            <option value="6 sem">6 sem</option>
                            <option value="7 sem">7 sem</option>
                            <option value="8 sem">8 sem</option>
                          </select>
                        </div>
                        
                        
                        
                         <div class="form-group">
                          <label for="defaultSelect">Day</label>
                          <select
                            class="form-select form-control"
                            id="defaultSelect"
                             name="day"
                            required="required"
                              
                          >
                            <option value="Monday">Monday</option>
                            <option value="Tuesday">Tuesday</option>
                            <option value="Wednesday">Wednesday</option>
                            <option value="Thursday">Thursday</option>
                            <option value="Friday">Friday</option>
                            <option value="Saturday">Saturday</option>
                          </select>
                        </div>
                        
                        
                        
                        
                         <div class="form-group">
                          <label for="defaultSelect">Time Slot</label>
                          <select
                            class="form-select form-control"
                            id="defaultSelect"
                             name="time_slot"
                            required="required"
                              
                          >
                            <option value="10:15-11:10">10:15-11:10</option>
                            <option value="11:10-12:05">11:10-12:05</option>
                            <option value="12:40-01:35">12:40-01:35</option>
                            <option value="01:35-02:30">01:35-02:30</option>
                            <option value="02:40-03:35">02:40-03:35</option>
                            <option value="03:35-04:30">03:35-04:30</option>
                          </select>
                        </div>
                        
                        
                        <div class="form-group">
                  
               <%
    try {

         PreparedStatement ps2 = con1.prepareStatement("SELECT * FROM subjects");
        ResultSet rs2 = ps2.executeQuery();
        %> 
        <label for="defaultSelect">Subject</label>
        <select
        name="sub_abbr"
          required="required"
          class="form-select form-control"
          id="defaultSelect"
        >
        <option value=""></option>
        <%
        while(rs2.next()) {
%>         

        <option value="<%=rs2.getString("sub_abbr") %>">
         
                <%= rs2.getString("sub_name")%> - <%=rs2.getString("subject_type") %> &nbsp; &nbsp;/&nbsp;
<%
                            
                         
    try {

         PreparedStatement ps1 = con1.prepareStatement("SELECT * FROM departments where dept_id="+ rs2.getString("dept_id") +";");
        ResultSet rs1 = ps1.executeQuery();

        while(rs1.next()) {

        	%><%= rs1.getString("dept_name") %> 
               
<%
        }
       
    } catch(Exception e) {
        out.println(e);
    }
%>
                  </option>
               
                 <%
                 
        }
        
    } catch(Exception e) {
        out.println(e);
    }
%> 
</select>
 </div>
        

                          <div class="form-group">
                          <label for="defaultSelect">Room</label>
                          <select
                          name="room_id"
                            required="required"
                            class="form-select form-control"
                            id="defaultSelect"
                          >
                            <option value=""></option>
                     
                            <%
    try {

         PreparedStatement ps3 = con1.prepareStatement("SELECT * FROM rooms");
        ResultSet rs3 = ps3.executeQuery();

        while(rs3.next()) {
%>
        <option value="<%= rs3.getInt("room_id") %>">
                <%= rs3.getString("room_num") %>&nbsp;<%= rs3.getString("room_name") %>
        </option>

<%
        }
%>

                          </select>
                          </div>
                           <div class="form-group">
                          <label for="largeInput">Year</label>
                          <input
                            type="text"
                            name="year"
                            required="required"
                            class="form-control form-control"
                            id="defaultInput"
                            placeholder="Enter year (e.g. 20yy-yy)"
                          />
                        </div>
                   
                        
                        <p style="align:center">
                        <button 
                        type="submit"
                        class="btn btn-secondary btn-round ms-auto"
                         >
                          <i class="fa fa-plus"></i>
                        Add Time Slot
                      </button>
                      </p>
                   </form>
                       
            <%
        
        con1.close();
    } catch(Exception e) {
        out.println(e);
    }
%>          

		<div class="row">
          <div class="col-md-12">
            <div class="card">
              <div class="card-header d-flex justify-content-between align-items-center">
                <h4 class="card-title">TimeTable</h4>
                <div class="tt-legend">
                  <span class="tt-legend-badge tt-badge-theory">Theory</span>
                  <span class="tt-legend-badge tt-badge-lab">Lab</span>
                </div>
              </div>
              <div class="card-body">
              	
                <%
                try {
                  Connection conn = DBConnection.getConnection();
                  Statement st = conn.createStatement();
                  ResultSet rs = st.executeQuery(
                		  "SELECT tt.*, d.dept_name, s.subject_type, lt.username as teacher_name " +
                	      "FROM time_table tt " +
                	      "LEFT JOIN departments d ON tt.dept_id = d.dept_id " +
                          "LEFT JOIN (" +
        	              "SELECT DISTINCT sub_abbr, dept_id, subject_type FROM subjects" +
                	      ") s ON s.sub_abbr = tt.sub_abbr AND s.dept_id = tt.dept_id " +
                          "LEFT JOIN login_teacher lt ON lt.fac_id = tt.fac_id " +
                	      "ORDER BY tt.dept_id, tt.sem, tt.day, tt.time_slot"
                  );

                  Map<String, Map<String, List<String[]>>> classMap = new LinkedHashMap<>();
                  while (rs.next()) {
                	  String sem = rs.getString("sem");
                      String deptName = rs.getString("dept_name");
                      
                      String classKey = "Timetable Schedule Setup";
                      if (deptName != null && deptName.trim().length() >= 2) {
                          classKey = deptName.trim().substring(0, 2).toUpperCase() + " - " + (sem != null ? sem : "");
                      } else if (sem != null) {
                          classKey = "Class - " + sem;
                      }
                      
                      String day = rs.getString("day") != null ? rs.getString("day") : "Monday";
                      String timeSlot = rs.getString("time_slot") != null ? rs.getString("time_slot") : "Time Slot Unassigned";
                      String subAbbr = rs.getString("sub_abbr") != null ? rs.getString("sub_abbr") : "No Subject Specified";
                      String subType = rs.getString("subject_type") != null ? rs.getString("subject_type") : "Theory";
                      String teacherName = rs.getString("teacher_name") != null ? rs.getString("teacher_name") : "Not Assigned";
                      String ttId = String.valueOf(rs.getInt("tt_id"));

                      classMap.computeIfAbsent(classKey, k -> new LinkedHashMap<>())
                            .computeIfAbsent(day, k -> new ArrayList<>())
                            .add(new String[]{timeSlot, subAbbr, subType, teacherName, ttId});
                  }
                  conn.close(); // Cleaned variable reference to match con1
                  
                  String[] dayOrder = {"Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"};
                %>

                <div class="table-responsive">
                  <table id="multi-filter-select" class="display table" style="width:100%;">
                    <thead>
                      <tr>
                        <th>Class Details</th>
                        <th>Day</th>
                        <th>Time Slot</th>
                        <th>Subject</th>
                        <th>Type</th>
                        <th>Teacher</th>
                        <th>Actions</th>
                      </tr>
                    </thead>
                    <tfoot>
                      <tr>
                        <th>Class Details</th>
                        <th>Day</th>
                        <th>Time Slot</th>
                        <th>Subject</th>
                        <th>Type</th>
                        <th>Teacher</th>
                        <th>Actions</th>
                      </tr>
                    </tfoot>
                    <tbody>
                    <%
                    // YOUR EXACT NESTED LOOPS START HERE - UNTOUCHED
                    for (Map.Entry<String, Map<String, List<String[]>>> classEntry : classMap.entrySet()) {
                        String className = classEntry.getKey();
                        Map<String, List<String[]>> dayMap = classEntry.getValue();
                        
                        for (String day : dayOrder) {
                            List<String[]> slots = dayMap.get(day);
                            if (slots != null && !slots.isEmpty()) { 
                                for (String[] slot : slots) {
                                  String subType = slot[2] != null ? slot[2].toLowerCase() : "";
                                  boolean isLab = subType.contains("lab") || subType.contains("practical");
                                  String rowClass = isLab ? "lab-row" : "";
                                  String badgeClass = isLab ? "tt-badge-lab" : "tt-badge-theory";
                                  String badgeText = isLab ? "Lab" : "Theory";
                                  String ttId = slot[4];
                                %>
                                  <tr class="<%= rowClass %>">
                                    <td class="fw-bold text-primary"><i class="bi bi-mortarboard me-2"></i><%= className %></td>
                                    <td><span class="badge bg-dark text-white"><%= day %></span></td>
                                    <td class="tt-time"><i class="far fa-clock me-1"></i><%= slot[0] != null ? slot[0] : "-" %></td>
                                    <td class="tt-subject"><%= slot[1] != null ? slot[1] : "-" %></td>
                                    <td><span class="tt-badge <%= badgeClass %>"><%= badgeText %></span></td>
                                    <td class="tt-teacher"><i class="bi bi-person me-1"></i><%= slot[3] != null ? slot[3] : "-" %></td>
                                    <td>
                                      <div class="tt-actions">
                                        <form action="${pageContext.request.contextPath}/views/edit_timetable.jsp" method="post" id="editTForm_<%= ttId %>" class="m-0 d-inline">
                                          <input type="hidden" name="tt_id" value="<%= ttId %>">
                                          <button type="button" class="btn btn-link text-primary p-1" data-bs-toggle="tooltip" title="Edit" onclick="document.getElementById('editTForm_<%= ttId %>').submit();">
                                            <i class="fa fa-edit"></i>
                                          </button>
                                        </form>
                
                                        <form action="${pageContext.request.contextPath}/DeleteTimetableServlet" method="get" id="deleteTForm_<%= ttId %>" class="m-0 d-inline">
                                          <input type="hidden" name="tt_id" value="<%= ttId %>">
                                          <button type="button" class="btn btn-link text-danger p-1" data-bs-toggle="tooltip" title="Remove" onclick="document.getElementById('deleteTForm_<%= ttId %>').submit();">
                                            <i class="fa fa-times"></i>
                                          </button>
                                        </form>
                                      </div>
                                    </td>
                                  </tr>
                                <% 
                                } 
                            } 
                        } 
                    }
                    %>
                    </tbody>
                  </table>
                </div>
                <%
                } catch(Exception e) {
                  out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                }
                %>

                <%-- Global Action Buttons --%>
                <% if (request.getAttribute("message") != null) { %>
				    <div class="alert alert-<%= request.getAttribute("messageType") %> alert-dismissible fade show text-center mx-auto my-3" role="alert" style="max-width: 600px;">
				        <i class="fa <%= "success".equals(request.getAttribute("messageType")) ? "fa-check-circle" : "fa-exclamation-triangle" %> me-2"></i>
				        <%= request.getAttribute("message") %>
				        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				    </div>
				<% } %>
                <form method="GET" action="#">
				    <div class="d-flex justify-content-center gap-3 my-4">
				        
				        <% if (isFinalized) { %>
						  <a href="${pageContext.request.contextPath}/views/view_timetable.jsp" class="btn btn-primary">
						    <i class="bi bi-check-circle-fill"></i> Finalized. View Timetable &#8594;
						  </a>
						<% } else { %>
						  <a href="${pageContext.request.contextPath}/views/set_room.jsp" 
						     class="btn btn-success" id="finalizeBtn">
						    <i class="bi bi-check-lg"></i> Finalize
						  </a>
						  <button class="btn btn-danger" id="deleteBtn" onclick="...your existing delete function...">
						    <i class="bi bi-exclamation-circle"></i> Delete All data
						  </button>
						<% } %>
				        
				    </div>
				</form>

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
         

     <footer class="footer">
          <div class="container-fluid d-flex justify-content-between">
          
             <!-- Left: College Name -->
    <div class="text-muted">
      © 2026 <strong>SDITS</strong>
    </div>

    <!-- Center: Social Media Icons -->
    <div class="footer-icons">
      <a href="https://www.sdits.org" target="_blank" class="me-3 text-dark">
        <i class="fa-solid fa-globe fa-lg"></i>
      </a>

      <a href="https://www.linkedin.com" target="_blank" class="me-3 text-primary">
        <i class="fa-brands fa-linkedin fa-lg"></i>
      </a>

      <a href="https://www.instagram.com" target="_blank" class="text-danger">
        <i class="fa-brands fa-instagram fa-lg"></i>
      </a>
    </div>

    <!-- Right: Project Info -->
    <div class="text-muted">
     Time Table Scheduler
    </div>
          </div>
        </footer>
      </div>
 
      <!-- Custom template | don't include it in your project! -->
      <div class="custom-template">
        <div class="title">Settings</div>
        <div class="custom-content">
          <div class="switcher">
            <div class="switch-block">
              <h4>Logo Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="selected changeLogoHeaderColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="selected changeLogoHeaderColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeLogoHeaderColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Navbar Header</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="white"
                ></button>
                <br />
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="dark2"
                ></button>
                <button
                  type="button"
                  class="selected changeTopBarColor"
                  data-color="blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="purple2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="light-blue2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="green2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="orange2"
                ></button>
                <button
                  type="button"
                  class="changeTopBarColor"
                  data-color="red2"
                ></button>
              </div>
            </div>
            <div class="switch-block">
              <h4>Sidebar</h4>
              <div class="btnSwitch">
                <button
                  type="button"
                  class="selected changeSideBarColor"
                  data-color="white"
                ></button>
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="dark"
                ></button>
                <button
                  type="button"
                  class="changeSideBarColor"
                  data-color="dark2"
                ></button>
              </div>
            </div>
          </div>
        </div>
        <div class="custom-toggle">
          <i class="icon-settings"></i>
        </div>
      </div>
      <!-- End Custom template -->
    </div>
    <!--   Core JS Files   -->
    <script src="${pageContext.request.contextPath}/assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="${pageContext.request.contextPath}/assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="${pageContext.request.contextPath}/assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="${pageContext.request.contextPath}/assets/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="${pageContext.request.contextPath}/assets/js/setting-demo2.js"></script>
    <script>
      $(document).ready(function () {
        $("#basic-datatables").DataTable({});

        $("#multi-filter-select").DataTable({
        	  pageLength: 5,
        	  initComplete: function () {
        	    this.api()
        	      .columns()
        	      .every(function () {
        	        var column = this;
        	        var select = $(
        	          '<select class="form-select"><option value=""></option></select>'
        	        )
        	          .appendTo($(column.footer()).empty())
        	          .on("change", function () {
        	            var val = $.fn.dataTable.util.escapeRegex($(this).val());
        	            column.search(val ? "^" + val + "$" : "", true, false).draw();
        	          });

        	        var data = column
        	          .nodes()
        	          .to$()
        	          .map(function() {
        	            return $(this).attr('data-filter') || $(this).text().trim();
        	          })
        	          .toArray();

        	        [...new Set(data)].sort().forEach(function (d) {
        	          select.append('<option value="' + d + '">' + d + "</option>");
        	        });
        	      });
        	  },
        	});

        // Add Row
        $("#add-row").DataTable({
          pageLength: 5,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
          $("#add-row")
            .dataTable()
            .fnAddData([
              $("#addName").val(),
              $("#addPosition").val(),
              $("#addOffice").val(),
              action,
            ]);
          $("#addRowModal").modal("hide");
        });
      });
    </script>
  </body>
</html>
