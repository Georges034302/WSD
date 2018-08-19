package uts.wsd;

/**
 *
 * @author George
 */
public class Student {

    private String name;
    private String email;
    private String password;
    private String dob;
    private String favcol;
    private String ID;

    public Student() {
    }

    public Student(String name, String email,String password,String dob,String favcol,String ID) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;        
        this.ID = ID;
    }

    public void updateDetails(String name, String email, String password, String dob, String favcol){
        this.name = name;
        this.email = email;
        this.password = password;
        this.dob = dob;
        this.favcol = favcol;   
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

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getFavcol() {
        return favcol;
    }

    public void setFavcol(String favcol) {
        this.favcol = favcol;
    }    
    
}//end of class Student
