package uts.controller;

import java.io.*;
import javax.xml.bind.*;
import uts.library.*;
import uts.wsd.*;

public class TestJAXB implements Serializable {

    public static void main(String[] args) throws Exception {
        Students students = new Students();
        students.addStudent(new Student("120120", "Ryan Heise", "ryan@ryanheise.com", "raynh", "1978-02-01", "blue"));
        students.addStudent(new Student("222111", "Jack Reacher", "jack@hotmail.com", "jackr", "1980-08-01", "red"));
        students.addStudent(new Student("999555", "Laura Smith", "l.smith@gmail.com", "lsmith", "1985-02-01", "green"));

        Books books = new Books();
        books.addBook(new Book("Lord of the rings", "Epic", 1225, 10, "available"));
        books.addBook(new Book("The Matrix", "Sci-Fi", 5599, 9, "available"));
        books.addBook(new Book("House of Cards", "Politics", 7085, 8, "available"));
        //code to convert objects to XML...
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);        
        m.marshal(books, System.out);
    }
}
