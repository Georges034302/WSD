<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="css/demo.css"/>
        <title>Main Page</title>
    </head>
    <%
        String color;
        String log;
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            color = student.getFavcol();
            log = " &lt " + student.getName() + " &gt";
        } else {
            color = "#AED6F1";
            log = " &lt " + "Guest Student" + " &gt";
        }
        session.setAttribute("log", log);
    %>
   
    <body style="background-color: <%=color%>">
        <h2 class="outline">Student Profile</h2>        
        <jsp:include page="navbar.jsp" flush="true"/>
        <hr/>
        <% if (student != null) { %>            
        <jsp:include page="profile.jsp" flush="true" />
        <%
            session.setAttribute("studentEdit", student);
            String genre = request.getParameter("genre");
            session.setAttribute("genre", genre);              
        %>
        <div class="div_search"><jsp:include page="search.jsp" flush="true"/></div>
        <% if (genre != null && !genre.isEmpty()) { %>
        <div class="results_table"><jsp:include page="results2.jsp" flush="true"/></div>
        <% } %>                
        <%} else { %>
        <p class="outline" style="text-align: center;">Welcome Guest Student</p>
        <%}%>
    </body>
</html>
