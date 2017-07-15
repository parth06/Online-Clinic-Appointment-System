<%-- 
    Document   : DoLogout
    Created on : Apr 15, 2017, 3:05:38 PM
    Author     : Parth
--%>

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
            
            if(sess != null){
                sess.invalidate();
            }
            response.sendRedirect("index.jsp");     
        %>

    </body>
</html>
