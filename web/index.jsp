<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.sql.*" %> 

<% 
    if (request.getParameter("submit") != null) {
        String sname = request.getParameter("sname"); 
        String course = request.getParameter("course"); 
        String fee = request.getParameter("fee"); 

        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/school_db", "root", "");
        pst = con.prepareStatement("insert into records(sname, course, fee) values(?, ?, ?) ");
        pst.setString(1, sname);
        pst.setString(2, course);
        pst.setString(3, fee);
        pst.executeUpdate();
        
%>
    <script>alert("Record Added Successfully");</script>
    
<%
    } 
%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Student System | Home</title>
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
    />
    <link rel="stylesheet" href="./css/style.css">
  </head>

  <body>

    <jsp:include page="Modules/navigation.jsp"></jsp:include>

    <section class="container">
      <h3 class="text-center mt-3">Student Registration | Entry Form</h3>

        <div class="center-box">
          <form action="index.jsp" method="post" class="form-card">
            <div class="form-group">
              <label for="sname">Student's Name</label>
              <input
                type="text"
                name="sname"
                id="sname"
                class="form-control"
                placeholder="Enter student's name"
                required
              />
            </div>

            <div class="form-group">
              <label for="course">Course</label>
              <input
                type="text"
                name="course"
                id="course"
                class="form-control"
                placeholder="Enter course"
                required
              />
            </div>

            <div class="form-group">
              <label for="fee">Fee</label>
              <input
                type="text"
                name="fee"
                id="fee"
                class="form-control"
                placeholder="Enter fee amount"
                required
              />
            </div>

            <div class="form-group">
              <input
                type="submit"
                name="submit"
                class="btn btn-primary"
                value="Submit"
              />
              <input
                type="reset"
                name="reset"
                class="btn btn-secondary"
                value="Reset"
              />
            </div>
          </form>
        </div>
    </section>
  </body>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"></script>
</html>
