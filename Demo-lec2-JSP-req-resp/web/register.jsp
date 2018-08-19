<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="demo.css"> 
        <title>Login Page</title>
    </head>
    <body>
        <div><span> <jsp:include page="date.jsp" flush="true"/></span></div>
        <h1>Enter your details to register:</h1> 
        <br>
        <form action="welcome.jsp" method="post">
            <table>
                <tr><td>Name</td><td><input type="text" name="name"></td></tr>
                <tr><td>Email</td><td><input  type="text" name="email"></td></tr>
                <tr><td>Password</td><td><input  type="password" name="password"></td></tr>
                <tr><td>Date of Birth</td><td><input type="date" name="bday"></td></tr>                
                <tr><td></td><td><input class="button" type="submit" value="Register"> &emsp; <button class="button" type="button" onclick="location.href='index.jsp'" > Return </button></td></tr>
            </table>
        </form>
    </body>
</html>