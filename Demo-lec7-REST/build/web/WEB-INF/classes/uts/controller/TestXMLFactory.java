
package uts.controller;

import java.io.*;
import javax.xml.bind.*;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import uts.library.*;
 
public class TestXMLFactory {
    
    public static void main(String[] args) throws Exception {
        // XML Data      
        BookApplication bookApp = new BookApplication();
        String filePath = (new File("\\D:\\NetBeans\\NetBeans 8.1\\Projects\\Demo-lec6-XSLT\\build\\web\\WEB-INF\\books.xml")).getAbsolutePath();
        bookApp.setFilePath(filePath);     
        Books books = bookApp.getBooks();
        
        // Create Transformer
        TransformerFactory tf = TransformerFactory.newInstance();
        StreamSource xslt = new StreamSource("web/xsl/books.xsl");
        Transformer transformer = tf.newTransformer(xslt);
        
        // Source
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        JAXBSource source = new JAXBSource(jc, books); 
        // Result
        StreamResult result = new StreamResult(System.out);  
        
        // Transform
        transformer.transform(source, result);
    } 
}
