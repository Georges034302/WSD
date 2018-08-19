<%@page import="uts.library.*" import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>

<% String filePath = application.getRealPath("WEB-INF/books.xml");%>
<jsp:useBean id="booksApp" class="uts.library.BookApplication" scope="application">
    <jsp:setProperty name="booksApp" property="filePath" value="<%=filePath%>"/>
</jsp:useBean>
<%Books books = booksApp.getBooks();%>
<%
    String genre = request.getParameter("genre");
    String title = request.getParameter("title");
    String status = request.getParameter("status");
    ArrayList<Book> matches = books.getMatches(genre);
%>

<c:set var = "xmltext"> 
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
</c:set>
<c:import url = "file:\\D:\\NetBeans\\NetBeans 8.1\\Projects\\Demo-lec6-XSLT\\build\\web\\xsl\\books.xsl" var = "xslt"/>
<x:transform xml = "${xmltext}" xslt = "${xslt}"></x:transform>

