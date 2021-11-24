<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student System Table</title>
  <link
  rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
/>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
  
  <div class="container my-4">
    <h3 class="text-center my-3">Student Registration | Entry Form</h3>


    <table
      id="data-table"
      class="table table-dark table-bordered form-card"
      width="100%"
      cellpadding="0"
    >
        <thead>
            <tr>
              <th>Student's Name</th>
              <th>Course</th>
              <th>Fee</th>
              <th>Edit</th>
              <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <%  

            Connection con;
            PreparedStatement pst;
            ResultSet rs;

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/school_db","root","");
            
            String query = "select * from records";
            Statement st = con.createStatement();  
            rs =  st.executeQuery(query);
                
            while(rs.next()) {
                String id = rs.getString("id");
            %>
            <tr>
                <td><%=rs.getString("sname") %></td>
                <td><%=rs.getString("course") %></td>
                <td><%=rs.getString("fee") %></td>
                <td><a href="update.jsp?id=<%=id%>" type="button" class="btn btn-info">Edit</a></td>
                <td><a href="delete.jsp?id=<%=id%>" type="button" class="btn btn-info">Delete</a></td>
            </tr>
            <%                
            }
            %>    
        </tbody>
    </table>
  </div>

</body>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</html>