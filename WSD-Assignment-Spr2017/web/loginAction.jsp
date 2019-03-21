<%@page import="uts.controller.Validator"%>
<%@page import="uts.tutor.Tutor"%>
<%@page import="uts.tutor.Tutors"%>
<%@ page language="java" import="uts.student.*" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Login Action</title>
    </head>
    <body>
        <% String studentPath = application.getRealPath("WEB-INF/students.xml");%>
        <jsp:useBean id="studentApp" class="uts.student.StudentApplication" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=studentPath%>"/>
        </jsp:useBean>
        <% String tutorPath = application.getRealPath("WEB-INF/tutors.xml");%>
        <jsp:useBean id="tutorApp" class="uts.tutor.TutorApplication" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=tutorPath%>"/>
        </jsp:useBean>
        <%Tutors tutors = tutorApp.getTutors();%>
        <%Students students = studentApp.getStudents();%>

        <%
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Tutor tutor = tutors.login(email, password);
            Student student = students.login(email, password);
            Validator validator = new Validator();

            if (!validator.validateEmail(email)) {
                response.sendRedirect("login.jsp");
                session.setAttribute("emailErr", "Incorrect email format");
            } else if (!validator.validatePassword(password)) {
                response.sendRedirect("login.jsp");
                session.setAttribute("passwordErr", "Incorrect password format");
            } else if (student != null) {
                session.setAttribute("student", student);
                response.sendRedirect("main.jsp");
            } else if (tutor != null) {
                session.setAttribute("tutor", tutor);
                response.sendRedirect("main.jsp");
            }else{
                response.sendRedirect("login.jsp");
                session.setAttribute("existErr", "User does not exist!");               
            }
        %>
    </body>
</html>