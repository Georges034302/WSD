/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.booking;

import javax.xml.bind.annotation.*;
import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.time.*;
import java.time.format.DateTimeFormatter;
/**
 *
 * @author George
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "booking")
public class Booking implements Serializable {
   
    @XmlElement(name = "ID")
    private String ID;
    @XmlElement(name = "tutorName")
    private String tutorName;
    @XmlElement(name = "tutorEmail")
    private String tutorEmail;
    @XmlElement(name = "studentName")
    private String studentName;
     @XmlElement(name = "studentEmail")
    private String studentEmail;
    @XmlElement(name = "subject")
    private String subject;
    @XmlElement(name = "status")
    private String status;    
    @XmlElement(name = "date")
    private String date;  

    public Booking() {
    }

   
    public Booking(String tutorName, String tutorEmail,String studentName, String studentEmail,  String subject, String status) {
        this.ID = (new Random().nextInt(999))+"";
        this.tutorName = tutorName;
        this.tutorEmail = tutorEmail;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.subject = subject;
        this.status = status;
        this.date = date();
    }

    private String date(){
         DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate date = LocalDate.now();
        return dtf.format(date);
    }

    public String getTutorEmail() {
        return tutorEmail;
    }

    public void setTutorEmail(String tutorEmail) {
        this.tutorEmail = tutorEmail;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }
    
   public String getTutorName() {
        return tutorName;
    }

    public void setTutorName(String tutorName) {
        this.tutorName = tutorName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    
    public boolean verifyStatus(){
        return status.equalsIgnoreCase("active");
    }
   
}
