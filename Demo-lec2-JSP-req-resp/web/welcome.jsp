<%-- 
    Document   : welcome
    Created on : Jul 29, 2018, 12:12:03 PM
    Author     : George
--%>

<%@page contentType="text/html" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Welcome Page</title>
    </head>
    <body>
        <div><span> <jsp:include page="date.jsp" flush="true"/></span></div>
        <%
           String name = request.getParameter("name");
           String email = request.getParameter("email");
           String bday = request.getParameter("bday");  
           String password = request.getParameter("password");
           int key = (new Random()).nextInt(999999);
        %>
        <h1>Hello, <%=name%></h1> 
        <p>Your email: <%=email%></p>
        <p>Your DOB: <%=bday%></p>
        <p>Your password is: <%=password%></p>
        <p>Your ID is: <%=key%></p>
        <button class="button" type="button" onclick="location.href='index.jsp'" > Return </button>
    </body>
</html>
