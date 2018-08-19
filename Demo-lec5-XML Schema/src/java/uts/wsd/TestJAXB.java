/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

/**
 *
 * @author George
 */

 
import java.io.*;
import javax.xml.bind.*;
 
public class TestJAXB implements Serializable {
 public static void main(String[] args) throws Exception {
  Students students = new Students();
  students.addStudent(new Student("120120","Ryan Heise","ryan@ryanheise.com",  "raynh","1978-02-01","blue"));
  students.addStudent(new Student("222111","Jack Reacher","jack@hotmail.com",  "jackr","1980-08-01","red"));
  students.addStudent(new Student("999555","Laura Smith","l.smith@gmail.com",  "lsmith","1985-02-01","green"));
  // Boilerplate code to convert objects to XML...
  JAXBContext jc = JAXBContext.newInstance(Students.class);
  Marshaller m = jc.createMarshaller();
  m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
 // m.marshal(students, new FileOutputStream(new File("D:\\NetBeans\\NetBeans 8.1\\Projects\\WSD-lab3-XML and JAXB\\build\\web\\WEB-INF\\students.xml")));
  m.marshal(students, System.out);
 }
}
