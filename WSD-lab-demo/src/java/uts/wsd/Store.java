package uts.wsd;

import java.io.*;
import java.util.*;
import javax.xml.bind.annotation.*;

@XmlRootElement(name = "store")
@XmlAccessorType(XmlAccessType.FIELD)
public class Store implements Serializable{
    @XmlElement(name = "movies")
    private ArrayList<Movie> movies = new ArrayList<>();

    public Store() {
    }
    public ArrayList<Movie> getMovies() {
        return movies;
    }
    public void addMovie(Movie movie){
        movies.add(movie);
    }
    public void remove(Movie movie){
        movies.remove(movie);
    }
    public void addAll(ArrayList<Movie> list){
        this.movies.addAll(list);
    }
    public void removeAll(ArrayList<Movie> list){
        this.movies.removeAll(list);
    }
    public ArrayList<Movie> getMatches(String genre){
        ArrayList<Movie> matches = new ArrayList<>();
        for(Movie movie:movies)
            if(movie.match(genre))
                matches.add(movie);
        return matches;
    }
}
