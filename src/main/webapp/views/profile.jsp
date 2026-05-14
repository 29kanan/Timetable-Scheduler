<%@page import="com.util.DBConnection"%>
<%@page import="com.model.*"  %>
<%@page import="com.dao.*"  %>
<% Faculty f=(Faculty)request.getAttribute("profile"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- At the top of profile.jsp, after other imports --%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>Faculty Profile</title>
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
  <style type="text/css">
    .banner-bg {
  width: 100%;
  height: 1000px;
  border-radius: 10px;
  background-image: url("${pageContext.request.contextPath}/assets/img/'''''.jpg'"); 
  background-size: contain;       
  background-position: center;
  background-repeat: no-repeat;
  color: #6861ce; 
  text-shadow: 1px 1px 2px ;
  
};

/* responsive */
@media (max-width: 768px) {
  .banner-bg { height: 180px; }
}



/*
.banner-bg {
    /* Apni image ka path yahan daalein */
    background-image: url('path/to/your/banner-image.jpg');
    background-size: cover; /* Responsive aur cover ke liye */
    background-position: center;
    min-height: 250px; /* Banner ki height */
    color: white; /* Text color white karein taki image par dikhe */
    /* Agar text image par saaf na dikhe toh yeh line use karein: */
    text-shadow: 2px 2px 4px #000000; 
}
*/
    </style>
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
    <style type="text/css">
        .profile-header {
            background: linear-gradient(135deg, #085cca 0%, #01abf4 100%);
            padding: 30px 20px;
            margin: 0;
            border-radius: 10px 10px 0 0;
            color: white;
            text-align: center;
        }
    </style>
  </head>
  <body>
  
    <% 
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
        response.setHeader("Pragma","no-cache");//http 1.0
    	response.setHeader("Expires","0");// proxies
    	
     if(session.getAttribute("username")==null){
    	 
    	 response.sendRedirect("teacher_login.jsp");
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
              <li class="nav-item active">
                <a
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/facultyDashB.jsp">
                  <i class="fas fa-home"></i>
                  <p>Dashboard</p>
                </a>
              </li>
       
              <li class="nav-section">
                <span class="sidebar-mini-icon">
                  <i class="fa fa-ellipsis-h"></i>
                </span>
              </li>
           <!--     <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_Teacher.jsp">
                  <i class="bi bi-person-plus"></i><p>Add Teacher</p></a>

              </li>-->
              
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/viewFac_subject.jsp">
                  <i class="bi bi-book"></i><p>Subject list</p></a>
                </a>

              </li>
                
             <!--   <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_dept.jsp">
                  <i class="bi bi-building-add"></i><p>Add Department</p></a>
                </a>

              </li>-->
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/viewFac_class.jsp">
                  <i class="bi bi-door-open"></i><p>Classes list</p></a>

              </li>
            <!--    <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/create_timetable.jsp">
                  <i class="bi bi-calendar-plus"></i><p>Create TimeTable</p></a>

              </li>-->
             <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a href="${pageContext.request.contextPath}/views/viewFac_timetable.jsp">
                  <i class="bi bi-calendar4"></i><p>View TimeTable</p></a>

              </li>
              
             <!--   <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a href="Login.jsp"><i class="bi bi-box-arrow-in-left"></i><p>Login</p></a>

              </li>-->
              
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   <form action="${pageContext.request.contextPath}/facultyLogout" id="logoutForm">
                        <input type="hidden" name="logout" value="true">
                        </form>
                  <a href="#" onclick="document.getElementById('logoutForm').submit();"><i class="bi bi-box-arrow-right"></i><p>Logout</p></a>

              </li>
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
                                src="${pageContext.request.contextPath}/assets/img/jm_denis.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Anu</span>
                              <span class="block"> How are you ? </span>
                              <span class="time">5 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="${pageContext.request.contextPath}/assets/img/chadengle.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Bhumi</span>
                              <span class="block"> Ok, Thanks ! </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="${pageContext.request.contextPath}/assets/img/mlane.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">Vanshika</span>
                              <span class="block">
                                Ready for the meeting today...
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="${pageContext.request.contextPath}/assets/img/talha.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="subject">kanak</span>
                              <span class="block"> Hello, Guys ? </span>
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
                                Anu commented on Admin
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-img">
                              <img
                                src="${pageContext.request.contextPath}/assets/img/profile2.jpg"
                                alt="Img Profile"
                              />
                            </div>
                            <div class="notif-content">
                              <span class="block">
                                kanak send messages to you
                              </span>
                              <span class="time">12 minutes ago</span>
                            </div>
                          </a>
                          <a href="#">
                            <div class="notif-icon notif-danger">
                              <i class="fa fa-heart"></i>
                            </div>
                            <div class="notif-content">
                              <span class="block"> Bhumi liked Admin </span>
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
              </ul>
            </div>
          </nav>
          
          
  
          
          <!-- End Navbar -->
        </div>

       <div class="container-fluid mt-4">

            <div class="card">  
         
                
                <div class="profile-header">
                  <br>
                   <div>
                  <br> 
                    <h2 class="text-white mb-0"><%=f.getUsername()%></h2>
                    <p class="text-white mb-0">Teacher | SDITS</p>
                    </div>
                </div>
                
                <div class="card-body">
                    
                    <ul class="nav nav-pills nav-fill mb-4" id="profileTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="details-tab" data-bs-toggle="tab" data-bs-target="#details" type="button" role="tab" aria-controls="details" aria-selected="true">
                                <i class="bi bi-info-circle me-1"></i> Details
                            </button>
                        </li>
                         <li class="nav-item" role="presentation">
                            <button class="nav-link" id="edit-tab" data-bs-toggle="tab" data-bs-target="#edit" type="button" role="tab" aria-controls="edit" aria-selected="false">
                                <i class="bi bi-pencil-square me-1"></i>Edit Profile
                            </button>
                        </li>
                    </ul>

                    <div class="tab-content" id="profileTabContent">
                        
                        <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
                            <h4 class="mb-3">Personal Information</h4>
                            <div class="row mb-2">
                              <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Faculty ID:</div>
                                <div class="col-md-9"><%=f.getFac_id()%></div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Faculty Name:</div>
                                <div class="col-md-9"><%=f.getUsername()%></div>
                                </div>
                                <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Password:</div>
                                <div class="col-md-9"><%=f.getPassword()%></div>
                            </div>
                            <hr>
                            <h4 class="mb-3">Contact Information</h4>
                            <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Email:</div>
                                <div class="col-md-9"><%=f.getEmail()%></div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Phone:</div>
                                <div class="col-md-9"><%=f.getPhone()%></div>
                            </div>
                            <div class="row mb-2">
                                <div class="col-md-3 fw-bold">Department:</div>
                                <div class="col-md-9"><%=f.getDept()%></div>
                            </div>
                        </div>
                        
                         </div>

                        <div class="tab-pane fade" id="edit" role="tabpanel" aria-labelledby="edit-tab">
                               <form action="${pageContext.request.contextPath}/ProfileServlet" method="post">
                             
                                <div class="row mb-3">
                                
                                <div class="col-md-6">
                                        <label for="employeeId" class="form-label">Faculty ID </label>
                                        <input type="text" class="form-control" name="fac_id" value="<%=f.getFac_id()%>" readonly="readonly">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="fullName" class="form-label">Department</label>
                                        <input type="text" class="form-control" name="dept" value="<%=f.getDept()%>" readonly="readonly">
                                    </div><br>
                                    
                                    
                                </div>
                                <div class="row mb-3">
                                
                                <div class="col-md-6">
                                        <label for="fullName" class="form-label">Faculty Name</label>
                                        <input type="text" class="form-control" name="name" value="<%=f.getUsername()%>" required>
                                    </div><br>
                                    <div class="col-md-6">
                                        <label for="fullName" class="form-label">Password</label>
                                        <input type="text" class="form-control" name="pwd" value="<%=f.getPassword()%>" required>
                                    </div>
                                    <div class="col-md-6"><br>
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" name="email" value="<%=f.getEmail()%>" required>
                                    </div>
                                    <div class="col-md-6"><br>
                                        <label for="phone" class="form-label">Phone Number</label>
                                        <input type="tel" class="form-control" name="phone" value="<%=f.getPhone()%>" required>
                                    </div>
                                </div>
                                  
                                
                                <div class="mt-4 text-mid" align="center">
                            
                                    <button type="submit"  class="btn btn-primary">Save Changes</button>
                               
                                </div>
                                     </form>
                                
                        </div>
                       
                   
                </div>
            </div>
          <%
    String msg = (String)request.getAttribute("error");
    if(msg != null){
%>
<script>alert("<%=msg%>");</script>
<%
    }%>
        </div> 
            </div>

        </div>
        
      </div> <!--  main panel div -->

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

                    column
                      .search(val ? "^" + val + "$" : "", true, false)
                      .draw();
                  });

                column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                    select.append(
                      '<option value="' + d + '">' + d + "</option>"
                    );
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
