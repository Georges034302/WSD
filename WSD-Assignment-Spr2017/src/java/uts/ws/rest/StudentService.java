
package uts.ws.rest;

import java.io.IOException;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.student.Student;
import uts.student.StudentApplication;
import uts.student.Students;

@Path("/studentApp")
public class StudentService {    

    @Context
    private ServletContext application;

    private StudentApplication getStudentApp() throws JAXBException, IOException, Exception {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            StudentApplication studentApp = (StudentApplication) application.getAttribute("studentApp");
            if (studentApp == null) {
                studentApp = new StudentApplication();
                studentApp.setFilePath(application.getRealPath("WEB-INF/students.xml"));
                application.setAttribute("studentApp", studentApp);
            }
            return studentApp;
        }
    }
    @Path("welcome")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String welcome() {
        return "Hello and welcome to UTSTutor";
    }
    
    @Path("students")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Students getStdudents() throws JAXBException, IOException, Exception{
        return getStudentApp().getStudents();
    }

    @Path("students/{email}")
    @GET
    @Produces(MediaType.TEXT_XML)
    public Student getStdudent(@PathParam("email") String email) throws JAXBException, IOException, Exception{
        return getStudentApp().getStudents().getStudent(email);
    }    
   
}
