package uts.library;

import java.io.*;
import javax.xml.bind.annotation.*;

@XmlRootElement(name="book")
@XmlAccessorType(XmlAccessType.FIELD)
public class Book implements Serializable{
    private String title;
    private String genre;
    private int number;
    private int rating;
    private String status;

    public Book() {
        super();
    }  

    public Book(String title, String genre, int number, int rating, String status) {
        this.title = title;
        this.genre = genre;
        this.number = number;
        this.rating = rating;
        this.status = status;
    }
    public void updateDetails(String title, String genre, int number, int rating, String status){
        this.title = title;
        this.genre = genre;
        this.number = number;
        this.rating = rating;
        this.status = status;  
    }    

    public boolean matchAll(String title, String status, String genre){        
        return matchTitle(title)&&matchStatus(status)&&matchGenre(genre);
    }
    
    public boolean matchAny(String title, String status, String genre){ 
        return matchTitle(title)||matchStatus(status)||matchGenre(genre);
    }
    
    public boolean matchStatus(String status){
        return this.status.equalsIgnoreCase(status.toLowerCase().trim());
    }
    
    public boolean matchGenre(String genre){
        return this.genre.equalsIgnoreCase(genre.toLowerCase().trim());
    }
    
    public boolean matchTitle(String title){
        return this.title.equals(title.toLowerCase().trim());
    }
    
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}//end class
