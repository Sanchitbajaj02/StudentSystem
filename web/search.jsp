<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*,java.util.*" %> 

 <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/school_db","root","");

                        String search = request.getParameter("Search");
                        System.out.println(search);

                        pst = con.prepareStatement("SELECT * FROM records WHERE sname LIKE ? OR course LIKE ? ");
                        pst.setString(1, search);
                        pst.setString(2, search);
                        rs = pst.executeQuery();

                       

                    %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

     <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="./css/style.css">

    <title>SSS</title>
  </head>
  <body>

   <jsp:include page="Modules/navigation.jsp"></jsp:include>

    <div class="container my-3">
      <h3 class="text-center my-3">Search Query List</h3>

     
      <table class="table form-card">
         <thead>
            <tr>
              <th>Student's Name</th>
              <th>Course</th>
              <th>Fee</th>
              <th>Timestamp</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
                while(rs.next()) {
                String id = rs.getString("id");
            %>
            <tr>
                <td><%=rs.getString("sname") %></td>
                <td><%=rs.getString("course") %></td>
                <td><%=rs.getString("fee") %></td>
                <td><%=rs.getString("Created_at")%></td>
                <td><a href="update.jsp?id=<%=id%>" type="button" class="btn btn-info">Edit</a></td>
                <td><a href="delete.jsp?id=<%=id%>" type="button" class="btn btn-danger">Delete</a></td>
            </tr>
            <%                
            }
            %>    
        </tbody>
      </table>
    </div>
    
    
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" ></script>
   
  </body>
</html>