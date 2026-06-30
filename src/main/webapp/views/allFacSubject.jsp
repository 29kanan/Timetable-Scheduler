<%@page import="com.dao.DAOFactory"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@page import="com.model.*, com.dao.*"%>
<%@ page import="java.sql.* , com.util.*" %>
<%
int fid =
(Integer)session.getAttribute("fid");

List<Subject> list =
DAOFactory.getSubjectDao()
          .getSubjectsByFacultyId(fid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Fac Subject List | TTS </title>

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
        <a href="${pageContext.request.contextPath}/views/viewFac_subjects.jsp"
           class="btn btn-primary back-btn btn-round ms-auto">

           Filter

        </a></p>
        <table class="table table-hover align-middle">

           <thead>
<tr>
    <th>ID</th>
    <th>Subject Name</th>
    <th>Subject Code</th>
    <th>Subject Abbr</th>
    <th>Type</th>
    <th>Sem</th>
    <th>Department</th>
    <th>Frequency</th>
</tr>
</thead>

<tbody>

<%
try {

    for(Subject s : list){

        Department d =
        DAOFactory.getDepartmentDao()
                  .getDepartmentById(
                      s.getDept_id());
%>

<tr>
    <td><%=s.getSub_id()%></td>
    <td><%=s.getSub_name()%></td>
    <td><%=s.getSub_code()%></td>
    <td><%=s.getSub_abbr()%></td>
    <td><%=s.getSubject_type()%></td>
    <td><%=s.getSem()%></td>
    <td><%=d.getDept_name()%></td>
    <td><%=s.getFrequency()%></td>
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