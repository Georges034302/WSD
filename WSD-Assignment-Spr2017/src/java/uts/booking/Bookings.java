package uts.booking;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.Writer;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "bookings")
public class Bookings implements Serializable {

    @XmlElement(name = "booking")
    private ArrayList<Booking> list = new ArrayList<>();

    public Bookings() {
    }

    
    public ArrayList<Booking> getList() {
        return list;
    }

    public void addBooking(Booking booking) {
        list.add(booking);
    }

    public void removeBookings(ArrayList<Booking> list) {        
        this.list.remove(list);
    }

    public Booking getBooking(String ID) {
        for (Booking booking : list) {
            if (booking.getID().equals(ID)) {
                return booking;
            }
        }
        return null;
    }

    public void remove(Booking booking) {
        list.remove(booking);
    }

    public boolean exist(Booking booking) {
        return list.contains(booking);
    }
    
     public Bookings getBookingbyStatus(String status) {
        Bookings bookings = new Bookings();
        ArrayList<Booking> statusList = new ArrayList<>();
        for (Booking booking: list) {
            if (booking.getStatus().trim().equalsIgnoreCase(status)) {
                statusList.add(booking);
            }
        }
        bookings.list = statusList;
        return bookings;
    }

    public void resetBookings(ArrayList<Booking> list){
        for(Booking booking:list)
            if(!booking.getStatus().trim().equalsIgnoreCase("completed"))
                booking.setStatus("cancelled");
    }
    public ArrayList<Booking> findBooking(String search) {
        ArrayList<Booking> found = new ArrayList();
        list.stream().filter((booking) -> (booking.getStatus().trim().equalsIgnoreCase(search)
                || booking.getID().trim().equalsIgnoreCase(search)
                || booking.getSubject().trim().equalsIgnoreCase(search))).forEach((booking) -> {
            found.add(booking);
        });
        return found;
    }
    
    public void print(ArrayList<Booking> list, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"bookings_table\" align=\"center\">");
        out.print("\n<thead><th>Name</th><th>Email</th><th>Subject</th></thead>");

        list.stream().map((booking) -> {
            out.println("<tr > ");
            out.println("<td>" + booking.getID() + "</td>");
            return booking;
        }).map((booking) -> {
            out.println("<td >" + booking.getStatus() + "</td>");
            return booking;
        }).map((booking) -> {
            out.println("<td >" + booking.getSubject() + "</td>");
            return booking;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }

    
    public ArrayList<Booking> getUserBookings(ArrayList<Booking> bookings,String username){
        ArrayList<Booking> userList = new ArrayList();

        for(Booking booking:bookings)
            if(booking.getStudentName().equalsIgnoreCase(username) || booking.getTutorName().equalsIgnoreCase(username))
                userList.add(booking);
        return userList;
    }
    public void printBookings(ArrayList<Booking> list, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"bookings_table\" align=\"center\">");
        out.print("\n<thead><th>Booking ID</th><th>Status</th><th>Subject</th><th>Tutor</th></thead>");

        list.stream().map((booking) -> {
            String href = booking.verifyStatus() ? "<a class=\"link\" href=\"viewbooking.jsp?bookingIDSelect=" + booking.getID()+ "\" >" + booking.getID() + "</a>" :booking.getID() ;
            out.println("<tr > ");
            out.println("<td>" + href+ "</td>");
            return booking;
        }).map((booking) -> {
            out.println("<td >" + booking.getStatus() + "</td>");
            return booking;
        }).map((booking) -> {
            out.println("<td >" + booking.getSubject() + "</td>");
            return booking;
        }).map((booking) -> {
            out.println("<td >" + booking.getTutorName() + "</td>");
            return booking;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
}
