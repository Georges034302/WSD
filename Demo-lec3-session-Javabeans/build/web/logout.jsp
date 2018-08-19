<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Logout</title>
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <p class="outline">You have been logged out. Click <a class="link" href="index.jsp">here</a> to return to the welcome page.</p>
    </body>
</html>
