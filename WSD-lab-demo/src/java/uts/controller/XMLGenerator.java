
package uts.controller;

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
import uts.wsd.*;

/**
 *
 * @author George
 */
public class XMLGenerator implements Serializable{

    public XMLGenerator() {
        super();
    }    
    
    public void renderHTML(Store store) throws TransformerConfigurationException, JAXBException, TransformerException{
        // Create Transformer
        TransformerFactory tf = TransformerFactory.newInstance();
        StreamSource xslt = new StreamSource("web/store.xsl");
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
