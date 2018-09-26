<%-- 
    Document   : register
    Created on : Mar 28, 2017, 12:35:39 AM
    Author     : George
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script src="animation.js">
        </script>
        <title >Register Page</title>
    </head>
    <body onload="startTime()">
        <%
            String emailErr = (String) session.getAttribute("emailErr");
            String passwordErr = (String) session.getAttribute("passwordErr");
            String nameErr = (String) session.getAttribute("nameErr");
            String userErr = (String) session.getAttribute("userErr");
        %>
        <div >
            <span class="float">UTSTutor</span>  <span class="time" id="time" ></span>
        </div>
        <h2 class="header">Enter your details: <c:if test="${userErr!=null}"><span><c:out value="${userErr}"/></span></c:if></h2>
        
            <div class="div_form">
                <form class="form" method="post" action="register_action.jsp" >
                    <table class="table_register">
                        <tr><td>Full Name:</td><td><input style="width:238px;" type="text" name="name" required></td><td><span class="validity" ><c:if test="${nameErr!=null}"><c:out value="${nameErr}"/></span></c:if></td></tr>
                    <tr><td>Email:</td><td><input style="width:238px;" type="text" name="email" required ></td><td><span class="validity" ><c:if test="${emailErr!=null}"><c:out value="${emailErr}"/></span></c:if></td></tr>
                    <tr><td>Password :</td><td><input style="width:238px;" type="password" name="password" required></td><td><span class="validity" ></span><c:if test="${passwordErr!=null}"><span><c:out value="${passwordErr}"/></span></c:if></td></tr>
                        <tr><td>D.O.B :</td><td><input style="width:238px;" type="date" name="dob" min="1970-01-01" max="2000-01-01" required ><span class="validity" ></span></td></tr>
                        <tr><td>User:</td>
                            <td >
                                <select id="box1" name="type" onchange="handleSelect()"  style="width: 80px;" required><span class="validity" ></span>		    	    
                                    <option value="" required><span class="validity" ></span>	
                                    <option value="Student"> Student
                                    <option value="Tutor"> Tutor                            
                                </select>                               
                                Subject:                    
                                <select id="box2" name="subject" style="width: 80px;" required><span class="validity" ></span>		    	    
                                    <option value="" required><span class="validity" ></span>	
                                    <option value="WSD"> WSD
                                    <option value="USP"> USP         
                                    <option value="SEP"> SEP 
                                    <option value="AppProg"> AppProg   
                                </select>
                            </td>
                        </tr>
                        <tr><td></td><td><input class="button" style="width:80px;" type="submit" value="Register"> &emsp; &emsp;<u><a class="link" style="text-align: center" href="login.jsp">Login</a></u>&emsp;<u><a class="link" href="index.html"> back</a></u></td></tr>
                    </table>            
                </form>
            </div>
        <%
            session.invalidate();
        %>
    </body>
</html>
