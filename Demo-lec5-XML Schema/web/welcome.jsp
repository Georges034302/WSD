<%@page contentType="text/html" import="java.util.*" import="uts.wsd.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="demo.css"> 
        <title>Welcome Page</title>
    </head>

    <div><span class="time"> <jsp:include page="date.jsp" flush="true"/></span></div>
    <% String studentPath = application.getRealPath("WEB-INF/students.xml");%>
    <jsp:useBean id="studentApp" class="uts.wsd.StudentApplication" scope="application">
        <jsp:setProperty name="studentApp" property="filePath" value="<%=studentPath%>"/>
    </jsp:useBean>
    <%
        Students students = studentApp.getStudents();
        Student student = (Student) session.getAttribute("student");
        String tos = (String) session.getAttribute("tos");

        String color;

        if (tos != null && student != null) {
            color = student.getFavcol();
        } else {
            color = "#AED6F1";
        }
    %>
    <body style="background-color: <%=color%>">

        <% if (tos != null && student != null) {%>
        <h1>Hello, <%=student.getName()%></h1> 
        <p>Your email: <%=student.getEmail()%></p>
        <p>Your DOB: <%= student.getDob()%></p>
        <p>Your password is: <%=student.getPassword()%></p>        
        <p>Your Favorite color is: <%=student.getFavcol()%></p>
        <p>Your ID is: <%=student.getID()%></p>
        <%
            students.addStudent(student);
            studentApp.updateXML(students, studentPath);
            session.setAttribute("student", student);
        %>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%} else {
            session.invalidate();
        %>
        <p class="outline">NOTE: You must agree to TOS</p>
        <button class="button" type="button" onclick="location.href = 'main.jsp'" > Main Page </button>
        <%}%>        
        <button class="button" type="button" onclick="location.href = 'index.jsp'" > Home Page </button>
    </body>
</html>
