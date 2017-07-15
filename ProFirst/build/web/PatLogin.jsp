<%-- 
    Document   : PatLogin
    Created on : Apr 15, 2017, 2:46:33 PM
    Author     : Parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Login</title>
    </head>
    <body>
        <h1>Hello !!</h1>
        <form method="POST" action="doLoginPat.jsp">
            <input type="text" name="puname" placeholder="Username"><br>
            <input type="password" name="password" placeholder="Password"><br>
            <input type="submit" value="Enter"><br>
            not a member yet?
            <a href="PatRegister.jsp">Register</a>
        </form>
    </body>
</html>
