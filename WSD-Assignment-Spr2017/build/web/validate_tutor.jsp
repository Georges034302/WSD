<%@page import="uts.controller.Validator"%>
<%@page import="uts.tutor.Tutor"%>
<%@page import="uts.tutor.Tutors"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate Tutor</title>
    </head>
    <body>
        <% String tutorfile = application.getRealPath("WEB-INF/tutors.xml");%>

        <jsp:useBean id="tutorApp" class="uts.tutor.TutorApplication" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=tutorfile%>"/>
        </jsp:useBean>
        <%
            Tutors tutors = tutorApp.getTutors();
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            Validator validator = new Validator();
            String email = tutor.getEmail();
            String name = tutor.getName();
            String password = tutor.getPassword();          

           if (tutors.getTutor(email)!=null) {
                response.sendRedirect("register.jsp");
                session.setAttribute("userErr", "User is already registered!");
            }else{
            if (!validator.validateEmail(email)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("emailErr", "Incorrect email format");
            } else if (!validator.validateName(name)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("nameErr", "Incorrect name format");
            } else if (!validator.validatePassword(password)) {
                response.sendRedirect("register.jsp");
                session.setAttribute("passwordErr", "Incorrect password format");
            } else {
                session.setAttribute("tutor", tutor);
                response.sendRedirect("welcome_tutor.jsp");
            }}
        %>

    </body>
</html>
