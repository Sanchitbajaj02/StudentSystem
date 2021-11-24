<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%
        String id = request.getParameter("id");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/school_db","root","");
        pst = con.prepareStatement("delete from records where id = ?");
        pst.setString(1, id);
        pst.executeUpdate();  

        %>

        <script>  
            alert("Record Deleted Successfully");    
            window.location.href="/StudentSystem";
       </script>
