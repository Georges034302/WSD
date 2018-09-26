<%-- 
    Document   : register_action
    Created on : Jun 30, 2017, 10:42:55 PM
    Author     : George
--%>

<%@page import="uts.controller.Validator"%>
<%@page import="uts.tutor.Tutor"%>
<%@page import="uts.student.Student"%>
<%@page import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Action</title>
    </head>
    <body>
        <%
             String name = request.getParameter("name");
             String email = request.getParameter("email");
             String password = request.getParameter("password");        
             String dob = request.getParameter("dob");            
             String type = request.getParameter("type");
             String subject = request.getParameter("subject");
             Validator validator = new Validator();
             
             if(validator.checkEmpty(email, name, password)){
                  response.sendRedirect("register.jsp");
                 session.setAttribute("userErr", "Please fill in empty fields!");
             }else{
             if(type.equalsIgnoreCase("Student")){
                 Student student = new Student(email,name,password,dob,type);
                 session.setAttribute("student", student);
                 response.sendRedirect("validate_student.jsp");
             }else if(type.equalsIgnoreCase("Tutor")){
                 Tutor tutor = new Tutor(email,name,password,type,subject,"available",dob);
                 session.setAttribute("tutor", tutor);
                 response.sendRedirect("validate_tutor.jsp");                 
             }}
         %>
    </body>
</html>
