<%@page import="uts.booking.Booking"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.booking.Bookings"%>
<%@page import="uts.controller.Validator"%>
<%@page import="uts.tutor.Tutors"%>
<%@page import="uts.tutor.Tutor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="uts.student.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="animation.js"></script>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Account page</title>
    </head>
    <body onload="startTime()">
        <div >
            <span class="float">UTSTutor</span>  <span class="time" id="time" ></span>
        </div>
        <% String studentPath = application.getRealPath("WEB-INF/students.xml");%>
        <jsp:useBean id="studentApp" class="uts.student.StudentApplication" scope="application">
            <jsp:setProperty name="studentApp" property="filePath" value="<%=studentPath%>"/>
        </jsp:useBean>
        <% String tutorPath = application.getRealPath("WEB-INF/tutors.xml");%>
        <jsp:useBean id="tutorApp" class="uts.tutor.TutorApplication" scope="application">
            <jsp:setProperty name="tutorApp" property="filePath" value="<%=tutorPath%>"/>
        </jsp:useBean>
        <% String bookingsPath = application.getRealPath("WEB-INF/bookings.xml");%>        
        <jsp:useBean id="bookingApp" class="uts.booking.BookingApplication" scope="application">
            <jsp:setProperty name="bookingApp" property="filePath" value="<%=bookingsPath%>"/>
        </jsp:useBean>
        <%Bookings bookings = bookingApp.getBookings();%>
        <%Tutors tutors = tutorApp.getTutors();%>
        <%Students students = studentApp.getStudents();%>
        <%

            Tutor tutor = (Tutor) session.getAttribute("tutor");
            Student student = (Student) session.getAttribute("student");
            Validator validator = new Validator();
            String name = request.getParameter("name");
            String dob = request.getParameter("dob");
            String password = request.getParameter("password");
            
            if (student != null && students.exist(student) && validator.test_edit(name, password, dob)) {
                studentApp.editStudent(student, name, password, dob);
        
          }%>
        <%
            if (tutor != null && tutors.exist(tutor) && validator.test_edit(name, password, dob)) {               
                tutorApp.editTutor(tutor, name, password, dob);
      
            }%>
        <%
            String log = "";
            String type = "";
            if (student != null) {
                log = " &lt " + student.getName() + " &gt";
                type = student.getType();
            } else if (tutor != null) {
                log = " &lt " + tutor.getName() + " &gt";
                type = tutor.getType();
            } else {
                log = " &lt " + " Unkonwn User " + " &gt";
            }
        %>
        <h2 class="header"><%=type%> Account</h2>
        <table class="main_table" >
            <tr ><td align="right" class="log" >You are logged in as  <%=log%></td></tr>
            <tr><td align="right"><u><a  class="link" href="booking.jsp">Bookings</a></u> &emsp;<u><a  class="link" href="main.jsp">Main</a></u> &emsp; <u><a class="link" href="logout.jsp">Logout</a></u>&emsp; </td></tr>            
        </table> 
        <h1 class="small_header">Account Details:</h1>   
        <%
            String cancel = request.getParameter("cancel");
            String edit = request.getParameter("edit");
            String action = "";
            if (cancel != null && edit == null) {
                if(student!=null) {
                    students.removeStudent(student);
                    studentApp.updateXML(students, studentPath);
                    ArrayList<Booking> studentBookings = bookings.getUserBookings(bookings.getList(), student.getName());
                    tutors.resetTutors(studentBookings, student.getName());
                    tutorApp.updateXML(tutors, tutorPath);
                    bookings.resetBookings(studentBookings);
                    bookingApp.updateXML(bookings, bookingsPath);
                } else if(tutor!=null) {
                    tutors.removeTutor(tutor);
                    ArrayList<Booking> tutorBookings = bookings.getUserBookings(bookings.getList(), tutor.getName());
                    tutors.resetTutors(tutorBookings, tutor);
                    tutorApp.updateXML(tutors, tutorPath);
                    bookings.resetBookings(tutorBookings);
                    bookingApp.updateXML(bookings, bookingsPath);
                }
                action = "logout.jsp";
                response.sendRedirect(action);
            } else if (edit != null && cancel == null) {
                action = "edit_user.jsp";
                response.sendRedirect(action);
            }
        %>       
        <div class="div_form">          
            <form class="form" action="<%=action%>" method="POST">
                <table class="table_register">                
                    <tr><td>Full name:</td><td><input style="width:250px;" type="text" value="${student!=null ? student.getName() : tutor.getName()}" name="name" required><span class="validity" ></span></td></tr>
                    <tr><td>Password:</td><td><input style="width:250px;" type="password" value="${student!=null ? student.getEmail() : tutor.getEmail()}" name="password" required><span class="validity" ></span></td></tr>               
                    <tr><td>D.O.B.</td><td><input style="width:250px;" type="date" value="${student!=null ? student.getDob() : tutor.getDob()}" name="dob" min="1970-01-01" max="2000-01-01" required ><span class="validity" ></span></td></tr>
                    <tr><td></td><td><input class="button" type="submit" value=" Update " name="edit" > &emsp; <input class="button" type="submit" value="Cancel Account" name="cancel" ></td></tr>
                </table>                  
            </form>            
        </div>
    </body>
</html>