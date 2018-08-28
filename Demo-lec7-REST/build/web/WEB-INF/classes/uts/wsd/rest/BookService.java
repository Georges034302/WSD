package uts.wsd.rest;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.*;
import uts.library.*;

/**
 *
 * @author George
 */
@Path("/libraryApp")
public class BookService {    

    @Context
    private ServletContext application;

    private BookApplication getBookApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            BookApplication bookApp= (BookApplication) application.getAttribute("bookApp");
            if (bookApp == null) {
                bookApp = new BookApplication();
                bookApp.setFilePath(application.getRealPath("WEB-INF/books.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTS";
    }
    
    @Path("books")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Books getStdudents() throws JAXBException, IOException, Exception{
        return getBookApp().getBooks();
    }
   	
    @Path("books/{genre}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public ArrayList<Book> getStdudentbyEmail(@PathParam("genre") String genre) throws JAXBException, IOException, Exception{
        return getBookApp().getBooks().getMatches(genre);
    }
	
}
