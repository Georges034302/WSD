/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.controller;

import java.io.*;
import javax.xml.bind.*;
import uts.student.Student;
import uts.tutor.Tutor;

/**
 *
 * @author George
 */
public class UserApp {

    protected String filePath;
    protected Object objects;

    public UserApp() {

    }

    public UserApp(String filePath, Object objects) {
        super();
        this.filePath = filePath;
        this.objects = objects;
    }

    public void downloadXML(Object objects, String filePath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Object.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        objects = (Object) u.unmarshal(fin); // This loads the "shop" object		
        fin.close();
    }

    public void uploadXML(Object objects, String filePath) throws Exception {
        this.objects = objects;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Object.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(objects, fout);
        fout.close();
    }

    public void saveObject(Object objects, String filePath) throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Object.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(objects, fout);
        fout.close();
    }
    
}
