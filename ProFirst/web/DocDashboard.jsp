<%-- 
    Document   : DocDashboard
    Created on : Apr 15, 2017, 3:02:46 PM
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
        <title>Doctor Dashboard</title>
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
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                String sql = "SELECT * FROM doctor WHERE `id`='" + sess.getAttribute("did") + "'";
                ResultSet rs = st.executeQuery(sql);
                rs.next();
               
                int id=rs.getInt(1);
                String dname=rs.getString(2);
                String duname=rs.getString(3);
                String password=rs.getString(4);
                String special=rs.getString(5);
                String phone=rs.getString(6);
                String address=rs.getString(7);
                
                out.println(" <fieldset><legend>MyInfo</legend><table>");
                out.println("<tr><td>Name : </td><td>"+dname+"</td></tr>");
                out.println("<tr><td>Username : </td><td>"+duname+"</td></tr>");
                //out.println("<tr><td>Password : </td><td>"+password+"</td></tr>");
                out.println("<tr><td>Specilization : </td><td>"+special+"</td></tr>");
                out.println("<tr><td>Phone : </td><td>"+phone+"</td></tr>");
                out.println("<tr><td>Address : </td><td>"+address+"</td></tr>");
                out.println("</table></fieldset>");
                rs.close();
                
                String sql1 = "SELECT * FROM `slot` WHERE `did`='" + sess.getAttribute("did") + "'";
                ResultSet rs1 = st.executeQuery(sql1);
                
                out.println(" <br><fieldset><legend>Slot Info</legend><table border='1'>");
                while(rs1.next())
                {
                    int id1=rs1.getInt(1);
                    int did=rs1.getInt(2);
                    Date d2=rs1.getDate(3);
                    String fromt=rs1.getString(4);
                    String tot=rs1.getString(5);
                    int b=rs1.getInt(6);
                    out.println("<tr><th> Slot id </th><th> Doctor Id </th><th> Date </th><th> from </th><th> to </th><th> Booked</th></tr>");
                    out.println("<tr><td>"+id1+"</td><td>"+did+"</td><td>"+d2+"</td><td>"+fromt+"</td><td>"+tot+"</td><td>"+b+"</td>");
                }
                out.println("</table></fieldset>");
                
                rs1.close();
                conn.close();

               
            }
        %>
        <br><br>
        <fieldset><legend>Booking Slots</legend>
            <form method="post" action="slotAllot.jsp">
            <table>
                <tr>
                    <td>Select date</td>
                    <td><input type="date" name="date"></td>
                </tr>
                <tr>
                    <td>From</td>
                    <td><input type="text" name="tfrom" placeholder="24:00"></td>
                </tr>
                <tr>
                    <td>To</td>
                    <td><input type="text" name="tto" placeholder="24:00"></td>
                </tr>
                <tr>
                    <td>Submit :</td>
                    <td><input type="Submit" ></td>
                </tr>
            </table>
        </form>
    </fieldset> 
    </body>
</html>
