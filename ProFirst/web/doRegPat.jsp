<%-- 
    Document   : doRegPat
    Created on : Apr 15, 2017, 3:50:48 PM
    Author     : Parth
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%  String name     = request.getParameter("pname");
        String uname    = request.getParameter("puname");
        String pwd      = request.getParameter("password");
        String gender   = request.getParameter("gender");
        String phone    = request.getParameter("phone");
        String address  = request.getParameter("address");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
        Statement st = conn.createStatement();
        String sql = "INSERT INTO `patient`(`name`, `username`, `password`, `gender`, `phone`, `address`) VALUES ('"+name+"','"+uname+"','"+pwd+"','"+ gender+"','"+phone+"','"+address+"')";
        st.executeUpdate(sql);
        response.sendRedirect("PatLogin.jsp");               
    %>
    </body>
</html>
