<%@page import="uts.student.*" import="java.util.*"contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <title>Welcome Student</title>
    </head> 
    
    <% String filePath = application.getRealPath("WEB-INF/students.xml");%>
    <jsp:useBean id="studentApp" class="uts.student.StudentApplication" scope="application">
        <jsp:setProperty name="studentApp" property="filePath" value="<%=filePath%>"/>
    </jsp:useBean>
    <%Students students = studentApp.getStudents();%>
    <%
        Student student = (Student)session.getAttribute("student");
     %>
    <body >      
        <%            
            session.setAttribute("student", student);
            students.addStudent(student);
            studentApp.updateXML(students, filePath);        
            response.sendRedirect("main.jsp");
        %>       
    </body>
</html>
