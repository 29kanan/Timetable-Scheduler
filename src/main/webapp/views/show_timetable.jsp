<%@page import="com.util.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>jay shree ganeshay namh</title>
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

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/demo.css" />
  </head>
  <body>
    
    <%--
         response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
        response.setHeader("Pragma","no-cache");//http 1.0
    	response.setHeader("Expires","0");// proxies
    	
     if(session.getAttribute("username")==null){
    	 
    	 response.sendRedirect("teacher_login.jsp");
     }
  
  
    --%>
    
  
      
      <!-- End Sidebar -->

     <div class="container">
          <div class="page-inner">
            <div class="page-header">
              <h3 class="fw-bold mb-3">View Timetables...</h3>
              <ul class="breadcrumbs mb-3">
                <li class="nav-home">
                  <a href="${pageContext.request.contextPath}/views/studentDashB.jsp">
                    <i class="icon-home"></i>
                  </a>
                </li>
                <li class="separator">
                  <i class="icon-arrow-right"></i>
                </li>
                <li class="nav-item">
                  <a href="${pageContext.request.contextPath}/views/studentDashB.jsp">back</a>
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
                  
                      <div class="container">
          <div class="page-inner">
           
           
                         <div class="col-md-12">
                <div class="card">
                <%
                String sem=request.getParameter("sem");
        
                %>
                  <div class="card-header">
                    <h4 class="card-title">TimeTable of <%=sem%> </h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                      <table
                        id="multi-filter-select"
                        class="display table table-striped table-hover"
                      >
                        <thead>
                          <tr>
                      
                            <th>Day</th>
                            <th>Time Slot</th>
                            <th>Subject</th>
                            <th>Teacher</th>
                            <th>Room</th>
                          </tr>
                        </thead>
                        <tfoot>
                          <tr>
                           
                            <th>Day</th>
                            <th>Time Slot</th>
                            <th>Subject</th>
                            <th>Teacher</th>
                            <th>Room</th>
                          </tr>
                        </tfoot>
                        <tbody>
          
                                  <%
                                  int d_id=Integer.parseInt(request.getParameter("dept_id"));
                                  
                                  String year=request.getParameter("year");
                                  try {
                                	  
                           Connection con = DBConnection.getConnection();

                                Statement st = con.createStatement();
                               ResultSet rs = st.executeQuery("SELECT * FROM time_table where dept_id="+d_id+" and sem='"+sem+"' and year= '"+year+"';");

                                 while(rs.next()) {
                        
                                	 String s_abbr=rs.getString("sub_abbr");
                                	 int f_id=rs.getInt("fac_id");
                                	 int r_id=rs.getInt("room_id");

        	                   %>
        	                   
                          <tr>
                              
                            <td><%=rs.getString("day")%></td>
                            <td><%=rs.getString("time_slot")%></td>
                               
                               <% 
                                 PreparedStatement ps2 = con.prepareStatement("SELECT * FROM subjects where sub_abbr='"+s_abbr+"' and dept_id="+d_id+";");
                  ResultSet rs2 = ps2.executeQuery();

                 while(rs2.next()) {
        	                   %>
                         
                              <td><%=rs2.getString("sub_name")%> - <%=rs2.getString("subject_type")%></td>
                            <%  } 
                 
                 PreparedStatement ps3 = con.prepareStatement("SELECT * FROM login_teacher where fac_id="+f_id+";");
                  ResultSet rs3 = ps3.executeQuery();

                 while(rs3.next()) {
        	                   %>
                         
                              <td><%=rs3.getString("username")%></td>
                            <%} %>

                      
                      
                            <% PreparedStatement ps4 = con.prepareStatement("SELECT * FROM rooms where room_id="+r_id+";");
                  ResultSet rs4 = ps4.executeQuery();

                 while(rs4.next()) {
        	                   %>
        	                   <td><%=rs4.getString("room_num")%>&nbsp;<%=rs4.getString("room_name")%> </td>
        	                   <%} %>
                          </tr>
                         
                          
                        <%
                         }
                                 con.close();
                                  } catch(Exception e) {
                                      out.println(e);
                                  }
                        %>
                        </tbody>
                      </table>
                      
                                            
                      <%
    String msg = (String)request.getAttribute("editmsg3");
    if(msg != null){
%>
<script>alert("<%=msg%>");</script>
<%
    }
    String msg2 = (String)request.getAttribute("addT");
    if(msg2 != null){
%>
<script>alert("<%=msg2%>");</script>
<%
    }
    String msg3 = (String)request.getAttribute("delmsg2");
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
                
                <p style="align:center">
                        <button 
                        onclick="window.location.href='${pageContext.request.contextPath}/views/time_table.jsp'"
                        class="btn btn-secondary btn-round ms-auto"
                         >
                          Print
                        
                      </button>
                      </p>
                
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

      <!-- Custom template | don't include it in your project! 
    <  <div class="custom-template">
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
      </div>-->
      <!-- End Custom template -->
   
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
