
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="com.util.DBConnection"%>
    
<%@page import="java.util.*" %>
<%@page import="com.dao.*" %>
<%@page import="com.model.*" %>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <title>Send Notifications | TTS </title>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
   
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 

    <link href=
"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
          rel="stylesheet">
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
  </head>
  <body>
    
    
    <% 
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
        response.setHeader("Pragma","no-cache");//http 1.0
    	response.setHeader("Expires","0");// proxies
    	
     if(session.getAttribute("username")==null){
    	 
    	 //response.sendRedirect("admin_login.jsp");
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
                   
                  <a 
                  class="nav-link"
                  href="${pageContext.request.contextPath}/views/add_room.jsp">
                  <i class="bi bi-door-open"></i><p>Add Room</p></a>

              </li>
              
                <li class="nav-item" style="text-decoration: row; display:flex;">
                   
                  <a href="${pageContext.request.contextPath}/views/Notification.jsp">
                  <i class="bi bi-calendar4"></i><p>Send Notifications</p></a>

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
        
        
        <div class="d-flex align-items-center ms-auto">
    <i class="fa fa-envelope"></i>
    <a href="Notification.jsp" class="nav-link me-3" >
        
    </a>

    <a href="logout.jsp" class="btn btn-primary btn-sm">
        Logout
    </a>

</div>
            </div>
          </nav>
          
          
  
          
          <!-- End Navbar -->
        </div>

     <div class="container">
          <div class="page-inner">
            <div class="page-header">
              <h3 class="fw-bold mb-3">Send Notifications...</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="${pageContext.request.contextPath}/views/adminDashB.jsp">
                    <i class="icon-home"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/views/add_room.jsp">send notifications</a>
                </li>
               <!--   <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="#">Datatables</a>
                </li>   -->
              </ul>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="card-title">Send Notifications</div>
                  </div>
                 
                      <!--   <label class="mt-3 mb-3"
                          ><b>Form Floating Label</b></label>
                          --> 
                <form action="${pageContext.request.contextPath}/NotificationServlet" method="post"> 
                         
                       
                         <div class="form-group">
                          <label for="largeInput">Title</label>
                          <input
                            type="text"
                            class="form-control form-control-lg"
                            id="largeInput"
                            name="title"
                            placeholder="Enter Title...."
                            required="required"
                          />
                        </div>
                        
                        <div class="form-group">
                          <label for="largeInput">Message</label>
                          <textarea
                            class="form-control form-control-lg"
                            id="largeInput"
                            name="message"
                            placeholder="Enter Message...."
                            required="required"
                          ></textarea>
                        </div>
                        
                        <div class="form-group">
                          <label for="defaultSelect">Send to</label>
                          <select
                           name="targetRole"
                            required="required"
                            class="form-select form-control"
                            id="defaultSelect"
                          >
                            <option value="ALL">
                                      All
                                 </option>

                         <option value="FACULTY">
                           Faculty
                          </option>

                       <option value="STUDENT">
                         Student
                       </option>
                       
                      </select>
                      </div>
                        
                        <p style="align:center">
                        <button 
                        type="submit"
                        class="btn btn-secondary btn-round ms-auto"
                         >
                          <i class="fa fa-plus"></i>
                        Send
                      </button>
                      </p>
                   </form>
                       
                      
                      <div class="container">
          <div class="page-inner">
           
               <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <div class="d-flex align-items-center">
                      <h4 class="card-title">List of Notifications</h4>
                  <!--    <button
                        class="btn btn-primary btn-round ms-auto"
                        
                        title="click here to edit department data"
                        onclick="window.location.href='${pageContext.request.contextPath}/views/edit_dept.jsp'"
                      >
                        <!--  <i class="fa fa-plus"></i>
                        Edit Dept Data
                      </button> --> 
                    </div>
                  </div>
                  
                  
                  <div class="card-body">
                   
                    <div class="table-responsive">
                      <table
                        id="add-row"
                        class="display table table-striped table-hover"
                      >
                      <thead>
                          <tr>
                            <th>Title</th>
                            <th>Message</th>
                            <th>Send To</th>
                            <th>Time&Date</th>
                             <th style="width: 10%">Action</th>
                           
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                           <th>Title</th>
                            <th>Message</th>
                            <th>Send To</th>
                            <th>Time&Date</th>
                             <th>Action</th>
                           
                          </tr>
                        </tfoot>
                        <tbody>
                        <%
                        List<Notification> list1 = DAOFactory.getNotificationDao().getAllNotification();

                          
                        try {
                            for(Notification n: list1){
                            	%>
                            
                         
                          <tr>
                         
                            <td><%=n.getTitle()%></td>
                            <td><%=n.getMessage()%></td>
                            <td><%=n.getTargetRole()%></td>
                            <td><%=n.getCreatedAt()%></td>

                            <td>
                            
              
                              <div class="form-button-action">
                                
       <form action="${pageContext.request.contextPath}/NotificationServlet" method="get" id="deleteForm_<%=n.getId()%>">
            <input type="hidden" name="msg_id" value="<%=n.getId()%>">
            <input type="hidden" name="action" value="delete">
        </form>
        
              
              
                                <button
                                  type="button"
                                  data-bs-toggle="tooltip"
                                  title="Delete Notification"
                                  class="btn btn-link btn-danger"
                                  data-original-title="delete"
                                 onclick="if(confirm('Are you sure to delete this notification?')) {
                document.getElementById('deleteForm_<%=n.getId()%>').submit();}"
                                >
                                  <i class="fa fa-times"></i>
                                </button>
                              
                              </div>
                            </td>
                          </tr>
                         
                          
                        <%
                            }
                          
                        } catch(Exception e) {
                            out.println(e);
                        }
                    %>

                          
                        </tbody>
                      </table>
                      
                      <%
    String msg = (String)request.getAttribute("send");
    if(msg != null){
%>
<script>alert("<%=msg%>");</script>
<%
    }
    String msg2 = (String)request.getAttribute("error");
    if(msg2 != null){
%>
<script>alert("<%=msg2%>");</script>
<%
    }
    String msg3 = (String)request.getAttribute("delmsg");
    if(msg3 != null){
%>
<script>alert("<%=msg3%>");</script>
<%
    }
%>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
              
        
            </div>
          </div>
         
            
        </div>
                           
          </div>
         
                      
                   <!--     <div class="form-floating form-floating-custom mb-3">
                          <select
                            class="form-select"
                            id="selectFloatingLabel"
                            required
                          >
                            <option selected>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                          </select>
                         <label for="selectFloatingLabel"><h2 style="color:#86b7fe">Select</h2></label>
                        </div>
                         --> 
                     <!--  
                  <div class="card-action">
                    <button class="btn btn-success">Submit</button>
                    <button class="btn btn-danger">Cancel</button>
                  </div>
                  -->   
               
        

        <footer class="footer">
          <div class="container-fluid d-flex justify-content-between">
            <nav class="pull-left">
              <ul class="nav">
                <li class="nav-item">
                  <a class="nav-link" href="http://www.themekita.com">
                    ThemeKita
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Help </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#"> Licenses </a>
                </li>
              </ul>
            </nav>
            <div class="copyright">
              2024, made with <i class="fa fa-heart heart text-danger"></i> by
              <a href="http://www.themekita.com">ThemeKita</a>
            </div>
            <div>
              Distributed by
              <a target="_blank" href="https://themewagon.com/">ThemeWagon</a>.
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



