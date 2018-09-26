<%@page import="uts.tutor.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Welcome Tutor</title>
    </head>     
    <% String filePath = application.getRealPath("WEB-INF/tutors.xml");%>
    <jsp:useBean id="tutorApp" class="uts.tutor.TutorApplication" scope="application">
        <jsp:setProperty name="tutorApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%Tutors tutors = tutorApp.getTutors();%>
    <% Tutor tutor = (Tutor) session.getAttribute("tutor");  %>
    <body >        
        <%           
            session.setAttribute("tutor", tutor);
            tutors.addTutor(tutor);
            tutorApp.updateXML(tutors, filePath);
            response.sendRedirect("main.jsp");
        %>       
    </body>
</html>
