/*
 Owner George
*/
package uts.controller;
import java.io.*;
import javax.xml.bind.*;
import uts.wsd.*;

public class MovieApp implements Serializable {

    private String filePath;
    private Store store;
    
    public MovieApp() {  
        super();
    }

    public MovieApp(String filePath, Store store) {
        super();
        this.filePath = filePath;
        this.store = store;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws Exception {
        JAXBContext jc = JAXBContext.newInstance(Store.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;        
        FileInputStream fin = new FileInputStream(filePath);
        store = (Store) u.unmarshal(fin); 		
        fin.close();
    }
  
    public void updateXML(Store store, String filePath) throws Exception {
        this.store = store;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Store.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(store, fout);
        fout.close();
    }
    public Store getStore() {
        return store;
    }
    public void setStore(Store store) {
        this.store = store;
    }
}

