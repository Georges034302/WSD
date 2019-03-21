<%@page import="uts.booking.Bookings"%>
<%@page import="uts.booking.Booking"%>
<%@page import="uts.tutor.Tutors"%>
<%@page import="uts.tutor.Tutor"%>
<%@page import="uts.student.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="animation.js"></script>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
        <title>Main Page</title>
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
        <%Tutors tutors = tutorApp.getTutors();%>
        <%Students students = studentApp.getStudents();%>
        <% String bookingsPath = application.getRealPath("WEB-INF/bookings.xml");%>
        <jsp:useBean id="bookingApp" class="uts.booking.BookingApplication" scope="application">
            <jsp:setProperty name="bookingApp" property="filePath" value="<%=bookingsPath%>"/>
        </jsp:useBean>
        <%Bookings bookings = bookingApp.getBookings();%>
        <%
            Student student = (Student) session.getAttribute("student");
            Tutor tutor = (Tutor) session.getAttribute("tutor");
            String log = "";
            String type = "";
            String bookingMsg = "";
            
            if (student != null) {
                log = " &lt " + student.getName() + " &gt";
                type = student.getType();
            } else if (tutor != null) {
                log = " &lt " + tutor.getName() + " &gt";
                type = tutor.getType();
            } else {
                log = " &lt " + " Unkonwn User " + " &gt";
                type = "Unknown";
            }

            String bookingID = (String) session.getAttribute("bookingIDSelect");
            Booking selectedBooking = bookings.getBooking(bookingID);
            if (selectedBooking != null) {
                
                Tutor bookingTutor = tutors.getTutor(selectedBooking.getTutorEmail());
                String cancel = request.getParameter("submitted_cancel");
                String complete = request.getParameter("submitted_complete");
                if (cancel != null) {
                    selectedBooking.setStatus("cancelled");
                    bookingTutor.setStatus("available");                  
                    bookingMsg = selectedBooking.getID()+" is cancelled!";                                 
                }
                if(complete!=null){
                    selectedBooking.setStatus("completed");
                    bookingTutor.setStatus("available");                
                    bookingMsg = selectedBooking.getID()+" is completed!";                               
                }
                bookingApp.updateXML(bookings,bookingsPath);
                session.setAttribute("bookingMsg",bookingMsg);
                response.sendRedirect("booking.jsp");
                session.removeAttribute("bookingIDSelect");
            }
        %>
        <h2 class="header"><%=type%> Profile</h2>
        <table class="main_table" >
            <tr ><td align="right" class="log" >You are logged in as  <%=log%></td></tr>
            <tr><td align="right"><u><a  class="link" href="booking.jsp">Booking</a></u> &emsp;<u><a  class="link" href="edit_user.jsp">Account</a></u> &emsp; <u><a class="link" href="logout.jsp">Logout</a></u>&emsp; </td></tr>            
        </table>
        <% if (student != null) {
                session.setAttribute("student", student);
        %>       
        <div class="div_search"><jsp:include page="search.jsp" flush="true" />    </div>      
        <div ><jsp:include page="results.jsp" flush="true" />    </div>  
        <%} else {
                session.setAttribute("tutor", tutor);
            }
        %>

    </body>
</html>
