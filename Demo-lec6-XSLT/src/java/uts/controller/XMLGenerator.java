package uts.controller;

import java.io.Serializable;
import java.io.*;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.util.JAXBSource;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import uts.library.*;

public class XMLGenerator implements Serializable{

    public XMLGenerator() {
        super();
    }    
    
    public void renderHTML(Books books, Writer out) throws TransformerConfigurationException, JAXBException, TransformerException{
        // Create Transformer
        TransformerFactory tf = TransformerFactory.newInstance();
        StreamSource xslt = new StreamSource("\\D:\\NetBeans\\NetBeans 8.1\\Projects\\Demo-lec6-XSLT\\build\\web\\xsl\\books.xsl");
        Transformer transformer = tf.newTransformer(xslt); 
        // Source
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        JAXBSource source = new JAXBSource(jc, books); 
        // Result
        StreamResult result = new StreamResult(out);         
        // Transform
        transformer.transform(source, result);
    }
}
