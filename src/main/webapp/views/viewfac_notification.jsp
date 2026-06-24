<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.model.Notification" %>

<%
List<Notification> list =
(List<Notification>)request.getAttribute("notificationList");
%>

<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title> View Fac Notification | TTS </title>
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
  

<div class="container mt-4">

    <div class="d-flex justify-content-between align-items-center mb-4">

        <h2>All Notifications</h2>

        <a href="FacultyDashboard"
           class="btn btn-primary">
            Back to Dashboard
        </a>

    </div>

    <%
    for(Notification n : list){
    %>

    <div class="card shadow-sm mb-3">

        <div class="card-body">

            <div class="d-flex justify-content-between">

                <div>

                    <h5 class="card-title">
                        <%= n.getTitle() %>
                    </h5>

                    <p class="card-text">
                        <%= n.getMessage() %>
                    </p>

                </div>

                <small class="text-muted">
                    <%= n.getCreatedAt() %>
                </small>

            </div>

        </div>

    </div>

    <%
    }
    %>

</div>

</body>
</html>