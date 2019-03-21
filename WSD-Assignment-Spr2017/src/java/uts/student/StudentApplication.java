/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.student;

import java.io.*;
import java.util.ArrayList;

import javax.xml.bind.*;

public class StudentApplication implements Serializable {

    private String filePath;
    private Students students;

    public StudentApplication() {
        // TODO Auto-generated constructor stub
    }

    public StudentApplication(String filePath, Students students) {
        super();
        this.filePath = filePath;
        this.students = students;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {

        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Unmarshaller u = jc.createUnmarshaller();

        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        students = (Students) u.unmarshal(fin); // This loads the "shop" object		
        fin.close();

    }

    public void updateXML(Students students, String filePath) throws Exception {
        this.students = students;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }
    // For the advanced step, you might consider adding a saveStudents() method here
    // to be used from the welcome.jsp page

    public void saveStudents() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Students.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(students, fout);
        fout.close();
    }

    public Students getStudents() {
        return students;
    }

    public void setStudents(Students students) {
        this.students = students;
    }
    
    public void editStudent(Student student, String name, String password, String dob) throws Exception{
        students.remove(student);
        student.updateDetails(name, password, dob);
        students.addStudent(student);
        updateXML(students,filePath);
    }

}
