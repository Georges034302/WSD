<%@page import="uts.controller.Validator"%>
<%@page import="uts.student.Student"%>
<%@page import="uts.student.Students"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validate Student</title>
    </head>
    <body>
        <% String filePath = application.getRealPath("WEB-INF/students.xml");%>

        <jsp:useBean id="studentApp" class="uts.student.StudentApplication" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
        </jsp:useBean>
        <%
            Students students = studentApp.getStudents();
            Student student = (Student) session.getAttribute("student");
            Validator validator = new Validator();

            String email = student.getEmail();
            String name = student.getName();
            String password = student.getPassword();
                      
            if (students.getStudent(email) != null) {
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
                session.setAttribute("student", student);
                response.sendRedirect("welcome_student.jsp");
            }}

        %>

    </body>
</html>
