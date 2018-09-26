
<%@page import="uts.student.Student"%>
<%@page import="uts.booking.Booking"%>
<%@page import="uts.student.Students"%>
<%@page import="uts.booking.Bookings"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="uts.tutor.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <script src="animation.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Booking Page</title>
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
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
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
        <h2 class="header"><%=type%> Booking View</h2>
        <table class="main_table" >
            <tr ><td align="right" class="log" >You are logged in as  <%=log%></td></tr>
            <tr><td align="right"><a  class="link" href="main.jsp">Main</a></u> &emsp;<u><a  class="link" href="edit_user.jsp">Account</a></u> &emsp; <u><a class="link" href="logout.jsp">Logout</a></u>&emsp; </td></tr>
        </table>

        <%
            String bookingID = request.getParameter("bookingIDSelect");
            Booking selectedBooking = bookings.getBooking(bookingID);
            if (selectedBooking != null) {
                session.setAttribute("bookingIDSelect", bookingID);
                ArrayList<Booking> list = new ArrayList();
                list.add(selectedBooking);
                bookings.print(list, out);
        %>
        <div class="div_form">
            <form class="booking_form_div" method="post" action="main.jsp">               
                <input class="button" type="submit" value="Cancel Booking" name="submitted_cancel">

                <span>
                    <c:if test="${tutor!=null}">
                        <form class="booking_form_div" method="post" action="main.jsp">
                            <input class="button" type="submit" value="Complete Booking" name="submitted_complete">
                        </c:if>
                        </span>
                    </form>
                    </div> 
                    <%} else { %>
                    <div class="div_search"> Booking does not exist! </div>
                    <% }%>

                    </body>
                    </html>
