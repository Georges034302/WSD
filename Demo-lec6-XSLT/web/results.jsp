<%@page contentType="application/xml"%><?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="xsl/books.xsl"?>
<%@page import="uts.library.*" import="java.util.*" %>

<% String filePath = application.getRealPath("WEB-INF/books.xml");%>
<jsp:useBean id="booksApp" class="uts.library.BookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Books books = booksApp.getBooks();%>
<%        
    String genre = request.getParameter("genre");
    ArrayList<Book> matches = books.getMatches(genre);   
%>
<books>
    <%
        for (Book book : matches) {
    %>
    <book>
        <title><%= book.getTitle()%></title>
        <genre><%= book.getGenre()%></genre>
        <number><%= book.getNumber()%></number>
        <rating><%= book.getRating()%></rating>
        <status><%= book.getStatus()%></status>
    </book>
    <%}%>    
</books>

