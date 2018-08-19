<%@page import="uts.wsd.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Navbar Page</title>
    </head>
    <body>
        <%
            Student student = (Student) session.getAttribute("student");
            String log = (String) session.getAttribute("log");
        %>
        <table width="100%" >
            <tr style="background-color: #7f9fc4;" ><td align="right" class="outline">You are logged in as  <%=log%></td></tr>
            <tr><td align="right">
                    <%if (student != null) { %>
                    <u><a class="link" href="edit_user.jsp">Account</a></u> 
                        <%} else { %>
                    <u><a class="link" href="register.jsp">Register</a></u>
                        <%}%>
                    &emsp;<u><a class="link" href="logout.jsp">Logout</a></u>
                </td>
            </tr>                  
        </table>  
    </body>
</html>
