<%@page import="uts.tutor.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script src="animation.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nameErr = (String) session.getAttribute("nameErr");
            String subjectErr = (String) session.getAttribute("subjectErr");
            String statusErr = (String) session.getAttribute("status");
        %>
        
        <div class="div_form">
            <form class="form" method="post" action="main.jsp">
                <table class="table_register">
                    <tr><td class="log">Find tutor by: </td>
                        <td>
                            <select name="type"  id="selectBox" style="width: 80px;"  required><span class="validity" ></span>	    	    
                                <option value="" required><span class="validity" ></span> 
                                <option value="name">Name
                                <option value="status">Status
                                <option value="subject">Subject
                            </select>   
                        </td>
                        <td>
                            <input style="width:200px;" type="text" id="inputBox" name="searchTerm" required><span class="validity" ></span>&nbsp;<input class="button" type="submit" value="Search">
                        </td>
                    </tr>                
                </table>            
            </form>            
        </div>
        <p id="demo"></p>
    </body>
</html>
