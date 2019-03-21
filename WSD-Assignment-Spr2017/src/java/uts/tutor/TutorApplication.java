/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.tutor;

import java.io.*;
import java.util.ArrayList;

import javax.xml.bind.*;

public class TutorApplication implements Serializable {

    private String filePath;
    private Tutors tutors;
 
    public TutorApplication() {
        // TODO Auto-generated constructor stub
    }

    public TutorApplication(String filePath, Tutors tutors) {
        super();
        this.filePath = filePath;
        this.tutors = tutors;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {

        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        tutors = (Tutors) u.unmarshal(fin); // This loads the "shop" object		
        fin.close();

    }

    public void updateXML(Tutors tutors, String filePath) throws Exception {
        this.tutors = tutors;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Tutors.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(tutors, fout);
        fout.close();
    }
  
    public Tutors getTutors() {
        return tutors;
    }

    public void setTutors(Tutors tutors) {
        this.tutors = tutors;
    }

     public void editTutor(Tutor tutor, String name, String password, String dob) throws Exception{
        tutors.remove(tutor);
        tutor.updateDetails(name, password, dob);
        tutors.addTutor(tutor);
        updateXML(tutors,filePath);
    }
     
    public void changeStatus(Tutor tutor, String status) throws Exception{
         tutors.remove(tutor);
         tutor.setStatus(status);
         tutors.addTutor(tutor);
         updateXML(tutors,filePath);
    }
}
