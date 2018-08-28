<%@page import="uts.library.*" import="java.util.*" %>
<%@page import="uts.controller.XMLGenerator"%>

<% String filePath = application.getRealPath("WEB-INF/books.xml");%>
<jsp:useBean id="booksApp" class="uts.library.BookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Books books = booksApp.getBooks();%>
<%
    XMLGenerator generator = new XMLGenerator();
    String genre = request.getParameter("genre");
    ArrayList<Book> matches = books.getMatches(genre);
    Books matchingBooks = new Books();
    matchingBooks.addAll(matches);
    generator.renderHTML(matchingBooks, out);    
%>

