package uts.library;

import java.io.*;
import java.util.*;
import javax.xml.bind.annotation.*;

@XmlRootElement(name = "books")
@XmlAccessorType(XmlAccessType.FIELD)
public class Books implements Serializable{
    @XmlElement(name = "book")
    private ArrayList<Book> books = new ArrayList<>();

    public Books() {
    }
    public ArrayList<Book> getBooks() {
        return books;
    }
    public void addBook(Book book){
        books.add(book);
    }
    public void remove(Book book){
        books.remove(book);
    }
    public void addAll(ArrayList<Book> list){
        this.books.addAll(list);
    }
    public void removeAll(ArrayList<Book> list){
        this.books.removeAll(list);
    }
    public ArrayList<Book> getMatches(String genre){
        ArrayList<Book> matches = new ArrayList<>();
        for(Book book:books)
            if(book.matchGenre(genre))
                matches.add(book);
        return matches;
    }
}
