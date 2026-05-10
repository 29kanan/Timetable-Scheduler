<%@ page import="java.sql.*" %>
<%@page import="com.util.DBConnection"%>
<%@ page import="java.sql.* , com.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Department List</title>

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
            Department List
        </h2>

        <a href="adminDashB.jsp"
           class="btn btn-primary back-btn">

           Back to Dashboard

        </a>

    </div>

    <div class="table-container">

        <table class="table table-hover align-middle">

            <thead>

                <tr>
                    <th>ID</th>
                    <th>Department Name</th>
                    <th>HOD Name</th>
                    
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
                        "SELECT * FROM departments");

                    while(rs.next()) {
            %>

                <tr>

                    <td>
                        <%= rs.getInt("dept_id") %>
                    </td>

                    <td>
                        <%= rs.getString("dept_name") %>
                    </td>
                    
                    <td>
                        <%= rs.getString("HOD_name") %>
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