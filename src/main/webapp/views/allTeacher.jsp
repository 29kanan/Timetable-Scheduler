<%@ page import="java.sql.*" %>
<%@page import="com.util.DBConnection"%>
<%@ page import="java.sql.* , com.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Faculty Members</title>
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
  
<link
href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style3.css" />

</head>

<body>

<div class="container mt-5">

    <div class="d-flex
                justify-content-between
                align-items-center
                mb-4">

        <h2 class="page-title">
            All Faculty Members
        </h2>
            
            <a href="adminDashB.jsp"
           class="btn btn-primary back-btn btn-round ms-auto">

           Back to Dashboard

        </a>      
        <a href="adminDashB.jsp"
           class="btn btn-primary back-btn btn-round ms-auto">

           Back to Dashboard

        </a>

    </div>

    <div class="table-container">

        <table class="table table-hover align-middle">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Faculty Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Department</th>
                    <th>Status</th>
                </tr>

            </thead>

            <tbody>

            <%
                try {

                    Connection con =
                        DBConnection.getConnection();

                    Statement st =
                        con.createStatement();

                    ResultSet rs =
                        st.executeQuery(
                        "SELECT * FROM login_teacher");

                    while(rs.next()) {
            %>

                <tr>

                    <td>
                        <%= rs.getInt("fac_id") %>
                    </td>

                    <td>
                        <%= rs.getString("username") %>
                    </td>
                    
                    <td>
                        <%= rs.getString("email") %>
                    </td>
                    
                    <td>
                        <%= rs.getString("phone") %>
                    </td>

                    <td>
                        <%= rs.getString("dept") %>
                    </td>

                    <td>

                        <span class="status-badge">
                            Active
                        </span>

                    </td>

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

    </div>

</div>

</body>
</html>