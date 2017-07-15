<%-- 
    Document   : doLoginPat
    Created on : Apr 15, 2017, 2:52:21 PM
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
        <h1>Hello World!</h1>
        <%
            HttpSession sess = request.getSession();
            if(sess.getAttribute("pid") != null){
                response.sendRedirect("PatDashboard.jsp");
            }
            else{
                String uname = request.getParameter("puname");
                String pwd = request.getParameter("password");

                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                String sql = "SELECT * FROM patient WHERE `username`='" + uname + "'";
                ResultSet rs = st.executeQuery(sql);
                rs.next();
                String db_password = rs.getString("password");
                int id=rs.getInt(1);

                if(pwd.equals(db_password)){
                    sess.setAttribute("pid", id);
                    sess.setAttribute("pname", rs.getString("name"));
                }
                response.sendRedirect("PatDashboard.jsp");
            }                            
        %>
    </body>
</html>
