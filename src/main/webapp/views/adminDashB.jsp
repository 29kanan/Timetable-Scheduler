<%@page import="com.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<%@ page import="java.sql.* , com.util.*" %>

<%
    int teacherCount = 0;
    int subjectCount = 0;
    int pendingTeacherCount = 0;
    int deptCount = 0;

    try {
       
        Connection con = DBConnection.getConnection();

        Statement st = con.createStatement();

        ResultSet rs;

        rs = st.executeQuery("SELECT COUNT(*) FROM login_teacher");
        if (rs.next()) teacherCount = rs.getInt(1);

        rs = st.executeQuery("SELECT COUNT(*) FROM subjects");
        if (rs.next()) subjectCount = rs.getInt(1);

        rs = st.executeQuery("SELECT COUNT(*) FROM regteacher");
        if (rs.next()) pendingTeacherCount = rs.getInt(1);

        rs = st.executeQuery("SELECT COUNT(*) FROM departments");
        if (rs.next()) deptCount = rs.getInt(1);

        con.close();

    } catch (Exception e) {
        out.println(e);
    }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title> Admin Dashboard | TTS </title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

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
  background-image: url("${pageContext.request.contextPath}/assets/img/timetableimg.png"); 
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style2.css" />
  </head>
  <body>
  
    <% 
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
        response.setHeader("Pragma","no-cache");//http 1.0
    	response.setHeader("Expires","0");// proxies
    	
     if(session.getAttribute("username")==null){
    	 
    	 response.sendRedirect("admin_login.jsp");
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
                   
                  <a href="${pageContext.request.contextPath}/views/add_class.jsp">
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
              
              <li class="nav-item" style="text-decoration: row; display:flex;">
                   
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
              <h3 class="fw-bold mb-3">Welcome ${username} !</h3>
            <!--  <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="${pageContext.request.contextPath}/views/adminDashB.jsp">
                    <i class="icon-home"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/views/add_Teacher.jsp">add teacher</a>
                </li>
                  <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">Datatables</a>
                </li>   
              </ul>-->
            </div>
           

              <!--  <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="d-flex align-items-center">
                      <h4 class="card-title">TEACHERS</h4>
                      <button
                        class="btn btn-primary btn-round ms-auto"
                        
                        title="Registered Faculty list"
                        onclick="window.location.href='${pageContext.request.contextPath}/views/registeredFaculty.jsp'"
                      >
                        <!--  <i class="fa fa-plus"></i>
                        See Added Faculty
                      </button>
                    </div>
                  </div>
                  -->
<div class="row">

  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body text-center">
        <div style="font-size:30px;">👨‍🏫</div>
        <h3><%= teacherCount %></h3>
        <p>Teachers</p>
      </div>
    </div>
    </div>

  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body text-center">
        <div style="font-size:30px;">📚</div>
        <h3><%= subjectCount %></h3>
        <p>Subjects</p>
      </div>
    </div>
  </div>

  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body text-center">
        <div style="font-size:30px;">⏳</div>
        <h3><%= pendingTeacherCount %></h3>
        <p> Pending Teachers </p>
      </div>
    </div>
  </div>

  <div class="col-md-3">
    <div class="card shadow-sm">
      <div class="card-body text-center">
        <div style="font-size:30px;">🏛️</div>
        <h3><%= deptCount %></h3>
        <p>Departments</p>
      </div>
    </div>
  </div>



<br>

<div class="row">

  <div class="col-md-6">
    <div class="card">
      <div class="card-header d-flex justify-content-between">
        <h4>Faculty Members</h4>
        <a href="${pageContext.request.contextPath}/views/allTeacher.jsp">View All →</a>
      </div>
      <div class="card-body">
        
        <%
    try {

        Connection facultyCon = DBConnection.getConnection();

        Statement facultySt =
            facultyCon.createStatement();

        ResultSet facultyRs =
            facultySt.executeQuery(
                "SELECT * FROM login_teacher LIMIT 5"
            );

        while(facultyRs.next()) {

            String name =
                facultyRs.getString("username");
          
            String department =
                facultyRs.getString("dept");

            String initials =
                name.substring(0,1).toUpperCase();
%>

    <div class="faculty-card">

        <div class="faculty-left">

            <div class="faculty-avatar">
                <%= initials %>
            </div>

            <div class="faculty-info">

                <div class="faculty-name">
                    <%= name %>
                </div>
                
                <div class="faculty-dept">
                    <%= department %>
                </div>

            </div>

        </div>

       

    </div>

<%
        }

        facultyCon.close();

    } catch(Exception e) {
        out.println(e);
    }
%>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="card">
      <div class="card-header d-flex justify-content-between">
        <h4>This Week — Timetable</h4>
        <a href="#">Full View →</a>
      </div>
      <div class="card-body">
        Timetable preview here
      </div>
    </div>
  </div>

</div>
<div class="row">

  <div class="col-md-6">
    <div class="card">
      <div class="card-header d-flex justify-content-between">
        <h4>Subject List</h4>
        <a href="${pageContext.request.contextPath}/views/allSubject.jsp">View All →</a>
      </div>
      <div class="card-body">
        <%
    try {

        Connection subjectCon = DBConnection.getConnection();

        Statement subjectSt =
            subjectCon.createStatement();

        ResultSet subjectRs =
            subjectSt.executeQuery(
                "SELECT * FROM subjects LIMIT 5"
            );

        while(subjectRs.next()) {

            String sname =
                subjectRs.getString("sub_name");
          
            String scode =
                subjectRs.getString("sub_code");

            String initials =
                sname.substring(0,1).toUpperCase();
%>

    <div class="faculty-card">

        <div class="faculty-left">

            <div class="faculty-avatar">
                <%= initials %>
            </div>

            <div class="faculty-info">

                <div class="faculty-name">
                    <%= sname %>
                </div>
                
                <div class="faculty-dept">
                    <%= scode %>
                </div>

            </div>

        </div>


    </div>

<%
        }

        subjectCon.close();

    } catch(Exception e) {
        out.println(e);
    }
%>
      </div>
    </div>
  </div>

  <div class="col-md-6">
    <div class="card">
      <div class="card-header d-flex justify-content-between">
        <h4>Department List</h4>
        <a href="${pageContext.request.contextPath}/views/allDepartment.jsp">Full View →</a>
      </div>
      <div class="card-body">
                <%
    try {

        Connection deptCon = DBConnection.getConnection();

        Statement DeptSt =
            deptCon.createStatement();

        ResultSet deptRs =
            DeptSt.executeQuery(
                "SELECT * FROM departments LIMIT 5"
            );

        while(deptRs.next()) {

            int dId =
                deptRs.getInt("dept_id");
          
            String dName =
                deptRs.getString("dept_name");

            String initials =
                dName.substring(0,1).toUpperCase();
%>

    <div class="faculty-card">

        <div class="faculty-left">

            <div class="faculty-avatar">
                <%= initials %>
            </div>

            <div class="faculty-info">

                <div class="faculty-name">
                    <%= dId %>
                </div>
                
                <div class="faculty-dept">
                    <%= dName %>
                </div>

            </div>

        </div>


    </div>

<%
        }

        deptCon.close();

    } catch(Exception e) {
        out.println(e);
    }
%>
      </div>
    </div>
  </div>

</div>


<br>

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
