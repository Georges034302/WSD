<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login Page</title>
    </head>
    <body bgcolor="lightblue">
        <h2>Enter your details to register:</h2>
        <br>
        <form action="welcome.jsp" method="post">
            <table>
                <tr><td>Name</td><td><input size="16" type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input size="16" type="text" name="email"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="bday"></td></tr>
                <tr><td></td><td><input type="submit" value="Register"> </td></tr>
            </table>
        </form>
    </body>
</html>