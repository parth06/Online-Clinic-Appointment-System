<%-- 
    Document   : PatDashboard
    Created on : Apr 15, 2017, 3:02:57 PM
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
        <title>patient Dashboard</title>
    </head>
    <body>
    <%
            HttpSession sess = request.getSession();
            if(sess.getAttribute("pid") == null){
                response.sendRedirect("PatLogin.jsp");
            }
            else{
                
                out.println("<h1>Welcome " + sess.getAttribute("pname") + "</h1>");
                out.println("<br><form action='DoLogout.jsp' method='POST'>");
                out.println("<input type='submit' value='Log out'><br><br>");
                out.println("</form>");
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                String sql = "SELECT * FROM patient WHERE `id`='" + sess.getAttribute("pid") + "'";
                ResultSet rs = st.executeQuery(sql);
                rs.next();
                int id=rs.getInt(1);
                String pname=rs.getString(2);
                String puname=rs.getString(3);
                String password=rs.getString(4);
                String gender=rs.getString(5);
                String phone=rs.getString(6);
                String address=rs.getString(7);
                
                out.println(" <fieldset><legend>MyInfo</legend><table>");
                out.println("<tr><td>Name : </td><td>"+pname+"</td></tr>");
                out.println("<tr><td>Username : </td><td>"+puname+"</td></tr>");
                //out.println("<tr><td>Password : </td><td>"+password+"</td></tr>");
                out.println("<tr><td>Specilization : </td><td>"+gender+"</td></tr>");
                out.println("<tr><td>Phone : </td><td>"+phone+"</td></tr>");
                out.println("<tr><td>Address : </td><td>"+address+"</td></tr>");
                out.println("</table></fieldset>");
                
            }
        %>
        
        <fieldset><legend>Book Appointment</legend>
            <form method="post" action="BookSlot.jsp">
            <table>
                <tr>
                    <td>Select date</td>
                    <td><input type="date" name="sdate"></td>
                </tr>
                <tr>
                    <td>Doctor</td>
                    <td>
                        <select name="did">
                        <option value="1" selected="true">Sanjay Patel</option>
                        <option value="2">Mehul</option>
                        </select>
                    </td>
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
