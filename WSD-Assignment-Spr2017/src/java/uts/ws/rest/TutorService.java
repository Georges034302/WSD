package uts.ws.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.tutor.Tutor;
import uts.tutor.TutorApplication;
import uts.tutor.Tutors;

@Path("/tutorApp")
public class TutorService {    

    @Context
    private ServletContext application;

    private TutorApplication getTutorApp() throws JAXBException, IOException, Exception {
       
        synchronized (application) {
            TutorApplication tutorApp = (TutorApplication) application.getAttribute("tutorApp");
            if (tutorApp == null) {
                tutorApp = new TutorApplication();
                tutorApp.setFilePath(application.getRealPath("WEB-INF/tutors.xml"));
                application.setAttribute("tutorApp", tutorApp);
            }
            return tutorApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTSTutor";
    }
    
    @Path("tutors")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Tutors getTutors() throws JAXBException, IOException, Exception{
        return getTutorApp().getTutors();
    }

    @Path("tutors/{status}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Tutors getTutortbyStatus(@PathParam("status") String status) throws JAXBException, IOException, Exception{
        return getTutorApp().getTutors().getTutorbyStatus(status);
    }
}

