package uts.wsd;

import java.io.*;
import javax.xml.bind.annotation.*;


@XmlRootElement(name="movie")
@XmlAccessorType(XmlAccessType.FIELD)
public class Movie implements Serializable{
    private String genre;
    private String title;
    private int cdset;
    private int rating;

    public Movie() {
        super();
    }

    public Movie(String genre, String title, int cdset, int rating) {
        this.genre = genre;
        this.title = title;
        this.cdset = cdset;
        this.rating = rating;
    }

    public int getCdset() {
        return cdset;
    }

    public void setCdset(int cdset) {
        this.cdset = cdset;
    }    
    public boolean match(String genre){
        return this.genre.equalsIgnoreCase(genre);
    }
    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
   
    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    } 
}
