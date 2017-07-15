<%-- 
    Document   : slotAllot
    Created on : Apr 15, 2017, 5:43:01 PM
    Author     : Parth
--%>
<%@page import="java.sql.Date"%>
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
            HttpSession sess = request.getSession();
            if(sess.getAttribute("did") == null){
                response.sendRedirect("DocLogin.jsp");
            }
            else{
                out.println("<h1>Welcome " + sess.getAttribute("dname") + "</h1>");
                out.println("<form action='DoLogout.jsp' method='POST'>");
                out.println("<input type='submit' value='Log out'><br><br>");
                out.println("</form>");

                int docid       = Integer.parseInt(sess.getAttribute("did").toString());
                Date d          = Date.valueOf(request.getParameter("date"));
                String from     = request.getParameter("tfrom");
                String to       = request.getParameter("tto");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                String sql = "INSERT INTO `slot`(`did`,`date`, `fromtime`, `totime`) VALUES ('"+docid+"','"+d+"','"+from+"','"+to+"')";
                st.executeUpdate(sql);

                String sql1 = "SELECT * FROM `slot` WHERE `did`='" + sess.getAttribute("did") + "'";
                ResultSet rs = st.executeQuery(sql1);
                
                out.println(" <fieldset><legend>Slot Info</legend><table border='1'>");
                while(rs.next())
                {
                    int id=rs.getInt(1);
                    int did=rs.getInt(2);
                    Date d1=rs.getDate(3);
                    String fromt=rs.getString(4);
                    String tot=rs.getString(5);
                
                    out.println("<tr><th>id </th><th>Doctor Id </th><th>Date </th><th>from </th><th>to </th></tr>");
                    out.println("<tr><td>"+id+"</td><td>"+did+"</td><td>"+d1+"</td><td>"+fromt+"</td><td>"+tot+"</td>");
                }
                out.println("</table></fieldset>");
                
                rs.close();
                conn.close();
                
        }
%>
    </body>
</html>
