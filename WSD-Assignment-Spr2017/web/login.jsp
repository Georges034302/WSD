<%-- 
    Document   : login
    Created on : Mar 28, 2017, 12:35:54 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <script src="animation.js">

        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Login Page</title>
    </head>
    <body onload="startTime()">
        <div >
            <span class="float">UTSTutor</span>  <span class="time" id="time" ></span>
        </div>
        <%  String existErr = (String) session.getAttribute("existErr");%>
        <h2 class="header">User Login: <span class="validity" ><c:if test="${existErr!=null}"><span><c:out value="${existErr}"/></span></c:if></span></h2> 

        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
        %>
        <div class="div_form">
            <form class="form" method="post" action="loginAction.jsp">
                <table class="table_register">
                    <tr><td>Email:</td><td><input style="width:238px;" type="text" name="email" required></td><td><span class="validity" ><c:if test="${emailErr!=null}"><c:out value="${emailErr}"/></span></c:if></td></tr>
                    <tr><td>Password :</td><td><input style="width:238px;" type="password" name="password" required></td><td><span class="validity" ><c:if test="${passwordErr!=null}"><c:out value="${passwordErr}"/></span></c:if></td></tr>
                        <tr><td></td><td><input class="button" type="submit" value="Login">&emsp; &emsp;<u><a class="link" style="text-align: center" href="register.jsp">Register</a></u>&emsp;&nbsp; <u><a class="link" href="index.html">back</a></u></td></tr>
                    </table>            
                </form>   
            <%
                session.invalidate();
            %>
        </div>                    
    </body>
</html>
