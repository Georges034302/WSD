package uts.tutor;

import java.io.PrintWriter;
import java.io.Serializable;
import java.io.Writer;
import javax.xml.bind.annotation.*;
import java.util.ArrayList;
import uts.booking.Booking;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "tutors")
public class Tutors implements Serializable {

    @XmlElement(name = "tutor")
    private ArrayList<Tutor> list = new ArrayList<>();

    public Tutors() {
    }

    
    public ArrayList<Tutor> getList() {
        return list;
    }

    public void addTutor(Tutor tutor) {
        list.add(tutor);
    }

    public void removeTutor(Tutor tutor) {
        list.remove(tutor);
    }

    public Tutor getTutor(String email) {
        for (Tutor tutor : list) {
            if (tutor.getEmail().equals(email)) {
                return tutor;
            }
        }
        return null;
    }

     public Tutor getTutorbySubject(String subject) {
        for (Tutor tutor : list) {
            if (tutor.getSubject().trim().equalsIgnoreCase(subject)) {
                return tutor;
            }
        }
        return null;
    }
     
     public Tutor getTutorbyName(String name) {
        for (Tutor tutor : list) {
            if (tutor.getName().trim().equalsIgnoreCase(name)) {
                return tutor;
            }
        }
        return null;
    }
    public Tutors getTutorbyStatus(String status) {
        Tutors tutors = new Tutors();
        ArrayList<Tutor> statusList = new ArrayList<>();
        for (Tutor tutor : list) {
            if (tutor.getStatus().trim().equalsIgnoreCase(status)) {
                statusList.add(tutor);
            }
        }
        tutors.list = statusList;
        return tutors;
    }

    public Tutor login(String email, String password) {

        for (Tutor tutor : list) {
            if (tutor.getEmail().equals(email) && tutor.getPassword().equals(password)) {
                return tutor;
            }
        }
        return null;
    }

    public void remove(Tutor tutor) {
        list.remove(tutor);
    }

    public boolean exist(Tutor tutor) {
        return list.contains(tutor);
    }

    public void resetTutors(ArrayList<Booking> bookings, String name) {

        for (Booking booking : bookings) {
            if (booking.getStudentName().trim().equalsIgnoreCase(name)) {
                Tutor t = getTutorbyName(booking.getTutorName());
                t.setStatus("available");
            }
        }
    }

    public void resetTutors(ArrayList<Booking> bookings, Tutor tutor) {

        for (Booking booking : bookings) {
            if (booking.getTutorName().equalsIgnoreCase(tutor.getName())) {
                list.remove(tutor);               
            }
        }
    }

    public ArrayList<Tutor> findTutor(String search) {
        ArrayList<Tutor> found = new ArrayList();
        list.stream().filter((tutor) -> (tutor.getStatus().trim().equalsIgnoreCase(search)
                || tutor.getName().trim().equalsIgnoreCase(search)
                || tutor.getSubject().trim().equalsIgnoreCase(search))).forEach((tutor) -> {
            found.add(tutor);
        });
        return found;
    }

    public void print(ArrayList<Tutor> list, Writer sout) {

        PrintWriter out = new PrintWriter(sout);

        out.print("<table  class=\"results_table\" align=\"center\">");
        out.print("\n<thead><th>Name</th><th>Email</th><th>Subject</th><th>Status</th></thead>");

        list.stream().map((tutor) -> {
            String href = tutor.verifyStatus() ? "<a class=\"link\" href=\"booking.jsp?emailSelect=" + tutor.getEmail() + "\" >" + tutor.getName() + "</a>" : tutor.getName();
            out.println("<tr > ");
            out.println("<td>" + href + "</td>");
            return tutor;
        }).map((tutor) -> {
            out.println("<td >" + tutor.getEmail() + "</td>");
            return tutor;
        }).map((tutor) -> {
            out.println("<td >" + tutor.getSubject() + "</td>");
            return tutor;
        }).map((tutor) -> {
            out.println("<td >" + tutor.getStatus() + "</td>");
            return tutor;
        }).forEach((_item) -> {
            out.println("</tr>");
        });
        out.print("</table>");
    }
}
