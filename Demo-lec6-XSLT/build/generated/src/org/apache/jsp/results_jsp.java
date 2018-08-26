package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import uts.library.*;
import java.util.*;

public final class results_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("application/xml");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n");
      out.write("<?xml-stylesheet type=\"text/xsl\" href=\"xsl/books.xsl\"?>\r\n");
      out.write("\r\n");
      out.write("\r\n");
 String filePath = application.getRealPath("WEB-INF/books.xml");
      out.write('\r');
      out.write('\n');
      uts.library.BookApplication booksApp = null;
      synchronized (application) {
        booksApp = (uts.library.BookApplication) _jspx_page_context.getAttribute("booksApp", PageContext.APPLICATION_SCOPE);
        if (booksApp == null){
          booksApp = new uts.library.BookApplication();
          _jspx_page_context.setAttribute("booksApp", booksApp, PageContext.APPLICATION_SCOPE);
          out.write("\r\n");
          out.write("    ");
          org.apache.jasper.runtime.JspRuntimeLibrary.handleSetProperty(_jspx_page_context.findAttribute("booksApp"), "filePath",
filePath);
          out.write('\r');
          out.write('\n');
        }
      }
      out.write('\r');
      out.write('\n');
Books books = booksApp.getBooks();
      out.write('\r');
      out.write('\n');
        
    String genre = request.getParameter("genre");
    ArrayList<Book> matches = books.getMatches("genre");   

      out.write("\r\n");
      out.write("<books>\r\n");
      out.write("    ");

        for (Book book : matches) {
    
      out.write("\r\n");
      out.write("    <book>\r\n");
      out.write("        <title>");
      out.print( book.getTitle());
      out.write("</title>\r\n");
      out.write("        <genre>");
      out.print( book.getGenre());
      out.write("</genre>\r\n");
      out.write("        <number>");
      out.print( book.getNumber());
      out.write("</number>\r\n");
      out.write("        <rating>");
      out.print( book.getRating());
      out.write("</rating>\r\n");
      out.write("        <status>");
      out.print( book.getStatus());
      out.write("</status>\r\n");
      out.write("    </book>\r\n");
      out.write("    ");
}
      out.write("    \r\n");
      out.write("</books>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
