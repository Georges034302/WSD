package uts.ws.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.booking.Booking;
import uts.booking.BookingApplication;
import uts.booking.Bookings;

@Path("/bookingApp")
public class BookingService {    

    @Context
    private ServletContext application;

    private BookingApplication getBookingApp() throws JAXBException, IOException, Exception {
       
        synchronized (application) {
            BookingApplication bookingApp = (BookingApplication) application.getAttribute("bookingApp");
            if (bookingApp == null) {
                bookingApp = new BookingApplication();
                bookingApp.setFilePath(application.getRealPath("WEB-INF/bookings.xml"));
                application.setAttribute("bookingApp", bookingApp);
            }
            return bookingApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTSBooking";
    }
    
    @Path("bookings")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Bookings getBookings() throws JAXBException, IOException, Exception{
        return getBookingApp().getBookings();
    }

    @Path("bookings/{status}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Bookings getBookingtbyStatus(@PathParam("status") String status) throws JAXBException, IOException, Exception{
        return getBookingApp().getBookings().getBookingbyStatus(status);
    }
}

