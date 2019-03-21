/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.booking;

import java.io.*;
import javax.xml.bind.*;

public class BookingApplication implements Serializable {

    private String filePath;
    private Bookings bookings;
 
    public BookingApplication() {
        // TODO Auto-generated constructor stub
    }

    public BookingApplication(String filePath, Bookings bookings) {
        super();
        this.filePath = filePath;
        this.bookings = bookings;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {

        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        bookings = (Bookings) u.unmarshal(fin); // This loads the "shop" object		
        fin.close();

    }

    public void updateXML(Bookings bookings, String filePath) throws Exception {
        this.bookings = bookings;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Bookings.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(bookings, fout);
        fout.close();
    }
  
    public Bookings getBookings() {
        return bookings;
    }

    public Bookings getBookingsbyEmail(String email){
        Bookings userBookings = new Bookings();
        for(Booking booking:bookings.getList())
            if(booking.getStudentEmail().trim().equalsIgnoreCase(email)||booking.getTutorEmail().trim().equalsIgnoreCase(email))
                userBookings.addBooking(booking);
        return  userBookings;
    }
    public void setBookings(Bookings bookings) {
        this.bookings = bookings;
    }
    
}
