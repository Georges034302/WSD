<%@ page contentType="application/xml" import="java.util.*" import="uts.controller.*" %>
<%@ page import="uts.wsd.*" %>

<% String filePath = application.getRealPath("WEB-INF/movies.xml");%>
<jsp:useBean id="movieApp" class="uts.controller.MovieApp" scope="application">
    <jsp:setProperty name="movieApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Store store = movieApp.getStore();%>
<%
    String genre = request.getParameter("genre"); 
    ArrayList<Movie> matches = store.getMatches(genre);  
    Store matchingMovies = new Store();
    matchingMovies.addAll(matches);    
%>
<%
    XMLGenerator generator = new XMLGenerator();    
    if(matchingMovies !=null)
        generator.renderHTML(matchingMovies);
    else
        generator.renderHTML(store);
%>

