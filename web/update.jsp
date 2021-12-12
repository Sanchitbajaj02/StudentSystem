<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/school_db","root","Mathesmatics@003");
        pst = con.prepareStatement("update records set sname = ?, course =?, fee= ? where id = ?");
        pst.setString(1, name);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.setString(4, id);
        pst.executeUpdate();  

        %>

        <script>  
            alert("Record Updated Successfully");   
            window.location.href="table.jsp";
       </script>
    <%            
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student System | Update</title>
        <link
        rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        />
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <jsp:include page="Modules/navigation.jsp"></jsp:include>

        <div class="container" >
            <h3 class="text-center mt-3">Student Registration | Update Form</h3>

            <div class="center-box">
                <form  method="POST" action="#" class="form-card">
                    <%    
                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/school_db","root","");

                        String id = request.getParameter("id");

                        pst = con.prepareStatement("select * from records where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();

                        while(rs.next())
                        {

                    %>
                    <div class="form-group">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%= rs.getString("sname")%>" name="sname" id="sname" required >
                    </div>

                    <div class="form-group">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" name="course" value="<%= rs.getString("course")%>" id="course" required >
                    </div>

                    <div class="form-group">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" name="fee" id="fee" value="<%= rs.getString("fee")%>" required >
                    </div>

                    <% }  %>

                    <div class="form-group">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-outline-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-outline-secondary">
                        <a href="index.jsp" type="button" class="btn btn-outline-danger">Click Back</a>
                    </div>  

                </form>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</html>