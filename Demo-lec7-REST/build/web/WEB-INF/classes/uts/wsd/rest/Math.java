package uts.wsd.rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;
import uts.geometry.Circle;
import uts.geometry.Rectangle;
import uts.geometry.Tools;

@Path("/mathApp")
public class Math {

    @Context
    private UriInfo context;

    public Math() {     
    }
    
    @Path("hello")
    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World";
    }

    @Path("rectangle")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Rectangle rectangle(@QueryParam("width") double width, @QueryParam("height") double height) {
        return new Rectangle(width, height);
    }
    @Path("circle")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Circle circle(@QueryParam("radius") double radius) {
        return new Circle(radius);
    }
    @Path("tools")
    @GET
    @Produces(MediaType.APPLICATION_XML)
    public Tools tools(@QueryParam("n") int n) {
        return new Tools(n);
    }
}
