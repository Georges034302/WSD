
package uts.controller;

import java.io.*;
import javax.xml.bind.*;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import uts.wsd.*;
 
public class Demo {
    
    public static void main(String[] args) throws Exception {
        // XML Data
        
        MovieApp movieApp = new MovieApp();     
        
        String filePath = (new File("D:\\NetBeans\\NetBeans 8.1\\Projects\\lab_demo\\web\\WEB-INF\\movies.xml")).getAbsolutePath();
        movieApp.setFilePath(filePath);
        Store store = movieApp.getStore();
        // Create Transformer
        TransformerFactory tf = TransformerFactory.newInstance();
        StreamSource xslt = new StreamSource("web/movies.xsl");
        Transformer transformer = tf.newTransformer(xslt);
        
        // Source
        JAXBContext jc = JAXBContext.newInstance(Store.class);
        JAXBSource source = new JAXBSource(jc, store); 
        // Result
        StreamResult result = new StreamResult(System.out);         
        // Transform
        transformer.transform(source, result);
    }
 
}
