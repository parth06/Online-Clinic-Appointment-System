<%-- 
    Document   : BookSlot
    Created on : Apr 15, 2017, 7:55:43 PM
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
        <title>Book Slot</title>
    </head>
    <body>
        <%
            HttpSession sess = request.getSession();
            if(sess.getAttribute("pid") == null){
                response.sendRedirect("PatLogin.jsp");
            }
            else{
                out.println("<h1>Welcome " + sess.getAttribute("pname") + "</h1>");
                out.println("<form action='DoLogout.jsp' method='POST'>");
                out.println("<input type='submit' value='Log out'><br><br>");
                out.println("</form>");
                
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/ocas","root","");
                Statement st = conn.createStatement();
                Date d = Date.valueOf(request.getParameter("sdate"));

                String sql = "SELECT * FROM `slot` WHERE `did` = '" + request.getParameter("did") + "' and `date` = '"+d+"'";
                ResultSet rs1 = st.executeQuery(sql);
                rs1.next();
               
                out.println(" <br><fieldset><legend>Slot Info</legend><table border='1'>");
                    int id1 = rs1.getInt(1);
                    int did = rs1.getInt(2);
                    Date d2 =rs1.getDate(3);
                    String fromt=rs1.getString(4);
                    String tot=rs1.getString(5);
                    int booked = rs1.getInt(6);
                    out.println("<tr><th>Slot id </th><th> Doctor Id </th><th> Date </th><th> from </th><th> to </th><th> Booked</th></tr>");
                    out.println("<tr><td>"+id1+"</td><td>"+did+"</td><td>"+d2+"</td><td>"+fromt+"</td><td>"+tot+"</td><td>"+booked+"</td>");
                out.println("</table></fieldset>");
                rs1.close();
                
                int h1=Character.getNumericValue(fromt.charAt(0));
                int h2=Character.getNumericValue(fromt.charAt(1));
                int h=(h1*10)+h2;
                
                int m1=Character.getNumericValue(fromt.charAt(3));
                int m2=Character.getNumericValue(fromt.charAt(4));
                int m=(m1*10)+m2;
                int rem=(booked*5)%60;
                int div=(booked*5)/60;
                h=h+div;
                m=m+rem+5;
                if(m>=60)
                {
                    h=h+1;
                    m=m-60;
                }
                int th1=Character.getNumericValue(tot.charAt(0));
                int th2=Character.getNumericValue(tot.charAt(1));
                int th=(th1*10)+th2;
                
                int tm1=Character.getNumericValue(tot.charAt(3));
                int tm2=Character.getNumericValue(tot.charAt(4));
                int tm=(tm1*10)+tm2;
                boolean flag=true;
                
                if(h>th)
                    flag=false;
                else if(h==th)
                {
                    if(m>tm)
                        flag=false;
                    else
                        flag=true;
                }
                else
                    flag=true;
                if(flag==true)
                {
                    booked+=1;
                    out.println("<br>Your Appoinment Booked at "+h +" hour "+m+" min on "+ d);
                    sql = " UPDATE `slot` SET`booked`='"+booked+"' WHERE `did`='" + request.getParameter("did") + "' ";
                    st.executeUpdate(sql);
                }
                else
                    out.println("Check Other Dates.. Appoinment is full now!!");
                conn.close();
                
            }
        %>
        
    </body>
</html>
