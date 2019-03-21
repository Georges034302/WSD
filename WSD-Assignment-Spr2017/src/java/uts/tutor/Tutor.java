/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.tutor;

import javax.xml.bind.annotation.*;
import java.io.Serializable;

/**
 *
 * @author George
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "tutor")
public class Tutor implements Serializable {
   
    @XmlElement(name = "email")
    private String email;
    @XmlElement(name = "name")
    private String name;
    @XmlElement(name = "password")
    private String password;
    @XmlElement(name = "type")
    private String type;
    @XmlElement(name = "subject")
    private String subject;
    @XmlElement(name = "status")
    private String status;    
     @XmlElement(name = "dob")
    private String dob;  

     
    public Tutor(String email, String name, String password, String type, String subject, String status,String dob) {
   
        this.email = email;
        this.name = name;
        this.password = password;
        this.type = type;
        this.subject = subject;
        this.status = status;
        this.dob = dob;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public Tutor() {
    }

    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }


    public String getEmail() {
        return email;
    }


    public void setEmail(String email) {
        this.email = email;
    }


    public String getPassword() {
        return password;
    }


    public void setPassword(String password) {
        this.password = password;
    }
    
     public void updateDetails(String name, String password, String dob){        
        this.name = name;
        this.password = password;
        this.dob = dob;        
    }
     
    public boolean verifyStatus(){
        return status.equalsIgnoreCase("available");
    }

}
