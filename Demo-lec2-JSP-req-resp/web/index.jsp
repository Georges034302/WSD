<%-- 
    Document   : index
    Created on : Jul 29, 2018, 11:56:09 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Home Page</title>
    </head>
     <body>
        <div><span> <jsp:include page="date.jsp" flush="true"/></span></div>      
        <h1 align="center">Hello Class of Spring 2018</h1>  
        <div align="center"> <a href="register.jsp"> Register </a> &emsp; <a href="math.jsp">Math Page</a> </div>
    </body>
</html>
