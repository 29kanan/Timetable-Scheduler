<%@page import="com.dao.DAOFactory"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="com.model.*, com.dao.*"%>
<%@ page import="java.sql.* , com.util.*" %>
<%
int fid =
(Integer)session.getAttribute("fid");

List<Timetable> list =
DAOFactory.getTimetableDao()
          .getTodaySchedule(fid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Schedule List | TTS </title>

<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">
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
  
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style3.css" />

</head>

<body>

<div class="container mt-5">

    <div class="d-flex
                justify-content-between
                align-items-center
                mb-4">

        <h2 class="page-title">
            Today Schdule List
        </h2>

        
        <a href="${pageContext.request.contextPath}/FacultyDashboard"
           class="btn btn-primary back-btn btn-round ms-auto">

           Back to Dashboard

        </a>
    </div>

    <div class="table-container">
       <p align="right">
        <a href="${pageContext.request.contextPath}/views/viewFac_class.jsp"
           class="btn btn-primary back-btn btn-round ms-auto">

           Filter

        </a></p>
        <table class="table table-hover align-middle">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Sem</th>
                    <th>Day</th>
                    <th>Time_slot</th>
                    <th>sub_abbr</th>
                    <th>fac_name</th>
                    <th>room_no</th>
                    <th>dept_name</th>
                    <th>year</th>
                </tr>

            </thead>

            <tbody>

            <tbody>

<%
try {

    for(Timetable rs : list){

        Department d =
        DAOFactory.getDepartmentDao()
                  .getDepartmentById(
                      rs.getDept_id());

        Faculty f =
        DAOFactory.getFacultyDao()
                  .getFacultyById(
                      rs.getFac_id());
%>

<tr>

    <td><%=rs.getTt_id()%></td>

    <td><%=rs.getSem()%></td>

    <td><%=rs.getDay()%></td>

    <td><%=rs.getTime_slot()%></td>

    <td><%=rs.getSub_abbr()%></td>

    <td><%=f.getUsername()%></td>

    <td><%=rs.getRoom_id()%></td>

    <td><%=d.getDept_name()%></td>

    <td><%=rs.getYear()%></td>

</tr>

<%
    }

} catch(Exception e){

    out.println(e);
}
%>

            </tbody>

        </table>

    </div>

</div>

</body>
</html>