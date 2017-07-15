<%-- 
    Document   : doRegDoc
    Created on : Apr 15, 2017, 3:36:10 PM
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
    <%
        String name     = request.getParameter("dname");
        String uname    = request.getParameter("duname");
        String pwd      = request.getParameter("password");
        String spec     = request.getParameter("special");
        String phone    = request.getParameter("phone");
        String address  = request.getParameter("address");
        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
        Statement st = conn.createStatement();
        String sql = "INSERT INTO `doctor`(`name`, `username`, `password`, `specialization`, `phone`, `address`) VALUES ('"+name+"','"+uname+"','"+pwd+"','"+spec+"','"+phone+"','"+address+"')";
        st.executeUpdate(sql);
        response.sendRedirect("DocLogin.jsp");               
    %>

    </body>
</html>
