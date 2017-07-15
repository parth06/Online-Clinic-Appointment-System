<%-- 
    Document   : DocLogin
    Created on : Apr 15, 2017, 2:46:23 PM
    Author     : Parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Login</title>
    </head>
    <body>
        <h1>Hello Doctor!</h1>
        <form method="POST" action="doLoginDoc.jsp">
            <input type="text" name="duname" placeholder="Doctor Username"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <input type="submit" value="Enter"><br>
            new user?
            <a href="DocRegister.jsp">Register</a>
        </form>
    </body>
</html>
