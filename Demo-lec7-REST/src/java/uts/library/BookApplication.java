
package uts.library;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class BookApplication implements Serializable{
     private String filePath;
     private Books books;

    public BookApplication() {
    }

    public BookApplication(String filePath, Books books) {
        super();
        this.filePath = filePath;
        this.books = books;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, FileNotFoundException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;        
        FileInputStream fin = new FileInputStream(filePath);
        books = (Books) u.unmarshal(fin); 	
        fin.close();
    }
    
     public void updateXML(Books books, String filePath) throws Exception {
        this.books = books;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(books, fout);
        fout.close();
    }
   
    public void saveBooks() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(books, fout);
        fout.close();
    }
    
    public void editBook(Book book,String title, String genre, int number, int rating, String status) throws Exception{
        books.remove(book);
        book.updateDetails(title,genre,number,rating,status);
        books.addBook(book);
        updateXML(books,filePath);
    }

    public Books getBooks() {
        return books;
    }

    public void setBooks(Books books) {
        this.books = books;
    }     
     
}//end class
