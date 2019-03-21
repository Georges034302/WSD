
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.tutor.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script src="animation.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Results Page</title>
    </head>
    <body>
        <% String tutorPath = application.getRealPath("WEB-INF/tutors.xml");%>
        <% String searchPath = application.getRealPath("WEB-INF/foundtutors.xml");%>
        <jsp:useBean id="tutorApp" class="uts.tutor.TutorApplication" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=tutorPath%>"/>
        </jsp:useBean>
        <%Tutors tutors = tutorApp.getTutors();%>
        <%
            String search = request.getParameter("searchTerm");
            ArrayList<Tutor> foundTutors = tutors.findTutor(search);            
            if(foundTutors.size() >0 ) tutors.print(foundTutors, out);
        %>
        
    </body>
</html>
