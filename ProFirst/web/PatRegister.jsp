<%-- 
    Document   : PatRegister
    Created on : Apr 15, 2017, 3:30:04 PM
    Author     : Parth
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
    </head>
    <body>
 <fieldset><legend>User Registration Page</legend>
        <form action="doRegPat.jsp" method="post">
        <table>
            <tr>
		<td>Name : </td>
                <td><input type="text" name="pname" /></td>
            </tr>
            <tr>
		<td>Username : </td>
                <td><input type="text" name="puname" /></td>
            </tr>
            <tr>
		<td>Password : </td>
		<td><input type="password" name="password"/></td>
            </tr>
            <tr>
		<td>Gender : </td>
		<td>Male<input type="radio" name="gender" value="Male"/>
		Female <input  type="radio" name="gender" value="Female"/></td>
            </tr>
            <tr>
		<td>Phone No </td>
		<td><input type="text" name="phone" /></td>
            </tr>
            <tr>
		<td>Address </td>
		<td><input type="text" name="address" /></td>
            </tr>
            <tr>
		<td>Submit</td>
		<td><button>Submit</button></td>
            </tr>
        </table>
        </form>
        </fieldset>
    </body>
</html>
